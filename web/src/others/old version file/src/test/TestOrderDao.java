package test;

import org.junit.Test;

import dao.OrderDao;
import entity.Order;

public class TestOrderDao {
	/*@Test
	public void testInsertOrder() {
		OrderDao dao = new OrderDao();
		int result = 0;
		result = dao.insertOrder("20001125", "李傲涵", "安徽工业大学", 1000);
		System.out.println("insertPeople()的返回值为:" + result);
	}*/
	
	/*@Test
	public void testFindOrder() {
		OrderDao dao = new OrderDao();
		Order result = new Order();
		result = dao.findOrder("20001125");
		System.out.println(result.toString());
	}*/
	
	@Test
	public void testUpdateOrder() {
		OrderDao dao = new OrderDao();
		int result = 0;
		result = dao.updateOrder("20001125", 10000);
		System.out.println(result);
	}
}
