package cn.sky_data.storeData.dao;

import cn.sky_data.storeData.dao.base.DatabaseUtil;
import cn.sky_data.storeData.model.Offset;
import cn.sky_data.storeData.model.PLCFile;
import cn.sky_data.storeData.util.PropertiesManage;
import cn.sky_data.storeData.vo.RealDataParsed;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.util.Optional;

import static cn.sky_data.storeData.util.PropertiesManage.propertiesManage;

/**
 * Created by chenhaonee on 2017/6/14.
 */
public class CommonDaoImpl implements CommonDao {
    private static Logger logger = LoggerFactory.getLogger(CommonDaoImpl.class);

    public void commit(PLCFile file, Offset offset) {
        boolean success = false;
        for (int i = 0; i < 3; i++) {
            success = save(file, offset);
            if (success)
                break;
        }
        if (success)
            logger.info("file with name " + file.getFileName() + " stored successfully");
        else {
            logger.warn("file with name " + file.getFileName() + " stored failed");
            plcFileParseToJSON(file).ifPresent(value -> logger.warn("file content is " + value));
        }
    }

    @Override
    public void commit(TSDBUtil dbUtil, short id, RealDataParsed value, Offset offset) {
        boolean ifSuccess = dbUtil.save(id, value);
        if (ifSuccess) {
            Connection connection = DatabaseUtil.getConnection();
            try {
                doUpdateOffset(connection, offset);
            } catch (SQLException e) {
                logger.error("Real data file uploads successfully but offset update failed! " + "The location is: Topic:" + offset.getTopic() + " Partition:" + offset.getPartition() + " Offset:" + offset.getOffset());
                e.printStackTrace();
            } finally {
                DatabaseUtil.recycle(connection);
            }
        }
    }

    private boolean save(PLCFile file, Offset offset) {
        boolean isSuccess = false;
        PreparedStatement insertPLC;
        PropertiesManage propertiesManage;
        Connection connection = DatabaseUtil.getConnection();
        propertiesManage = PropertiesManage.getInstance();
        String sql = propertiesManage.getPropertyAsString("sql.plc.insert");
        try {
            connection.setAutoCommit(false);
            insertPLC = connection.prepareStatement(sql);
            insertPLC.setShort(1, file.getFarmId());
            insertPLC.setString(2, file.getFileName());
            insertPLC.setBlob(3, file.getFileStore());
            insertPLC.setString(4, file.getFileType());
            insertPLC.setShort(6, file.getMachineId());
            insertPLC.setTimestamp(5, file.getFirstRecordTimestamp());
            insertPLC.setTimestamp(7, file.getLastRecordTimestamp());
            insertPLC.executeUpdate();
            doUpdateOffset(connection, offset);
            connection.commit();
            connection.setAutoCommit(true);
            isSuccess = true;
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DatabaseUtil.recycle(connection);
        }
        return isSuccess;
    }

    private Optional<String> plcFileParseToJSON(PLCFile file) {
        ObjectMapper objectMapper = new ObjectMapper();
        String content = null;
        try {
            content = objectMapper.writeValueAsString(file);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return Optional.ofNullable(content);
    }

    //set public only for test
    public void doUpdateOffset(Connection connection, Offset offset) throws SQLException {
        PreparedStatement statement = null;
        statement = connection.prepareStatement(propertiesManage.getPropertyAsString("sql.offset.find"));
        statement.setString(1, offset.getTopic());
        statement.setInt(2, offset.getPartition());
        ResultSet results = statement.executeQuery();
        if (results.next()) {
            statement = connection.prepareStatement(propertiesManage.getPropertyAsString("sql.offset.update"));
            statement.setLong(1, offset.getOffset());
            statement.setString(2, offset.getTopic());
            statement.setInt(3, offset.getPartition());
            statement.executeUpdate();
        }else {
            statement = connection.prepareStatement(propertiesManage.getPropertyAsString("sql.offset.new"));
            statement.setString(1, offset.getTopic());
            statement.setInt(2, offset.getPartition());
            statement.setLong(3, offset.getOffset());
            statement.executeUpdate();
        }
    }
}
