package test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import dao.OrderDetailDao;
import entity.OrderDetail;

public class TestOrderDetailDao {
	/*@Test
	public void testInsertOrder() {
		OrderDetailDao dao = new OrderDetailDao();
		int result = 0;
		result = dao.insertOrderDetail("�ֻ�", 1, 1000, "20001125");
		System.out.println("insertPeople()�ķ���ֵΪ:" + result);
	}*/
	
	/*@Test
	public void testFindAllOrderDetail() {
		OrderDetailDao dao = new OrderDetailDao();
		List<OrderDetail> result = new ArrayList<OrderDetail>();
		result = dao.findAllOrderDetail("20001125");
		System.out.println(result.size());
	}*/
	
	@Test
	public void testFindOrderDetail() {
		OrderDetailDao dao = new OrderDetailDao();
		OrderDetail result = new OrderDetail();
		result = dao.findOrderDetail("�ֻ�", "20001125");
		/*if (dao.findOrderDetail("�ֻ�", "20001125") == null) {
			System.out.println("###");
		}*/
		System.out.println(result.toString());
	}
	
	/*@Test
	public void testUpdateOrder() {
		OrderDetailDao dao = new OrderDetailDao();
		int result = 0;
		result = dao.updateOrderDetail("20001125", "�ֻ�", 0 ,0);
		System.out.println(result);
	}*/
}
