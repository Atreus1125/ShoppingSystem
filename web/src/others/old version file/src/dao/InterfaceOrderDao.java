package dao;

import entity.Order;

public interface InterfaceOrderDao {
	public abstract int insertOrder(String person_id, String person_name, String address, int sumprice);
	
	public abstract int updateOrder(String person_id, int sumprice);
	
	public abstract Order findOrder(String person_id);
}
