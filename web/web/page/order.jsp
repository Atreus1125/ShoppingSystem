<%@ page import="entity.People" %>
<%@ page import="entity.OrderIndex" %>
<%@ page import="service.OrderService" %>
<%@ page import="service.impl.OrderServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="util.CustomUtil" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="entity.OrderDetail" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>订单界面</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	
	<style>
        body {
            margin-top: 50px;
            background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
        }

        .container {
            text-align: center;
        }

        .panel,.flip
        {
            padding:5px;
            text-align:center;
            background-image: linear-gradient(-225deg, #FFFEFF 0%, #D7FFFE 100%);
        }

        .panel
        {
            text-align: left;
            padding:50px;
            display:none;
            text-align:center;
        }
        
        table,th,td
        {
            border: medium solid #a0d8ef;
        }
	</style>
	
	<script>
        $(document).ready(function() {
            $(".flip").click(function() {
                $(".panel").slideToggle("slow");
            });
        });
	</script>
</head>
<body>
	<%
		People now_people = (People) session.getAttribute("now_people");
	%>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<ul class="nav navbar-nav"><!-- 定义无序列表 -->
			<li class="active"><a href="../index.jsp">系统首页</a></li>
			<li><a href="./shopCar.jsp">返回</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#">当前登录:<%=now_people.getName()%></a></li>
			<li><a href="./logoutCorrect.jsp">注销</a></li>"
			<li><a href="./shopCar.jsp">购物车&ensp;</a></li>
		</ul>
	</nav>
	<%
		OrderService orderService = new OrderServiceImpl();
		
		People people = (People) session.getAttribute("now_people");
		List<OrderIndex> orderIndexList = orderService.findAllByPersonId(people.getId());
		HashMap<Integer, List<OrderDetail>> orderDetailHashmap = new HashMap<>();
		for (OrderIndex o : orderIndexList) {
		    orderDetailHashmap.put(o.getId(), orderService.findAllByOrderIndexId(o.getId()));
		}
		
		CustomUtil.outPosition("yellow", "order.jsp");
		CustomUtil.outParameter("yellow", "orderIndexList", String.valueOf(orderIndexList));
		CustomUtil.outParameter("yellow", "orderDetailHashmap", String.valueOf(orderDetailHashmap));
		
		session.setAttribute("orderIndexList", orderIndexList);
		session.setAttribute("orderDetailHashmap", orderDetailHashmap);
	%>
	<div class="container">
		<br />
		<br />
		<br />
		<h1>⭐订单信息⭐</h1>
		<br />
		<c:forEach var="index" items="${orderIndexList}">
			<div class="flip">
				<h2><c:out value="订单编号：${index.getId()}"></c:out></h2>
				<h3><c:out value="订单总价：￥${index.getPrice()}&emsp;创建日期：${index.getDate()}" escapeXml="false"></c:out></h3>
			</div>
			<div class="panel">
				<table class="table table-hover">
					<tr>
						<th>商品编号</th>
						<th>商品数量</th>
						<th>商品总价</th>
					</tr>
					<c:forEach var="detail" items="${orderDetailHashmap.get(index.getId())}">
						<tr>
							<td>${detail.getGoods_name()}</td>
							<td>${detail.getNumber()}</td>
							<td>${detail.getPrice()}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</c:forEach>
	</div>
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</body>
</html>
