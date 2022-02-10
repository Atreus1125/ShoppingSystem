package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JdbcUtil;
import entity.Order;
import entity.OrderDetail;

public class OrderDetailDao implements InterfaceOrderDetailDao {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;
	
	@Override
	public int updateOrderDetail(String person_id, String goods_name, int number, int price) {
		String sql = "mistake";
		if (person_id != "") {
			sql = "update `order_detail` set price = '" + price + "', number = '" + number + "' where person_id = '" + person_id + "' and goods_name = '" + goods_name + "';";
		}
		System.out.println("updateOrderDetail()µÄsqlÓï¾ä:" + sql);
		
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
	public List<OrderDetail> findAllOrderDetail(String person_id) {
		String sql = "select * from `order_detail` where person_id = '" + person_id + "';";
		System.out.println(sql);
		
		connection = JdbcUtil.getCon();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			List<OrderDetail> date = new ArrayList<OrderDetail>();
			while (resultSet.next()) {
				OrderDetail orderDetail = new OrderDetail();
				/*int i = resultSet.getInt(1);*/
				orderDetail.setGoods_name(resultSet.getString(2));
				orderDetail.setNumber(resultSet.getInt(3));
				orderDetail.setPrice(resultSet.getInt(4));
				orderDetail.setPerson_id(resultSet.getString(5));
				date.add(orderDetail);
			}
			return date;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.closeAll(connection, preparedStatement, resultSet);
		}
	}

	@Override
	public int insertOrderDetail(String goods_name, int number, int price, String person_id) {
		String sql = "mistake";
		if (person_id != "" ) {
			sql = "insert into `order_detail` (goods_name, number, price, person_id)" + "values('" + goods_name + "','" + 
					number + "','" + price + "','" + person_id + "');";
		}
		System.out.println("insertOrderDetail()µÄsqlÓï¾ä:" + sql);
		
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
	public OrderDetail findOrderDetail(String goods_name, String person_id) {
		String sql = "select * from `order_detail` where goods_name = '" + goods_name + "' and person_id='" + person_id + "';";
		System.out.println(sql);
		
		connection = JdbcUtil.getCon();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			OrderDetail orderDetail = null;
			while (resultSet.next()) {
				orderDetail = new OrderDetail();
				orderDetail.setGoods_name(resultSet.getString(2));
				orderDetail.setNumber(resultSet.getInt(3));
				orderDetail.setPrice(resultSet.getInt(4));
				orderDetail.setPerson_id(resultSet.getString(5));
				// System.out.println(orderDetail.toString());
			}
			return orderDetail;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JdbcUtil.closeAll(connection, preparedStatement, resultSet);
		}
	}

}
