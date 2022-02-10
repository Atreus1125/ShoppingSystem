package test;

import org.junit.Test;

import dao.GoodsDao;
import entity.Goods;

public class TestGoodsDao {
	@Test
	public void testFindGoods() {
		GoodsDao dao = new GoodsDao();
		Goods result = new Goods();
		result = dao.findGoods("1");
		System.out.println(result.toString());
	}
}
