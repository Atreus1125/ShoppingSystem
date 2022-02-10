package dao.impl;

import dao.OrderIndexDAO;
import entity.OrderIndex;
import util.CustomUtil;
import util.JdbcUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderIndexDAOImpl implements OrderIndexDAO {

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    @Override
    public int doInsert(int person_id, int price, String address, Date date, int status) {
        int result = 0;
        String sql = "INSERT INTO `order_index` VALUES (" +
                "0" +
                ", " + person_id +
                ", " + price +
                ", '" + address +
                "', '" + new java.sql.Timestamp(date.getTime()) +
                "', " + status +
                ");";

        connection = JdbcUtil.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);//获取返回的id主键
            preparedStatement.executeUpdate();
            resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                result = resultSet.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JdbcUtil.closeAll(connection, preparedStatement, resultSet);
        }
        CustomUtil.outPosition("blue", "OrderIndexDAOImpl.insertOrder()");
        CustomUtil.outParameter("blue", "sql", sql);
        CustomUtil.outParameter("blue", "result", String.valueOf(result));

        return result;
    }

    @Override
    public int doUpdate(int id, int person_id, int price, String address, Date date, int status) {
        return 0;
    }

    @Override
    public OrderIndex findById(int id) {
        OrderIndex orderIndex = new OrderIndex();
        String sql = "select * from `order_index` where `id` = " + id + ";";

        connection = JdbcUtil.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                orderIndex.setId(resultSet.getInt(1));
                orderIndex.setPerson_id(resultSet.getInt(2));
                orderIndex.setPrice(resultSet.getInt(3));
                orderIndex.setAddress(resultSet.getString(4));
                orderIndex.setDate(resultSet.getTimestamp(5));
                orderIndex.setStatus((resultSet.getInt(6)));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JdbcUtil.closeAll(connection, preparedStatement, resultSet);
        }
        CustomUtil.outPosition("blue", "OrderIndexDAOImpl.findOrderIndex()");
        CustomUtil.outParameter("blue", "sql", sql);
        CustomUtil.outParameter("blue", "orderIndex", orderIndex.toString());

        return orderIndex;
    }

    @Override
    public List<OrderIndex> findAllById(int person_id) {
        List<OrderIndex> orderIndexList = new ArrayList<>();
        String sql = "select * from order_index where person_id = " + person_id + ";";

        connection = JdbcUtil.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderIndex orderIndex = new OrderIndex();
                orderIndex.setId(resultSet.getInt(1));
                orderIndex.setPerson_id(resultSet.getInt(2));
                orderIndex.setPrice(resultSet.getInt(3));
                orderIndex.setAddress(resultSet.getString(4));
                orderIndex.setDate(resultSet.getTimestamp(5));
                orderIndex.setStatus((resultSet.getInt(6)));
                orderIndexList.add(orderIndex);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JdbcUtil.closeAll(connection, preparedStatement, resultSet);
        }
        CustomUtil.outPosition("blue", "OrderIndexDAOImpl.findAllOrderIndex()");
        CustomUtil.outParameter("blue", "sql", sql);
        CustomUtil.outParameter("blue", "orderIndexList.size()", String.valueOf(orderIndexList.size()));

        return orderIndexList;
    }
}
