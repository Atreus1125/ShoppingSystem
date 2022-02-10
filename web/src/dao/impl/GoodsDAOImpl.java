package dao.impl;

import dao.GoodsDAO;
import entity.Goods;
import util.CustomUtil;
import util.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GoodsDAOImpl implements GoodsDAO {

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    @Override
    public Goods findById(int id) {
        Goods goods = new Goods();
        String sql = "select * from `goods` where `id` = '" + id + "';";

        connection = JdbcUtil.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                goods.setId(resultSet.getInt(1));
                goods.setName(resultSet.getString(2));
                goods.setImage(resultSet.getString(3));
                goods.setOld_price(resultSet.getInt(4));
                goods.setNew_price(resultSet.getInt(5));
                goods.setInfo_brief(resultSet.getString(6));
                goods.setInfo_detailed(resultSet.getString(7));
                goods.setInfo_additional(resultSet.getString(8));
                goods.setStatus(resultSet.getInt(9));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            JdbcUtil.closeAll(connection, preparedStatement, resultSet);
        }
        CustomUtil.outPosition("blue", "GoodsDAOImpl.findGoods()");
        CustomUtil.outParameter("blue", "sql", sql);
        CustomUtil.outParameter("blue", "goods", goods.toString());

        return goods;
    }
}
