package service;

import dao.GoodsDao;
import dao.InterfaceGoodsDao;
import entity.Goods;

public class GoodsService implements InterfaceGoodsService {
	private InterfaceGoodsDao goodsDao;
	
	public GoodsService() {
		goodsDao = new GoodsDao();
	}
	@Override
	public Goods findGoods(String id) {
		return goodsDao.findGoods(id);
	}
	
}
