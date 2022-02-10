package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JdbcUtil;
import entity.Goods;

public class GoodsDao implements InterfaceGoodsDao {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;
	
	@Override
	public Goods findGoods(String id) {
		String sql = "select * from goods where id ='" + id + "';";
		System.out.println("findGoods()µÄsqlÓï¾ä:" + sql);
		
		Goods goods = null;
		connection = JdbcUtil.getCon();
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				goods = new Goods();
				goods.setId(resultSet.getString(1));
				goods.setPicture(resultSet.getString(2));
				goods.setName(resultSet.getString(3));
				goods.setExplain(resultSet.getString(4));
				goods.setPrice(Integer.parseInt(resultSet.getString(5)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(connection, preparedStatement, resultSet);
		}
		return goods;
	}

}
