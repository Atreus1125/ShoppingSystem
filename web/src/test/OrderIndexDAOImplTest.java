package test;

import dao.OrderIndexDAO;
import dao.impl.OrderIndexDAOImpl;
import entity.OrderIndex;
import org.junit.jupiter.api.Test;

import java.util.Date;
import java.util.List;

class OrderIndexDAOImplTest {

    @Test
    void doInsert() {
        OrderIndexDAO orderIndexDAO = new OrderIndexDAOImpl();
        int result = orderIndexDAO.doInsert(
                2022101,
                8999,
                "诺克萨斯",
                new Date(),
                0);
        System.out.println(result);
    }

    @Test
    void doUpdate() {
    }

    @Test
    void findById() {
        OrderIndexDAO orderIndexDAO = new OrderIndexDAOImpl();
        OrderIndex orderIndex = orderIndexDAO.findById(103);
        System.out.println(orderIndex.toString());
    }

    @Test
    void findAllById() {
        OrderIndexDAO orderIndexDAO = new OrderIndexDAOImpl();
        List<OrderIndex> orderIndexList = orderIndexDAO.findAllById(2022107);
        for (OrderIndex curse : orderIndexList) {
            System.out.println(curse.toString());
        }
    }
}