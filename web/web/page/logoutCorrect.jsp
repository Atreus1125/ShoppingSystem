<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>注销成功界面</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<meta http-equiv="refresh" content="1;../index.jsp">
	
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	
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
		/**
		 * 注销功能实现清空session中的全部属性：
		 * 1.checkcode：存储验证码，用于register.jsp与login.jsp显示
		 * 2.register_error_info：注册失败原因，用于register.jsp回显
		 * 3.error_people：注册失败的表单信息，用于register.jsp回填
		 * 4.login_error_info：登录失败原因，用于login.jsp回显
		 * 5.now_people：当前登录用户，在登录成功时创建，用于提取用户信息
		 * 6.now_goods：当前浏览商品，用于表单提交后GoodsServlet识别商品
		 * 7.submit_info：订单提交信息，用于shopCar.jsp回显
		 * 8.orderIndexList：订单索引查询结果，用于order.jsp显示
		 * 9.orderDetailHashmap：订单详情查询结果，用于order.jsp显示
		 */
		if (session.getAttribute("register_error_info") != null) {
		    session.setAttribute("register_error_info", null);
		}
		if (session.getAttribute("error_people") != null) {
			session.setAttribute("error_people", null);
		}
		if (session.getAttribute("login_error_info") != null) {
			session.setAttribute("login_error_info", null);
		}
		if (session.getAttribute("now_people") != null) {
			session.setAttribute("now_people", null);
		}
		if (session.getAttribute("checkcode") != null) {
			session.setAttribute("checkcode", null);
		}
		if (session.getAttribute("now_goods") != null) {
			session.setAttribute("now_goods", null);
		}
		if (session.getAttribute("submit_info") != null) {
			session.setAttribute("submit_info", null);
		}
		
		if (session.getAttribute("orderIndexList") != null) {
			session.setAttribute("orderIndexList", null);
		}
		if (session.getAttribute("orderDetailHashmap") != null) {
			session.setAttribute("orderDetailHashmap", null);
		}
	%>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"></nav>
	
	<div class="container">
		<br />
		<h1>注销成功</h1>
		<br />
		<h4 class="lead">注销成功, 1秒后自动跳转至主界面!🚀</h4>
	</div>
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br />
</body>
</html>
