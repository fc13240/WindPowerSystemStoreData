package cn.sky_data.storeData.dao.machine.impl;

import cn.sky_data.storeData.dao.base.DatabaseUtil;
import cn.sky_data.storeData.dao.machine.OffsetDao;
import cn.sky_data.storeData.model.MachineInfo;
import cn.sky_data.storeData.model.Offset;
import cn.sky_data.storeData.util.PropertiesManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Created by chenhaonee on 2017/6/14.
 */
public class OffsetDaoImpl implements OffsetDao{
    @Override
    public Optional<List<Offset>> findAll() {
        List<Offset> offsets = new ArrayList<>();
        PropertiesManage propertiesManage = PropertiesManage.getInstance();
        try {
            Connection connection = DatabaseUtil.getConnection();
            String sql = propertiesManage.getPropertyAsString("sql.offset.findAll");
            PreparedStatement findAllOffset = connection.prepareStatement(sql);
            ResultSet resultSet = findAllOffset.executeQuery();

            while (resultSet.next()){
                Offset offset = new Offset(resultSet.getString(1),resultSet.getInt(2),resultSet.getLong(3));
                offsets.add(offset);
            }
            DatabaseUtil.recycle(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Optional.of(offsets);
    }

    @Override
    public void save(Offset o) {

    }
}
