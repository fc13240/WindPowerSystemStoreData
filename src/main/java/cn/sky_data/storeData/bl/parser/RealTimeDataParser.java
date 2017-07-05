package cn.sky_data.storeData.bl.parser;

import cn.sky_data.storeData.bl.configs.DataConfigFactory;
import cn.sky_data.storeData.bl.configs.RealTimeDataConfig;
import cn.sky_data.storeData.bl.configs.RealTimeDataConfigBox;
import cn.sky_data.storeData.util.ByteUtil;
import cn.sky_data.storeData.vo.RealDataParsed;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RealTimeDataParser {
    private Logger logger = LoggerFactory.getLogger(RealTimeDataParser.class);
    private List<RealTimeDataConfig> configs;
    private ByteOrder thisOrder = ByteOrder.LITTLE_ENDIAN;


    public List<RealDataParsed> parse(byte[] value) {
        RealTimeDataConfigBox realTimeDataConfigBox = DataConfigFactory.getDefaultRealTimeDataConfigs();
        int pieces = realTimeDataConfigBox.getPieces();
        configs = realTimeDataConfigBox.getMeasurements();
        DataInputStream dataFromKafka = new DataInputStream(new ByteArrayInputStream(value));

        List<RealDataParsed> dataParsedList = new ArrayList<>();
        for (int i = 0; i < pieces; i++) {
            RealDataParsed item = doParseSegment(dataFromKafka);
            dataParsedList.add(item);
        }
        return dataParsedList;
    }

    /**
     * 处理每一个pieces的数据
     *
     * @param dataFromKafka
     * @return
     */
    private RealDataParsed doParseSegment(DataInputStream dataFromKafka) {
        long timestamp = 0;
        try {
            byte[] time = new byte[8];
            dataFromKafka.read(time);
            timestamp = ByteUtil.bytes2long(time);
        } catch (IOException e) {
            e.printStackTrace();
        }

        Map<String, String> datas = new HashMap<>();
        for (RealTimeDataConfig config : configs) {
            byte[] data = new byte[config.getDataLength()];
            try {
                dataFromKafka.read(data);
                String dataType = config.getDataType();
                String value = parseDataByType(data, dataType);
                datas.put(config.getName(), value);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        RealDataParsed dataParsed = new RealDataParsed(timestamp, datas);
        return dataParsed;
    }

    /**
     * 根据数据类型，对应地解析byte数组
     * @param data 数据
     * @param dataType 数据类型
     * @return String包裹的数据值
     */
    private String parseDataByType(byte[] data, String dataType) {
        String valueWrapper = "";
        switch (dataType) {
            case "long":
                long longValue = ByteBuffer.wrap(data).order(thisOrder).getInt();
                valueWrapper += longValue;
                break;
            case "short":
                int shortValue = ByteBuffer.wrap(data).order(thisOrder).getInt();
                valueWrapper += shortValue;
                break;
            case "boolean":
                int boolValue = ByteBuffer.wrap(data).order(thisOrder).getInt();
                valueWrapper += boolValue;
                break;
            case "float":
                float floatValue = ByteBuffer.wrap(data).order(thisOrder).getFloat();
                valueWrapper += floatValue;
                break;
            case "dword":
                int dwordValue = ByteBuffer.wrap(data).order(thisOrder).getInt();
                valueWrapper += dwordValue;
                break;
            default:
                int unknownValue = ByteBuffer.wrap(data).order(thisOrder).getInt();
                valueWrapper += unknownValue;
                logger.warn("an unknown type as:" + dataType + " and value in int is" + valueWrapper);
                break;
        }
        return valueWrapper;
    }
}