package dao;

import entity.Goods;

public interface GoodsDAO {

    /**
     * 根据商品编号查询商品
     * @return 查询到的商品实体
     */
    public abstract Goods findById(int id);
}