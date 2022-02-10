package dao;

import java.util.HashMap;

import entity.Goods;

public interface InterfaceGoodsDao {
	public abstract Goods findGoods(String id);
}
