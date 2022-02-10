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
