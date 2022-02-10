package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JdbcUtil;
import entity.Order;

public class OrderDao implements InterfaceOrderDao {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;
	
	@Override
	public int insertOrder(String person_id, String person_name, String address, int sumprice) {
		String sql = "mistake";
		if (person_id != "" && person_id != "" && address != "") {
			sql = "insert into `order` (person_id, person_name, address, sumprice)" + "values('" + person_id + "','" + 
					person_name + "','" + address + "','" + sumprice + "');";
		}
		System.out.println("insertOrder()µÄsqlÓï¾ä:" + sql);
		
		int result = 0;
		connection = JdbcUtil.getCon();
		try {
			preparedStatement = connection.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JdbcUtil.closeAll(connection, preparedStatement, resultSet);
		return result;
	}

	@Override
	public int updateOrder(String person_id, int sumprice) {
		String sql = "mistake";
		if (person_id != "") {
			sql = "update `order` set sumprice = '" + sumprice + "' where person_id = '" + person_id + "';";
		}
		System.out.println("updateOrder()µÄsqlÓï¾ä:" + sql);
		
		int result = 0;
		connection = JdbcUtil.getCon();
		try {
			preparedStatement = connection.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JdbcUtil.closeAll(connection, preparedStatement, resultSet);
		return result;
	}

	@Override
	public Order findOrder(String person_id) {
		String sql = "select * from `order` where person_id = '" + person_id + "';";
		System.out.println(sql);
		
		connection = JdbcUtil.getCon();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			Order order = new Order();
			while (resultSet.next()) {
				order.setPerson_id(resultSet.getString(1));
				order.setPerson_name(resultSet.getString(2));
				order.setAddress(resultSet.getString(3));
				order.setSumprice(Integer.parseInt(resultSet.getString(4)));
			}
			return order;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.closeAll(connection, preparedStatement, resultSet);
		}
	}
	
}
