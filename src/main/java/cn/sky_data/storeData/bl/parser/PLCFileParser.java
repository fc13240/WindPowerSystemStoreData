package cn.sky_data.storeData.bl.parser;

import cn.sky_data.storeData.bl.configs.PLCFileConfig;
import cn.sky_data.storeData.bl.configs.DataConfigFactory;
import cn.sky_data.storeData.dao.DaoFactory;
import cn.sky_data.storeData.model.MachineInfo;
import cn.sky_data.storeData.model.PLCFile;
import cn.sky_data.storeData.util.ByteUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.rowset.serial.SerialBlob;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Created by chenhaonee on 2017/4/19.
 */
public class PLCFileParser {
    private static Logger logger = LoggerFactory.getLogger(PLCFileParser.class);

    private DataInputStream fileToDecode;
    private PLCFile plcFile;

    private PLCFileConfig config;

    public PLCFileParser(String fileType) {
        plcFile = new PLCFile(fileType);
        config = DataConfigFactory.getConfig(fileType);
        // TODO: 2017/6/3 check config != null
    }

    /**
     * 从字节流读取并包装为为DataInputStream
     *
     * @param file
     */
    public void read(byte[] file) {
        fileToDecode = new DataInputStream(new ByteArrayInputStream(file));
        try {
            plcFile.setFileStore(new SerialBlob(file));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void setMachineIPAndFileName(String machineIP, String fileName) {
        Optional<MachineInfo> machineInfo = DaoFactory.getMachineInfoDao().find(machineIP);
        machineInfo.ifPresent(info -> {
            plcFile.setFarmId(info.farmId);
            plcFile.setMachineId(info.machineId);
        });
        plcFile.setFileName(fileName);
    }

    /**
     * 处理字节流
     */
    public PLCFile decode() {
        DataInputStream in = getFileToDecode();
        byte[] body = new byte[config.getBodyUnitSize()];
        List<byte[]> bodys = new ArrayList<>();
        try {
            in.skipBytes(config.getHeadSize());
            while (true) {
                int result = ByteUtil.read(in, body, 0, body.length);
                if (result == -1)
                    break;
                else
                    bodys.add(body);
            }
            int from = config.getTimestampStartIndex();
            int to = config.getTimestampStartIndex() + config.getTimestampSize() - 1;
            plcFile.setFirstRecordTimestamp(getTimeofDay(sublist(from, to, bodys.get(0))));
            plcFile.setLastRecordTimestamp(getTimeofDay(sublist(from, to, bodys.get(bodys.size() - 1))));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return plcFile;
    }

    private DataInputStream getFileToDecode() {
        return fileToDecode;
    }

    private byte[] sublist(int from, int to, byte[] origin) {
        byte[] now = new byte[to - from + 1];
        System.arraycopy(origin, from, now, 0, now.length);
        return now;
    }

    private Timestamp getTimeofDay(byte[] bytes) {
        long timeofday = ByteUtil.bytes2long(new byte[]{bytes[0], bytes[1], bytes[2], bytes[3], bytes[4], bytes[5], bytes[6], bytes[7]});
        return new Timestamp(timeofday * 1000);
    }
}
