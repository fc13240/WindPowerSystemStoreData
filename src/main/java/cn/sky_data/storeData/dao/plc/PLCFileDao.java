package cn.sky_data.storeData.dao.plc;

import cn.sky_data.storeData.dao.base.DatabaseUtil;
import cn.sky_data.storeData.dao.machine.impl.MachineInfoDaoImpl;
import cn.sky_data.storeData.model.PLCFile;
import cn.sky_data.storeData.util.PropertiesManage;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Optional;

/**
 * Created by chenhaonee on 2017/5/6.
 */
public class PLCFileDao {
    private static Logger logger = LoggerFactory.getLogger(MachineInfoDaoImpl.class);
    private static PLCFileDao ourInstance = new PLCFileDao();

    private PreparedStatement insertPLC;

    private PropertiesManage propertiesManage;

    public static PLCFileDao getInstance() {
        return ourInstance;
    }

    private PLCFileDao() {
    }

    public boolean save(PLCFile file) {
        boolean success = false;
        for (int i = 0; i < 3; i++) {
            try {
                success = saveOperation(file);
                break;
            } catch (SQLException e) {
                e.printStackTrace();
                continue;
            }
        }
        if (success)
            logger.info("file with name " + file.getFileName() + " stored successfully");
        else {
            logger.warn("file with name " + file.getFileName() + " stored failed");
            plcFileParseToJSON(file).ifPresent(value -> logger.warn("file content is " + value));
        }
        return success;
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

    private boolean saveOperation(PLCFile file) throws SQLException {
        Connection connection = DatabaseUtil.getConnection();
        propertiesManage = PropertiesManage.getInstance();
        String sql = propertiesManage.getPropertyAsString("sql.plc.insert");
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
        connection.commit();
        connection.setAutoCommit(true);
        DatabaseUtil.recycle(connection);
        return true;
    }

}
