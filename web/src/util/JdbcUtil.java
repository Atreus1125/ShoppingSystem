package util;

import java.sql.*;

public class JdbcUtil {
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String url =
            "jdbc:mysql://localhost:3306/shoppingsystem?characterEncoding=utf-8";//连接字符串
    private static final String user = "root";
    private static final String password = "123";

    private static Connection connection;

    /**
     * 建立连接
     * @return 返回获得的连接
     */
    public static Connection getConnection() {
        try {
            Class.forName(driver);//通过反射机制加载驱动
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            connection = DriverManager.getConnection(url, user, password);//获得连接
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return connection;
    }

    /**
     * 关闭连接
     */
    public static void closeAll(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
