package cn.sky_data.storeData.dao.base;

import cn.sky_data.storeData.util.PropertiesManage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Queue;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Created by chenhaonee on 2017/4/15.
 */
public class DatabaseUtil {
    private static PropertiesManage propertiesManage = PropertiesManage.getInstance();

    private static final String DB_DRIVER = propertiesManage.getPropertyAsString("database.postgres.driver");
    private static final String DB_URL = propertiesManage.getPropertyAsString("database.postgres.url");
    private static final String DB_USER = propertiesManage.getPropertyAsString("database.postgres.user");
    private static final String DB_PASS = propertiesManage.getPropertyAsString("database.postgres.pwd");

    /**
     * 最大连接数
     */
    private static final int MAX_CONNECTION = propertiesManage.getPropertyAsInt("database.postgres.max").getAsInt();

    /**
     * 可用连接池
     */
    private static Queue<Connection> connections = new ArrayBlockingQueue<>(MAX_CONNECTION);

    /**
     * 当前连接数
     */
    private static int currentConnections = 0;

    private static final ReentrantLock lock = new ReentrantLock();

    static private Condition noAvalibleConnection = lock.newCondition();

    private static int inWaitThreads = 0;

    public static Connection getConnection() {
        lock.lock();
        try {
            return connections.size() != 0 ? connections.poll() : createConnection();
        } finally {
            lock.unlock();
        }
    }

    private static Connection createConnection() {
        assert lock.getHoldCount() == 1;
        Connection con;
        if (currentConnections < MAX_CONNECTION) {
            try {
                Class.forName(DB_DRIVER);
                con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                currentConnections++;
                return con;
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                return null;
            }
        } else {
            inWaitThreads++;
            noAvalibleConnection.awaitUninterruptibly();
            return connections.poll();
        }
    }

    public static void recycle(Connection con) {
        lock.lock();
        try {
            if (con != null && (!con.isClosed())) {
                connections.add(con);
                if (inWaitThreads != 0)
                    noAvalibleConnection.signal();
            } else
                currentConnections--;
        } catch (SQLException e) {
            currentConnections--;
        } finally {
            lock.unlock();
        }
    }

}
