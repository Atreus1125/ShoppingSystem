package dao.impl;

import dao.PeopleDAO;
import entity.People;
import util.CustomUtil;
import util.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PeopleDAOImpl implements PeopleDAO {

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    @Override
    public int doInsert(int id, String password, String name, String email, String address, int status) {
        int result = 0;
        String sql = "INSERT INTO `people` VALUES (" +
                id +
                ", '" + password +
                "', '" + name +
                "', '" + email +
                "', '" + address +
                "', '" + status +
                "');";

        connection = JdbcUtil.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            result = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JdbcUtil.closeAll(connection, preparedStatement, resultSet);
        }
        CustomUtil.outPosition("blue", "PeopleDAOImpl.doInsert()");
        CustomUtil.outParameter("blue", "sql", sql);
        CustomUtil.outParameter("blue", "result", String.valueOf(result));

        return result;
    }

    @Override
    public int doDelete(int id, String password) {
        return 0;
    }

    @Override
    public int doUpdate(int id, String password, String name, String email, String address, int status) {
        return 0;
    }

    @Override
    public People findByLogin(int id, String password) {
        People people = new People();
        String sql = "select * from `people` where `id` = '" + id + "' and password = '" + password + "';";

        connection = JdbcUtil.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                people.setId(resultSet.getInt(1));
                people.setPassword(resultSet.getString(2));
                people.setName(resultSet.getString(3));
                people.setEmail(resultSet.getString(4));
                people.setAddress(resultSet.getString(5));
                people.setStatus(resultSet.getInt(6));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JdbcUtil.closeAll(connection, preparedStatement, resultSet);
        }
        CustomUtil.outPosition("blue", "PeopleDAOImpl.findByLogin()");
        CustomUtil.outParameter("blue", "sql", sql);
        CustomUtil.outParameter("blue", "people", people.toString());

        return people;
    }

    public People findById(int id) {
        People people = new People();
        String sql = "select * from `people` where `id` = '" + id + "';";

        CustomUtil.outPosition("blue", "PeopleDaoImpl.findById()");
        CustomUtil.outParameter("blue", "id", String.valueOf(id));

        connection = JdbcUtil.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                people.setId(resultSet.getInt(1));
                people.setPassword(resultSet.getString(2));
                people.setName(resultSet.getString(3));
                people.setEmail(resultSet.getString(4));
                people.setAddress(resultSet.getString(5));
                people.setStatus(resultSet.getInt(6));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JdbcUtil.closeAll(connection, preparedStatement, resultSet);
        }

        CustomUtil.outPosition("blue", "PeopleDAOImpl.findById()");
        CustomUtil.outParameter("blue", "sql", sql);
        CustomUtil.outParameter("blue", "people", people.toString());

        return people;
    }
}
