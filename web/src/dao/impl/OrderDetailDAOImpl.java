package dao.impl;

import dao.OrderDetailDAO;
import entity.OrderDetail;
import util.CustomUtil;
import util.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAOImpl implements OrderDetailDAO {

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    @Override
    public int doInsert(int order_index_id, int goods_id, String goods_name, int number, int price) {
        int result = 0;
        String sql = "insert into `order_detail` VALUES (" +
                order_index_id +
                ", " + goods_id +
                ", '" + goods_name +
                "', " + number +
                ", " + price +
                ");";

        connection = JdbcUtil.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            result = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JdbcUtil.closeAll(connection, preparedStatement, resultSet);
        }
        CustomUtil.outPosition("blue", "OrderDetailDAOImpl.insertOrderDetail()");
        CustomUtil.outParameter("blue", "sql", sql);
        CustomUtil.outParameter("blue", "result", String.valueOf(result));

        return result;
    }

    @Override
    public int doUpdate(int order_index_id, int goods_id, int number, int price) {
        int result = 0;
        String sql = "update `order_detail`" +
                " set number = " + number +
                ", price = " + price +
                " where order_index_id = " + order_index_id +
                " and goods_id = " + goods_id +
                ";";

        connection = JdbcUtil.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            result = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JdbcUtil.closeAll(connection, preparedStatement, resultSet);
        }
        CustomUtil.outPosition("blue", "OrderDetailDAOImpl.updateOrderDetail()");
        CustomUtil.outParameter("blue", "sql", sql);
        CustomUtil.outParameter("blue", "result", String.valueOf(result));

        return result;
    }

    @Override
    public List<OrderDetail> findAllById(int order_index_id) {
        List<OrderDetail> orderDetailList = new ArrayList<>();
        String sql = "select * from order_detail where order_index_id = " + order_index_id + ";";

        connection = JdbcUtil.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrder_index_id(resultSet.getInt(1));
                orderDetail.setGoods_id(resultSet.getInt(2));
                orderDetail.setGoods_name(resultSet.getString(3));
                orderDetail.setNumber(resultSet.getInt(4));
                orderDetail.setPrice(resultSet.getInt(5));
                orderDetailList.add(orderDetail);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JdbcUtil.closeAll(connection, preparedStatement, resultSet);
        }
        CustomUtil.outPosition("blue", "OrderDetailDAOImpl.findAllOrderDetail()");
        CustomUtil.outParameter("blue", "sql", sql);
        CustomUtil.outParameter("blue", "orderDetailList.size()", String.valueOf(orderDetailList.size()));

        return orderDetailList;
    }
}
