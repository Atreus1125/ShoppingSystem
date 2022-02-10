<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>注销界面</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<meta http-equiv="refresh" content="5;http://localhost:8080/ShoppingSystem/index.jsp">
		
		<link rel="stylesheet" href="http://localhost:8080/ShoppingSystem/document/bootstrap.min.css"/>
		<script src="http://localhost:8080/ShoppingSystem/document/jquery-3.5.1.min.js"></script>
		<script src="http://localhost:8080/ShoppingSystem/document/bootstrap.min.js"></script>
		
		<style>
			body {
				padding-top: 50px;
				background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
			}
			
			.container {
				text-align: center;
			}
		</style>
	</head>
	<body>
		<%
			try {
				session.setAttribute("login_state", null);
				session.setAttribute("login_name", null);
				session.setAttribute("login_id", null);
				session.setAttribute("login_address", null);
				session.setAttribute("order", null);
				session.setAttribute("register_hashmap", null);
				session.setAttribute("error_sign", null);
				session.setAttribute("orderDetail_date", null);
				session.setAttribute("order_date", null);
			}
			catch (Exception e){
				// e.printStackTrace();
			}
			finally {
			
			}
		%>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"></nav>
		
		<div class="container">
			<br />
			<h1>注销成功</h1>
			<br />
			<h4 class="lead">账号已成功注销, 欢迎您下次使用, 5秒后自动跳转至主界面!🚀</h4>
		</div>
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		<br /><br /><br /><br /><br />
	</body>
</html>