package service.impl;

import dao.GoodsDAO;
import dao.impl.GoodsDAOImpl;
import entity.Goods;
import service.GoodsService;

public class GoodsServiceImpl implements GoodsService {

    private GoodsDAO goodsDAO = new GoodsDAOImpl();

    @Override
    public Goods find(int id) {
        return goodsDAO.findById(id);
    }
}
