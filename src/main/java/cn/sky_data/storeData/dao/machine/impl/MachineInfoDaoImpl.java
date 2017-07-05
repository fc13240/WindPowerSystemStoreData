package cn.sky_data.storeData.dao.machine.impl;

import cn.sky_data.storeData.dao.base.DatabaseUtil;
import cn.sky_data.storeData.dao.machine.MachineInfoDao;
import cn.sky_data.storeData.model.MachineInfo;
import cn.sky_data.storeData.util.PropertiesManage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Optional;

/**
 * Created by chenhaonee on 2017/5/6.
 */
public class MachineInfoDaoImpl implements MachineInfoDao {
    private static Logger logger = LoggerFactory.getLogger(MachineInfoDaoImpl.class);

    private PropertiesManage propertiesManage;

    public MachineInfoDaoImpl() {
        propertiesManage = PropertiesManage.getInstance();
    }

    public Optional<MachineInfo> find(String ip) {
        MachineInfo machineInfo = null;
        try {
            Connection connection = DatabaseUtil.getConnection();
            String sql = propertiesManage.getPropertyAsString("sql.findMachineInfoByMachineIP");
            PreparedStatement findMachineInfoByMachineIP = connection.prepareStatement(sql);
            findMachineInfoByMachineIP.setString(1, ip);
            ResultSet resultSet = findMachineInfoByMachineIP.executeQuery();
            while (resultSet.next())
                machineInfo = new MachineInfo(resultSet.getShort(1), resultSet.getShort(2));
            DatabaseUtil.recycle(connection);
        } catch (Exception e) {
            e.printStackTrace();
            logger.warn("寻找ip为"+ip+"的机器时，数据库连接异常");
        }
        return Optional.ofNullable(machineInfo);
    }

}
