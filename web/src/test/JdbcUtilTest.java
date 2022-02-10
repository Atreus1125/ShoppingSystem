package test;

import util.JdbcUtil;

import java.sql.Connection;

public class JdbcUtilTest {

    public static void main(String[] args) {
        Connection connection = null;
        connection = JdbcUtil.getConnection();
        System.out.println(connection);
        if (connection != null) {
            JdbcUtil.closeAll(connection, null, null);
        }
    }
}
