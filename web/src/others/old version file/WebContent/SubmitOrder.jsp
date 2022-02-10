<%@ page import="dao.OrderDetailDao"%>
<%@ page import="dao.InterfaceOrderDetailDao"%>
<%@ page import="dao.OrderDao"%>
<%@ page import="dao.InterfaceOrderDao"%>
<%@ page import="service.PeopleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="entity.Goods"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>提交订单界面</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="stylesheet" href="http://localhost:8080/ShoppingSystem/document/bootstrap.min.css"/>
		<script src="http://localhost:8080/ShoppingSystem/document/jquery-3.5.1.min.js"></script>
		<script src="http://localhost:8080/ShoppingSystem/document/bootstrap.min.js"></script>
		
		<style>
			body {
				padding-top: 50px;
				background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
			}
		</style>
	</head>
	<body>
		<%
			// order表:用户编号 用户姓名 用户地址 订单总价
			String person_id = null;//
			String person_name = null;//
			String address = null;//
			int sumprice = 0;
			
			// oeder_detail表:商品名称 商品数量 商品价格 用户编号
			String goods_name = null;//
			int number = 0;//
			int price = 0;//
			
			// 读取购物车信息
			HashMap<String, Goods> order = null;
			
			// 用于读取session中的HashMap中的每一个值
			Goods goods = null;
			
			// 数据访问层
			InterfaceOrderDao orderDao = new OrderDao();
			InterfaceOrderDetailDao orderDetailDao = new OrderDetailDao();
			
			try {
				person_name = (String)session.getAttribute("login_name");
				person_id = (String)session.getAttribute("login_id");
				address = (String)session.getAttribute("login_address");
				
				order = (HashMap<String, Goods>)session.getAttribute("order");
				
				// 避免外键约束出现问题
				if (orderDao.findOrder(person_id).getPerson_name() == null) {
					orderDao.insertOrder(person_id, person_name, address, sumprice);
				}
				
				Set<String> keySet = order.keySet();
				Iterator<String> iterator = keySet.iterator();
				while(iterator.hasNext()){
		            String key = iterator.next();
		            System.out.println(key+"-----"+order.get(key));
		            goods = order.get(key);
					if (goods.getNumber() != 0) {
						goods_name = goods.getName();
						number = goods.getNumber();
						price = number * goods.getPrice();
						sumprice += price;
						
						// 向order_detail表中插入数据
						if (orderDetailDao.findOrderDetail(goods_name, person_id) != null) {
							orderDetailDao.updateOrderDetail(person_id, goods_name, number, price);
						}
						else {
							orderDetailDao.insertOrderDetail(goods_name, number, price, person_id);
						}
						
						// 清空购物车
						goods.setNumber(0);
						order.replace(key, goods);
					}
		        }
				
				/* for (int i = 1; i <= 5; i++) {
					goods = order.get("" + i + "");
					if (goods.getNumber() != 0) {
						goods_name = goods.getName();
						number = goods.getNumber();
						price = number * goods.getPrice();
						sumprice += price;
						
						// 向order_detail表中插入数据
						if (orderDetailDao.findOrderDetail(goods_name) != null) {
							orderDetailDao.updateOrderDetail(goods_name, number, price);
						}
						else {
							orderDetailDao.insertOrderDetail(goods_name, number, price, person_id);
						}
						
						// 清空购物车
						goods.setNumber(0);
						order.replace("" + i + "", goods);
					}
				} */

				// 向order表中插入数据
				if (orderDao.findOrder(person_id).getPerson_name() != null) {
					orderDao.updateOrder(person_id, sumprice);
				}
				else {
					orderDao.insertOrder(person_id, person_name, address, sumprice);
				}
				
				// 清空购物车
				session.setAttribute("order", order);
				request.getRequestDispatcher("ShopCar.jsp").forward(request, response);
			}
			catch (Exception e){
				e.printStackTrace();
			}
			finally {
			
			}
		%>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"></nav>
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	</body>
</html>