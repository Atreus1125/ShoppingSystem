<%@	page import="entity.OrderDetail"%>
<%@ page import="entity.Order"%>
<%@ page import="java.util.List"%>
<%@	page import="dao.InterfaceOrderDao"%>
<%@	page import="dao.OrderDao"%>
<%@	page import="dao.InterfaceOrderDetailDao"%>
<%@	page import="dao.OrderDetailDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				margin-top: 50px;
				background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
			}
			
			.container {
				text-align: center;
			}
			
			#panel_1,#flip_1,#panel_2,#flip_2
			{
				padding:5px;
				text-align:center;
				background-color: #c8c8c8
			}
			
			#panel_1,#panel_2
			{
				text-align: left;
				padding:50px;
				display:none;
				text-align:center;
			}
		</style>
		
		<script>
			$(document).ready(function() {
				$("#flip_1").click(function() {
					$("#panel_1").slideToggle("slow");
				});
			});
			
			$(document).ready(function() {
				$("#flip_2").click(function() {
					$("#panel_2").slideToggle("slow");
				});
			});
		</script>
	</head>
	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"></nav>
		<%
			try {
				String person_id = (String)session.getAttribute("login_id");
				InterfaceOrderDao orderDao = new OrderDao();
				InterfaceOrderDetailDao orderDetailDao = new OrderDetailDao();
				// 读取主表内容
				Order order_date  = orderDao.findOrder(person_id);
				request.setAttribute("order_date", order_date);
				// 读取从表内容
				List<OrderDetail> orderDetail_date = orderDetailDao.findAllOrderDetail(person_id);
				request.setAttribute("orderDetail_date", orderDetail_date);
			}
			catch (Exception e){
				// e.printStackTrace();
			}
			finally {
			
			}
		%>
		<div class="container">
			<br />
			<h1>⭐关于订单⭐</h1>
			<br />
			<div id="flip_1"><h2 class="">订单概览(主表)</h2></div>
			<div id="panel_1">
				<h3>账号:&emsp;<c:out value="${order_date.person_id}" default="购物车为空" /></h3>
				<h3>姓名:&emsp;<c:out value="${order_date.person_name}" default="购物车为空" /></h3>
				<h3>地址:&emsp;<c:out value="${order_date.address}" default="购物车为空" /></h3>
				<h3>总价:&emsp;￥<c:out value="${order_date.sumprice}" default="购物车为空" /></h3>
			</div>
			<br />
			<div id="flip_2"><h2 class="">订单详情(从表)</h2></div>
			<div id="panel_2">
				<table class="table table-hover">
					<tr>
						<td>商品编号</td>
						<td>商品数量</td>
						<td>商品总价</td>
						<td>所属用户</td>
					</tr>
					<c:forEach var="i" items="${requestScope.orderDetail_date}">
						<tr>
							<td>${i.goods_name }</td>
							<td>${i.number }</td>
							<td>${i.price }</td>
							<td>${i.person_id }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	</body>
</html>