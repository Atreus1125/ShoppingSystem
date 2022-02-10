<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="entity.Goods"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>删除界面</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- <meta http-equiv="refresh" content="5;http://localhost:8080/ShoppingSystem/index.jsp"> -->
		
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
				/* String id = "" + session.getAttribute("phone_number") + ""; */
				String id = request.getParameter("delete_number");
				HashMap<String, Goods> order = (HashMap<String, Goods>)session.getAttribute("order");
				Goods goods = order.get(id);
				goods.setNumber(0);
				order.replace(id, goods);
				request.getRequestDispatcher("ShopCar.jsp").forward(request, response);
			}
			catch (Exception e){
				// e.printStackTrace();
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