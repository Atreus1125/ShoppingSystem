package service.impl;

import dao.OrderDetailDAO;
import dao.OrderIndexDAO;
import dao.impl.OrderDetailDAOImpl;
import dao.impl.OrderIndexDAOImpl;
import entity.OrderDetail;
import entity.OrderIndex;
import service.OrderService;

import java.util.List;

public class OrderServiceImpl implements OrderService {

    OrderIndexDAO orderIndexDAO = new OrderIndexDAOImpl();
    OrderDetailDAO orderDetailDAO = new OrderDetailDAOImpl();

    @Override
    public int addOrderIndex(OrderIndex orderIndex) {
        return orderIndexDAO.doInsert(orderIndex.getPerson_id(), orderIndex.getPrice(),
                orderIndex.getAddress(), orderIndex.getDate(), orderIndex.getStatus());
    }

    @Override
    public boolean addOrderDetail(OrderDetail orderDetail) {
        if (orderDetailDAO.doInsert(orderDetail.getOrder_index_id(), orderDetail.getGoods_id(),
                orderDetail.getGoods_name(), orderDetail.getNumber(), orderDetail.getPrice()) == 1)
            return true;
        return false;
    }

    @Override
    public List<OrderIndex> findAllByPersonId(int person_id) {
        return orderIndexDAO.findAllById(person_id);
    }

    @Override
    public List<OrderDetail> findAllByOrderIndexId(int order_index_id) {
        return orderDetailDAO.findAllById(order_index_id);
    }
}
