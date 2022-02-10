package service;

import entity.Goods;

public interface GoodsService {

    /**
     * 根据id查找商品
     * @return 查询成功返回目标实体，失败返回{0, null, null, 0, 0, null, null, null, 0}
     */
    public abstract Goods find(int id);
}
