<%@ page import="java.util.Set"%>
<%@ page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="entity.Goods"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>购物车界面</title>
		
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
	<body>
		<%
			int login_state = 0;
			String login_name = null; 
			try {
				login_state = (int)session.getAttribute("login_state");
				login_name = (String)session.getAttribute("login_name");
			}
			catch (Exception e){
				// e.printStackTrace();
			}
			finally {
				if (login_state == 0)
					System.out.println("当前为游客登陆");
				else 
					System.out.println("当前为用户" + login_name + "登陆");
			}
		%>
		<!-- 导航栏区域 -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"><!-- <nav class="导航栏 导航栏样式 导航栏位置" 标识这是一个导航容器> -->
			<div class="div">
				<ul class="nav navbar-nav"><!-- 定义无序列表 -->
					<li class="active"><a href="http://localhost:8080/ShoppingSystem/index.jsp">系统首页</a></li>
					<li><a href="#">华为官网</a></li>
					<li><a href="#">荣耀官网</a></li>
					<li><a href="#">花粉俱乐部</a></li>
					<li><a href="#">企业购</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
						String str_navbar_right = null;
						if (login_state == 0) {
							str_navbar_right = 
							"<li class=\"dropdown\">" +
								"<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">" +
									"登陆/注册" +
									"<span class=\"caret\"></span>" +
									"&ensp;" +
								"</a>" +
								"<ul class=\"dropdown-menu\">" +
									"<li><a href=\"http://localhost:8080/ShoppingSystem/Login.jsp\">登陆</a></li>" +
									"<li class=\"divider\"></li>" +
									"<li><a href=\"http://localhost:8080/ShoppingSystem/Register.jsp\">注册</a></li>" +
								"</ul>" +
							"</li>";
						}
						else {
							str_navbar_right = 
								"<li><a href=\"#\">" + "当前登录:" + login_name + "</a></li>" +
								"<li><a href=\"http://localhost:8080/ShoppingSystem/Logout.jsp\">注销</a></li>" +
								"&ensp;";
						}
					%>
					<%=str_navbar_right %>
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
				HashMap<String, Goods> order = null;
				Goods goods = null;
				try {
					order = (HashMap<String, Goods>)session.getAttribute("order");
					
					Set<String> keySet = order.keySet();
					Iterator<String> iterator = keySet.iterator();
					while(iterator.hasNext()){
			            String key = iterator.next();
			            System.out.println(key+"-----"+order.get(key));
			            goods = order.get(key);
						if (goods.getNumber() != 0) {
							out.println(
									"<br />" +
									"<div class=\"row\">" +
										"<div class=\"col-md-2 bwhite tupian\"><img class=\"picture\" src=" + goods.getPicture() + "></div>" +
										"<div class=\"col-md-2 bwhite shangpin\"><h5 class=\"text\">" + goods.getName() + "</h5></div>" +
										"<div class=\"col-md-2 bwhite danjia\"><h5 class=\"text\">￥" + goods.getPrice() + "</h5></div>" +
										"<div class=\"col-md-2 bwhite shuliang\"><h5 class=\"text\">" + goods.getNumber() + "</h5></div>" +
										"<div class=\"col-md-2 bwhite xiaoji\"><h5 class=\"text\">" + goods.getPrice()*goods.getNumber() + "</h5></div>" +
										"<div class=\"col-md-2 bwhite caozuo\"><a href=\"http://localhost:8080/ShoppingSystem/DeletePhone.jsp?delete_number=" + key + "\"><h5 class=\"text\">删除</h5></a></div>" +
									"</div>"
							);
						}
			        }
					
					/* for (int i = 1; i <= 5; i++) {
						goods = order.get("" + i + "");
						if (goods.getNumber() != 0) {
							out.println(
									"<br />" +
									"<div class=\"row\">" +
										"<div class=\"col-md-2 bwhite tupian\"><img class=\"picture\" src=" + goods.getPicture() + "></div>" +
										"<div class=\"col-md-2 bwhite shangpin\"><h5 class=\"text\">" + goods.getName() + "</h5></div>" +
										"<div class=\"col-md-2 bwhite danjia\"><h5 class=\"text\">￥" + goods.getPrice() + "</h5></div>" +
										"<div class=\"col-md-2 bwhite shuliang\"><h5 class=\"text\">" + goods.getNumber() + "</h5></div>" +
										"<div class=\"col-md-2 bwhite xiaoji\"><h5 class=\"text\">" + goods.getPrice()*goods.getNumber() + "</h5></div>" +
										"<div class=\"col-md-2 bwhite caozuo\"><a href=\"http://localhost:8080/ShoppingSystem/DeletePhone" + i + ".jsp\"><h5 class=\"text\">删除</h5></a></div>" +
									"</div>"
							);
						}
					} */
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
			<br />
			<div class="row">
				<div class="col-md-6">
					<a href="http://localhost:8080/ShoppingSystem/SubmitOrder.jsp"><button type="submit" class="btn btn-danger btn-lg">提交订单</button></a>
				</div>
				<div class="col-md-6">
					<a href="http://localhost:8080/ShoppingSystem/ReadOrder.jsp"><button type="submit" class="btn btn-danger btn-lg">查看订单</button></a>
				</div>
			</div>
			<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		</div>
	</body>
</html>