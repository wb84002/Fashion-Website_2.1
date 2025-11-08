package tw.com.fw.databaseutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    //private static final String JDBC_URL = 
    //   "jdbc:mysql://127.0.0.1:3306/fw?useSSL=false&serverTimezone=Asia/Taipei&characterEncoding=UTF-8";
    private static final String JDBC_URL = 
    		"jdbc:mysql://127.0.0.1:3306/fw?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Taipei&characterEncoding=UTF-8";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "123456";

    private Connection conn;

    public DBUtils() {
        try {
            // 載入 MySQL Driver
            Class.forName(JDBC_DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static DBUtils getDataBase() {
        return new DBUtils();
    }

    public Connection getConnection() {
        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
