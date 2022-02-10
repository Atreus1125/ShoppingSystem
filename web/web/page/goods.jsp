<%@ page import="entity.People" %>
<%@ page import="entity.Goods" %>
<%@ page import="service.GoodsService" %>
<%@ page import="service.impl.GoodsServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>商品详情界面</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="../css/bootstrap.min.css"/>
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	
	<style>
        body {
            padding-top: 50px;/* 避免文本被导航栏覆盖 */
            background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);/* 设置主题渐变色 */
        }

        .container {
            padding-top: 50px;
        }

        .picture {
            position:absolute;
            padding-top: 60px;
            padding-left: 160px;
            z-index: -1;
        }

        .red {
            color: #ca151d;
        }

        .black {
            background-color: #c8c8c8;
        }

        .shuliang {
            margin-top: 16px;
        }

        .tijiao {
            margin-top: 16px;
        }
	</style>
</head>
<body>
	<%
		GoodsService goodsService = new GoodsServiceImpl();
		People now_people = (People) session.getAttribute("now_people");
		Goods goods = goodsService.find(Integer.parseInt(request.getParameter("goods_id")));
		session.setAttribute("now_goods", goods);//将当前浏览商品保存至session，用于表单提交后servlet识别商品
		
		String info_additional = goods.getInfo_additional();
		String info_coupon = info_additional.substring(0, info_additional.indexOf('/'));
		String info_instalment = info_additional.substring(info_additional.indexOf('/') + 1, info_additional.lastIndexOf('/'));
		String info_mark = info_additional.substring(info_additional.lastIndexOf('/') + 1, info_additional.length() - 1);
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
	<!-- 信息区域 -->
	<img class="picture" src="../<%=goods.getImage()%>">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-5"><h2><%=goods.getName()%></h2></div>
		</div>
		<div class="row">
			<div class="col-md-7 col-md-offset-5"><h5><%=goods.getInfo_detailed()%></h5></div>
		</div>
		
		<br />
		<div class="row">
			<div class="col-md-1 col-md-offset-5 red black"><h5>商品赠券</h5></div>
			<div class="col-md-4 black"><h5><%=info_coupon%></h5></div>
		</div>
		<div class="row">
			<div class="col-md-1 col-md-offset-5 red black"><h5>分期免息</h5></div>
			<div class="col-md-4 black"><h5><%=info_instalment%></h5></div>
		</div>
		<div class="row">
			<div class="col-md-1 col-md-offset-5 red black"><h5>赠送积分</h5></div>
			<div class="col-md-4 black"><h5><%=info_mark%></h5></div>
		</div>
		
		<br />
		<form action="../GoodsServlet/add" method="post">
			<div class="form-group">
				<div class="col-md-1 col-md-offset-5"><h3>价&ensp;格</h3></div>
				<div class="col-md-4 red"><h3>￥<%=goods.getNew_price()%>.00</h3></div>
			</div>
			<div class="form-group">
				<div class="col-md-1 col-md-offset-5 control-label"><h3>数&ensp;量</h3></div>
				<div class="col-md-1">
					<select class="form-control shuliang" name="number">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-5 col-md-6">
					<br />
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-5 col-md-6">
					<button type="submit" class="btn btn-danger tijiao btn-lg">加入购物车</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
