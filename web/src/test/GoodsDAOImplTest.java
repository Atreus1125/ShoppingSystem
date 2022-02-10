package test;

import dao.GoodsDAO;
import dao.impl.GoodsDAOImpl;
import entity.Goods;
import org.junit.jupiter.api.Test;

class GoodsDAOImplTest {

    @Test
    void findById() {
        GoodsDAO goodsDAO = new GoodsDAOImpl();
        Goods goods = goodsDAO.findById(101);
        System.out.println(goods.toString());
    }
}