<%@ page import="entity.People" %>
<%@ page import="entity.Goods" %>
<%@ page import="service.GoodsService" %>
<%@ page import="service.impl.GoodsServiceImpl" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="util.CustomUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>购物车界面</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	
	<style>
        body {
            padding-top: 50px;
            background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
        }

        .container {
            padding-top: 50px;
            text-align: center;
        }

        .bwhite {
            background-color: #ffffff;
        }

        .picture {
            margin-top: 30px;
            width: 100px;
            height: 100px;
        }

        .text {
            line-height: 160px;
        }

        .title {
            width: 180px;
        }

        .nametitle {
            width: 250px;
        }

        .tupian {
            width: 180px;
            height: 160px;
        }

        .shangpin {
            width: 250px;
            height: 160px;
        }

        .danjia {
            width: 180px;
            height: 160px;
        }

        .shuliang {
            width: 180px;
            height: 160px;
        }

        .xiaoji {
            width: 180px;
            height: 160px;
        }

        .caozuo {
            width: 180px;
            height: 160px;
        }
	</style>
</head>
<body onload="onload()">
	<script>
	    <%=session.getAttribute("submit_info")%>
	</script>
	<%
		session.setAttribute("submit_info", null);
		People now_people = (People) session.getAttribute("now_people");
	%>
	<!-- 导航栏区域 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"><!-- <nav class="导航栏 导航栏样式 导航栏位置" 标识这是一个导航容器> -->
		<div class="div">
			<ul class="nav navbar-nav"><!-- 定义无序列表 -->
				<li class="active"><a href="../index.jsp">系统首页</a></li>
				<li><a href="#">华为官网</a></li>
				<li><a href="#">荣耀官网</a></li>
				<li><a href="#">花粉俱乐部</a></li>
				<li><a href="#">企业购</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">当前登录:<%=now_people.getName()%></a></li>
				<li><a href="./logoutCorrect.jsp">注销</a></li>"
				<li><a href="./shopCar.jsp">购物车&ensp;</a></li>
			</ul>
		</div>
	</nav>
	<!-- 商品列表 -->
	<div class="container">
		<div class="row">
			<div class="col-md-2 bwhite title"><h5>图片</h5></div>
			<div class="col-md-2 bwhite nametitle"><h5>商品</h5></div>
			<div class="col-md-2 bwhite title"><h5>单价</h5></div>
			<div class="col-md-2 bwhite title"><h5>数量</h5></div>
			<div class="col-md-2 bwhite title"><h5>小计</h5></div>
			<div class="col-md-2 bwhite title"><h5>操作</h5></div>
		</div>
		
		<%
			GoodsService goodsService = new GoodsServiceImpl();
			Cookie cookies[] = request.getCookies();
			Pattern pattern = Pattern.compile("[0-9]{3}");//通过正则表达式过滤cookie
			
			if (cookies != null) {
			    for (int i = 0; i < cookies.length; i++) {
			        if (pattern.matcher(cookies[i].getName()).matches()) {
				        Goods goods = goodsService.find(Integer.parseInt(cookies[i].getName()));
				        CustomUtil.outPosition("yellow", "shopCar.jsp");
				        CustomUtil.outParameter("yellow", "goods", goods.toString());
			            if (goods.getId() != 0) {
				            out.println(
						            "<br />" +
								    "<div class=\"row\">" +
								        "<div class=\"col-md-2 bwhite tupian\"><img class=\"picture\" src=../" + goods.getImage() + "></div>" +
								        "<div class=\"col-md-2 bwhite shangpin\"><h5 class=\"text\">" + goods.getName() + "</h5></div>" +
								        "<div class=\"col-md-2 bwhite danjia\"><h5 class=\"text\">￥" + goods.getNew_price() + "</h5></div>" +
								        "<div class=\"col-md-2 bwhite shuliang\"><h5 class=\"text\">" + cookies[i].getValue() + "</h5></div>" +
								        "<div class=\"col-md-2 bwhite xiaoji\"><h5 class=\"text\">" + goods.getNew_price() * Integer.parseInt(cookies[i].getValue()) + "</h5></div>" +
								        "<div class=\"col-md-2 bwhite caozuo\"><a href=\"../GoodsServlet/delete?goods_id=" + goods.getId() + "\"><h5 class=\"text\">删除</h5></a></div>" +
								    "</div>"
				            );
			            }
			        }
			    }
			}
		%>
		<br />
		<div class="row">
			<div class="col-md-6">
				<a href="../OrderServlet/submit"><button class="btn btn-danger btn-lg">提交订单</button></a>
			</div>
			<div class="col-md-6">
				<a href="order.jsp"><button class="btn btn-danger btn-lg">查看订单</button></a>
			</div>
		</div>
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	</div>
</body>
</html>
