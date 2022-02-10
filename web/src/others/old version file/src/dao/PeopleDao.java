package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import common.JdbcUtil;
import entity.People;

public class PeopleDao implements InterfacePeopleDao {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;

	@Override
	public int insertPeople(String id, String password, String name, String email, String address) {
		String sql = "mistake";
		if (id != "" && password != "" && name != "" && email != "" && address != "") {
			sql = "insert into people (id, password, name, email, address)" + "values('" + id + "','" + 
					password + "','" + name + "','" + email + "','" + address + "');";
		}
		System.out.println("insertPeople()µÄsqlÓï¾ä:" + sql);
		
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
	public int deletePeople(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePeople(String id, String password, String name, String email, String address) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public People checkPeople(String id, String password) {
		String sql = null;
		if (id != null && password != null) {
			sql = "select * from people where id = '" + id + "' and password = '" + password + "'";
		}
		System.out.println("checkPeople()µÄsqlÓï¾ä:" + sql);
		
		People people = null;
		connection = JdbcUtil.getCon();
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				people = new People();
				people.setId(resultSet.getString(1));
				people.setPassword(resultSet.getString(2));
				people.setName(resultSet.getString(3));
				people.setEmail(resultSet.getString(4));
				people.setAddress(resultSet.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(connection, preparedStatement, resultSet);
		}
		return people;
	}

	@Override
	public List<People> findAllPeople() {
		// TODO Auto-generated method stub
		return null;
	}

}
