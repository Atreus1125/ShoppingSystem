package dao;

import java.util.List;

import entity.OrderDetail;

public interface InterfaceOrderDetailDao {
	public abstract int insertOrderDetail(String goods_name, int number, int price, String person_id);
	
	public abstract int updateOrderDetail(String person_id, String goods_name, int number, int price);
	
	public abstract List<OrderDetail> findAllOrderDetail(String person_id);
	
	public abstract OrderDetail findOrderDetail(String goods_name, String person_id);
}
