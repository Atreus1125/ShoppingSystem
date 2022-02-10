package service;

import entity.OrderDetail;
import entity.OrderIndex;

import java.util.List;

public interface OrderService {

    /**
     * 插入订单索引信息
     * @return
     */
    public abstract int addOrderIndex(OrderIndex orderIndex);

    /**
     * 插入订单详情信息
     * @return
     */
    public abstract boolean addOrderDetail(OrderDetail orderDetail);

    /**
     * 查找用户的所有订单
     * @return
     */
    public abstract List<OrderIndex> findAllByPersonId(int person_id);

    /**
     * 查找订单的所有信息
     * @return
     */
    public abstract List<OrderDetail> findAllByOrderIndexId(int order_index_id);
}
