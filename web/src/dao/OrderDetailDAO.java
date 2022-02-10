package dao;

import entity.OrderDetail;

import java.util.List;

public interface OrderDetailDAO {

    /**
     * 插入订单详情信息
     * @return 插入行数
     */
    public abstract int doInsert(int order_index_id, int goods_id, String goods_name, int number, int price);

    /**
     * 根据订单编号和商品编号修改订单详情信息中的数量与价格
     * @return 修改行数
     */
    public abstract int doUpdate(int order_index_id, int goods_id, int number, int price);

    /**
     * 根据订单编号查询订单详情信息
     * @return 该订单的全部订单详情实体的数组
     */
    public abstract List<OrderDetail> findAllById(int order_index_id);
}
