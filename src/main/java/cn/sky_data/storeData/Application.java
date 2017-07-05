package cn.sky_data.storeData;

import cn.sky_data.storeData.dao.CommonDao;
import cn.sky_data.storeData.dao.DaoFactory;
import cn.sky_data.storeData.dao.machine.OffsetDao;
import cn.sky_data.storeData.dao.machine.impl.OffsetDaoImpl;
import cn.sky_data.storeData.model.MachineInfo;
import cn.sky_data.storeData.model.Offset;
import cn.sky_data.storeData.model.PLCFile;
import cn.sky_data.storeData.util.PropertiesManage;
import cn.sky_data.storeData.vo.RealDataParsed;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.common.TopicPartition;
import org.apache.spark.SparkConf;
import org.apache.spark.streaming.Durations;
import org.apache.spark.streaming.api.java.JavaInputDStream;
import org.apache.spark.streaming.api.java.JavaStreamingContext;
import org.apache.spark.streaming.kafka010.*;
import cn.sky_data.storeData.bl.parser.RealTimeDataParser;
import cn.sky_data.storeData.dao.TSDBUtil;
import cn.sky_data.storeData.bl.parser.PLCFileParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.Serializable;
import java.util.*;

/**
 * Created by chenhaonee on 2017/4/25.
 */
public class Application implements Serializable {
    private static Logger logger = LoggerFactory.getLogger(Application.class);

    public static void main(String[] args) {
        Application application = new Application();
        application.run();
    }

    public void run() {
        PropertiesManage propertiesManage = PropertiesManage.getInstance();
        Map<String, Object> kafkaParams = new HashMap<>();
        kafkaParams.put("bootstrap.servers", propertiesManage.getPropertyAsString("kafkaParams.bootstrap.servers"));
        kafkaParams.put("key.deserializer", propertiesManage.getPropertyAsString("kafkaParams.key.deserializer"));
        kafkaParams.put("value.deserializer", propertiesManage.getPropertyAsString("kafkaParams.value.deserializer"));
        kafkaParams.put("group.id", propertiesManage.getPropertyAsString("kafkaParams.group.id"));
        kafkaParams.put("auto.offset.reset", propertiesManage.getPropertyAsString("kafkaParams.auto.offset.reset"));
        kafkaParams.put("enable.auto.commit", propertiesManage.getPropertyAsBoolean("kafkaParams.enable.auto.commit"));
        Collection<String> topics = Arrays.asList(propertiesManage.getPropertyAsStringArray("kafkaParams.topics"));

        SparkConf conf = new SparkConf()
                .setMaster(propertiesManage.getPropertyAsString("spark.master.url"))
                .setAppName(propertiesManage.getPropertyAsString("spark.app.name"))
                .set("spark.streaming.backpressure.enabled", "true");
        //the batch processing time should be less than the batch interval
        JavaStreamingContext jssc = new JavaStreamingContext(conf, Durations.seconds(10));

        OffsetDao offsetDao = new OffsetDaoImpl();
        Optional<List<Offset>> currentOffset = offsetDao.findAll();
        List<Offset> offsets = currentOffset.orElseGet(null);

        //from the origin code by ConsumerStrategies<>.Subscribe, fromOffsets can be null safely
        Map<TopicPartition, Long> fromOffsets = new HashMap<>();
        for (Offset resultSet : offsets)
            fromOffsets.put(new TopicPartition(resultSet.getTopic(), resultSet.getPartition()), resultSet.getOffset());

        final JavaInputDStream<ConsumerRecord<String, byte[]>> stream =
                KafkaUtils.createDirectStream(
                        jssc,
                        LocationStrategies.PreferConsistent(),
                        ConsumerStrategies.<String, byte[]>Subscribe(topics, kafkaParams, fromOffsets)
                );
        stream.foreachRDD(rdd -> {
            //from here, all execute in Driver
            logger.info("--- New RDD with " + rdd.partitions().size() + " partitions and " + rdd.count() + " records");
            if (rdd.count() != 0) {
                try {
                    rdd.foreachPartition(p -> {
                        TSDBUtil.initConnection();
                        while (p.hasNext())
                            doSomething(p.next());
                    });
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        jssc.start();
        try {
            jssc.awaitTermination();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    /**
     * 业务操作
     */
    public static void doSomething(ConsumerRecord<String, byte[]> record) {
        String key = record.key();
        byte[] value = record.value();
        Offset currentOffset = new Offset(record.topic(), record.partition(), record.offset());

        logger.info("A file from " + key + " will be processed");
        PropertiesManage propertiesManage = PropertiesManage.getInstance();
        String[] keys = key.split("\\\\");
        boolean isPLCFile = Arrays.stream(keys)
                .anyMatch(s -> s.equals(propertiesManage.getPropertyAsString("flume.plcDirectory")));
        if (isPLCFile) {
            logger.info("This file is an PLC File");
            String machineIP = keys[keys.length - 2];
            String logType = keys[keys.length - 1].split("_")[0];
            logType = logType.toLowerCase();
            PLCFileParser plcFileParser = new PLCFileParser(logType);
            plcFileParser.setMachineIPAndFileName(machineIP, keys[keys.length - 1]);
            plcFileParser.read(value);

            PLCFile file = plcFileParser.decode();
            DaoFactory.getCommonDao().commit(file, currentOffset);
        } else {
            logger.info("This file is an RealTimeData File");
            RealTimeDataParser ds = new RealTimeDataParser();
            String machineIP = keys[keys.length - 2];

            Optional<MachineInfo> machineInfo = DaoFactory.getMachineInfoDao().find(machineIP);
            machineInfo.ifPresent(info -> {
                CommonDao commonDao = DaoFactory.getCommonDao();
                TSDBUtil ts = new TSDBUtil(propertiesManage.getPropertyAsString("database.tsdb.url"));

                List<RealDataParsed> realDataParsedList = ds.parse(value);
                realDataParsedList.forEach(realDataParsed -> commonDao.commit(ts, info.machineId, realDataParsed, currentOffset));
            });
        }
    }
}
