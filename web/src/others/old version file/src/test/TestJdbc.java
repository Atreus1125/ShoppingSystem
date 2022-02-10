package test;

import java.sql.Connection;
import java.sql.SQLException;

import common.JdbcUtil;

public class TestJdbc {
	public static void main(String[] args) {
		Connection connection = null;
		connection = JdbcUtil.getCon();
		System.out.println(connection);
		if (connection != null) {
			JdbcUtil.closeAll(connection, null, null);
		}
	}
}
