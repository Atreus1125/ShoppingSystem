package test;

import dao.OrderDetailDAO;
import dao.impl.OrderDetailDAOImpl;
import entity.OrderDetail;
import org.junit.jupiter.api.Test;

import java.util.List;

class OrderDetailDAOImplTest {

    @Test
    void doInsert() {
        OrderDetailDAO orderDetailDAO = new OrderDetailDAOImpl();
        int result = orderDetailDAO.doInsert(103, 105, "HUAWEI Mate 40 Pro+ 5G",1, 8999);
        System.out.println(result);
    }

    @Test
    void doUpdate() {
        OrderDetailDAO orderDetailDAO = new OrderDetailDAOImpl();
        int result = orderDetailDAO.doUpdate(103, 105, 2, 17998);
        System.out.println(result);
    }

    @Test
    void findAllById() {
        OrderDetailDAO orderDetailDAO = new OrderDetailDAOImpl();
        List<OrderDetail> orderDetailList = orderDetailDAO.findAllById(103);
        for (OrderDetail curse : orderDetailList) {
            System.out.println(curse.toString());
        }
    }
}