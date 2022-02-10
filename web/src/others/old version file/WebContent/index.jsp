<%@page import="entity.Goods"%>
<%@page import="service.GoodsService"%>
<%@page import="service.InterfaceGoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>购物系统主页</title>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="stylesheet" href="http://localhost:8080/ShoppingSystem/document/bootstrap.min.css"/>
		<script src="http://localhost:8080/ShoppingSystem/document/jquery-3.5.1.min.js"></script>
		<script src="http://localhost:8080/ShoppingSystem/document/bootstrap.min.js"></script>
		<link rel="stylesheet" href="http://localhost:8080/ShoppingSystem/document/index.css">
		
		<script>
			function js_jumpToPhone() {
			}
		</script>
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
			
			InterfaceGoodsService goodsService = new GoodsService();
			Goods goods = new Goods();
			String image = null;
			String name = null;
			String explain = null;
			String nowprice = null;
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
								"<li><a href=\"http://localhost:8080/ShoppingSystem/ShopCar.jsp\">购物车</a></li>" +
								"&ensp;";
						}
					%>
					<%=str_navbar_right %>
				</ul>
			</div>
		</nav>
		
		<!-- 热销单品区域 -->
		<div class="main">
			<br />
			<h2 style="text-align: center;">热销单品</h2>
			<br />
		    <div class="left">
		        <a href="#"><img src="image/phone0.png" alt=""></a>
		    </div>
		    <div class="right">
		        <!-- <a href="http://localhost:8080/ShoppingSystem/Phone1.jsp"> -->
		        <!-- <a href="javascript:void(0);" onclick="js_jumpToPhone()"> -->
		        <a href="http://localhost:8080/ShoppingSystem/Phone.jsp?phone_number=1">
		            <div>
		            	<%
		            		goods = goodsService.findGoods("1");
			            	image = goods.getPicture();
			    			name = goods.getName();
			    			explain = goods.getExplain();
			    			nowprice = "" + goods.getPrice() +"";
		            	%>
		                <div class="images"><img src="<%=image %>" alt=""></div>
		                <div class="name">
		                    <h3><%=name %></h3>
		                </div>
		                <div class="explain">
		                    <p><%=explain %></p>
		                </div>
		                <div class="price">
							<div class="nowprice">
							    <p><%=nowprice %>元</p>
							</div>
		                </div>
		            </div>
		        </a>
		        <a href="http://localhost:8080/ShoppingSystem/Phone.jsp?phone_number=2">
		            <div>
		            	<%
		            		goods = goodsService.findGoods("2");
			            	image = goods.getPicture();
			    			name = goods.getName();
			    			explain = goods.getExplain();
			    			nowprice = "" + goods.getPrice() +"";
		            	%>
		                <div class="images"><img src="<%=image %>" alt=""></div>
		                <div class="name">
		                    <h3><%=name %></h3>
		                </div>
		                <div class="explain">
		                    <p><%=explain %></p>
		                </div>
		                <div class="price">
							<div class="nowprice">
							    <p><%=nowprice %>元</p>
							</div>
		                </div>
		            </div>
		        </a>
		        <a href="http://localhost:8080/ShoppingSystem/Phone.jsp?phone_number=3">
		            <div>
		            	<%
		            		goods = goodsService.findGoods("3");
			            	image = goods.getPicture();
			    			name = goods.getName();
			    			explain = goods.getExplain();
			    			nowprice = "" + goods.getPrice() +"";
		            	%>
		                <div class="images"><img src="<%=image %>" alt=""></div>
		                <div class="name">
		                    <h3><%=name %></h3>
		                </div>
		                <div class="explain">
		                    <p><%=explain %></p>
		                </div>
		                <div class="price">
							<div class="nowprice">
							    <p><%=nowprice %>元</p>
							</div>
		                </div>
		            </div>
		        </a>
		        <a href="http://localhost:8080/ShoppingSystem/Phone.jsp?phone_number=4">
		            <div>
		            	<%
		            		goods = goodsService.findGoods("4");
			            	image = goods.getPicture();
			    			name = goods.getName();
			    			explain = goods.getExplain();
			    			nowprice = "" + goods.getPrice() +"";
		            	%>
		                <div class="images"><img src="<%=image %>" alt=""></div>
		                <div class="name">
		                    <h3><%=name %></h3>
		                </div>
		                <div class="explain">
		                    <p><%=explain %></p>
		                </div>
		                <div class="price">
							<div class="nowprice">
							    <p><%=nowprice %>元</p>
							</div>
		                </div>
		            </div>
		        </a>
		        <a href="http://localhost:8080/ShoppingSystem/Phone.jsp?phone_number=5">
		            <div>
		            	<%
		            		goods = goodsService.findGoods("5");
			            	image = goods.getPicture();
			    			name = goods.getName();
			    			explain = goods.getExplain();
			    			nowprice = "" + goods.getPrice() +"";
		            	%>
		                <div class="images"><img src="<%=image %>" alt=""></div>
		                <div class="name">
		                    <h3><%=name %></h3>
		                </div>
		                <div class="explain">
		                    <p><%=explain %></p>
		                </div>
		                <div class="price">
							<div class="nowprice">
							    <p><%=nowprice %>元</p>
							</div>
		                </div>
		            </div>
		        </a>
		        <a href="http://localhost:8080/ShoppingSystem/Phone.jsp?phone_number=6">
		            <div>
		            	<%
		            		goods = goodsService.findGoods("6");
			            	image = goods.getPicture();
			    			name = goods.getName();
			    			explain = goods.getExplain();
			    			nowprice = "" + goods.getPrice() +"";
		            	%>
		                <div class="images"><img src="<%=image %>" alt=""></div>
		                <div class="name">
		                    <h3><%=name %></h3>
		                </div>
		                <div class="explain">
		                    <p><%=explain %></p>
		                </div>
		                <div class="price">
							<div class="nowprice">
							    <p><%=nowprice %>元</p>
							</div>
		                </div>
		            </div>
		        </a>
		        <a href="http://localhost:8080/ShoppingSystem/Phone.jsp?phone_number=7">
		            <div>
		            	<%
		            		goods = goodsService.findGoods("7");
			            	image = goods.getPicture();
			    			name = goods.getName();
			    			explain = goods.getExplain();
			    			nowprice = "" + goods.getPrice() +"";
		            	%>
		                <div class="images"><img src="<%=image %>" alt=""></div>
		                <div class="name">
		                    <h3><%=name %></h3>
		                </div>
		                <div class="explain">
		                    <p><%=explain %></p>
		                </div>
		                <div class="price">
							<div class="nowprice">
							    <p><%=nowprice %>元</p>
							</div>
		                </div>
		            </div>
		        </a>
		        <a href="http://localhost:8080/ShoppingSystem/Phone.jsp?phone_number=8">
		            <div>
		            	<%
		            		goods = goodsService.findGoods("8");
			            	image = goods.getPicture();
			    			name = goods.getName();
			    			explain = goods.getExplain();
			    			nowprice = "" + goods.getPrice() +"";
		            	%>
		                <div class="images"><img src="<%=image %>" alt=""></div>
		                <div class="name">
		                    <h3><%=name %></h3>
		                </div>
		                <div class="explain">
		                    <p><%=explain %></p>
		                </div>
		                <div class="price">
							<div class="nowprice">
							    <p><%=nowprice %>元</p>
							</div>
		                </div>
		            </div>
		        </a>
		    </div>
		</div>
		<!-- 其他商品区域 -->
		<div class="main">
			<br />
			<h2 style="text-align: center;">其他商品</h2>
			<br />
		    <div class="middle">
		        <a href="#"><img src="image/other0.png" alt=""></a>
		        <a href="#"><img src="image/other5.png" alt=""></a>
		    </div>
		    <div class="right">
		        <a href="#">
		            <div>
		                <div class="images"><img src="image/other1.png" alt=""></div>
		                <div class="name">
		                    <h3>HUAWEI MateBook X</h3>
		                </div>
		                <div class="explain">
		                    <p>晒单赠内胆包+三期免息</p>
		                </div>
		                <div class="price">
		                    <div class="nowprice">
		                        <p>8999元</p>
		                    </div>
		                </div>
		            </div>
		        </a>
		        <a href="#">
		            <div>
		                <div class="images"><img src="image/other2.png" alt=""></div>
		                <div class="name">
		                    <h3>HUAWEI MateBook 14</h3>
		                </div>
		                <div class="explain">
		                    <p>2K触控屏轻薄本</p>
		                </div>
		                <div class="price">
		                    <div class="newprice">
		                        <p>6399元起</p>
		                    </div>
		                    <div class="oldprice">
		                        <p>6999元</p>
		                    </div>
		                </div>
		            </div>
		        </a>
		        <a href="#">
		            <div>
		                <div class="images"><img src="image/other3.png" alt=""></div>
		                <div class="name">
		                    <h3>荣耀猎人游戏本 V700</h3>
		                </div>
		                <div class="explain">
		                    <p>强劲游戏性能</p>
		                </div>
		                <div class="price">
		                    <div class="newprice">
		                        <p>7499元起</p>
		                    </div>
		                    <div class="oldprice">
		                        <p>7999元</p>
		                    </div>
		                </div>
		            </div>
		        </a>
		        <a href="#">
		            <div>
		                <div class="images"><img src="image/other4.png" alt=""></div>
		                <div class="name">
		                    <h3>HUAWEI MateBook D 14</h3>
		                </div>
		                <div class="explain">
		                    <p>多屏协同180度开合</p>
		                </div>
		                <div class="price">
		                    <div class="nowprice">
		                        <p>5299元</p>
		                    </div>
		                </div>
		            </div>
		        </a>
		        <a href="#">
		            <div>
		                <div class="images"><img src="image/other6.png" alt=""></div>
		                <div class="name">
		                    <h3>HUAWEI MatePad 10.8</h3>
		                </div>
		                <div class="explain">
		                    <p>享三期免息</p>
		                </div>
		                <div class="price">
		                    <div class="nowprice">
		                        <p>2399元</p>
		                    </div>
		                </div>
		            </div>
		        </a>
		        <a href="#">
		            <div>
		                <div class="images"><img src="image/other7.png" alt=""></div>
		                <div class="name">
		                    <h3>HUAWEI MatePad Pro</h3>
		                </div>
		                <div class="explain">
		                    <p>享三期免息</p>
		                </div>
		                <div class="price">
		                    <div class="newprice">
		                        <p>3799元起</p>
		                    </div>
		                    <div class="oldprice">
		                        <p>3999元</p>
		                    </div>
		                </div>
		            </div>
		        </a>
		        <a href="#">
		            <div>
		                <div class="images"><img src="image/other8.png" alt=""></div>
		                <div class="name">
		                    <h3>[Wifi6+]荣耀平板V6</h3>
		                </div>
		                <div class="explain">
		                    <p>现货速发</p>
		                </div>
		                <div class="price">
		                    <div class="nowprice">
		                        <p>2798元</p>
		                    </div>
		                </div>
		            </div>
		        </a>
		        <a href="#">
		            <div>
		                <div class="images"><img src="image/other9.png" alt=""></div>
		                <div class="name">
		                    <h3>华为畅享平板 2</h3>
		                </div>
		                <div class="explain">
		                    <p>享三期免息</p>
		                </div>
		                <div class="price">
		                    <div class="nowprice">
		                        <p>1799元</p>
		                    </div>
		                </div>
		            </div>
		        </a>
		    </div>
		</div>
		<!-- 底部导航栏 -->
		<div class="footer">
		    <div class="center">
		        <div class="zuo">
		            <div class="ph">
		                <p>隐私声明 服务协议 COOKIES Copyright © 2012-2020 华为终端有限公司 版权所有<br />粤ICP备19015064号 | 粤公网安备 44190002003939号</p>
		            </div>
		            <div class="btn"><a href="#">下载APP</a></div>
		        </div>
		        <div class="you">
		            <div>
		                <dl>
		                    <dt>维修与技术支持</dt>
		                    <br>
		                    <a href="#"><dd>服务点</dd></a>
		                    <a href="#"><dd>预约维修</dd></a>
							<a href="#"><dd>手机寄修</dd></a>
							<a href="#"><dd>备件价格查询</dd></a>
							<a href="#"><dd>上门服务</dd></a>
		                </dl>
		            </div>
		            <div>
		                <dl>
		                    <dt>保修与退换货</dt>
		                    <br>
		                    <a href="#"><dd>保修政策</dd></a>
		                    <a href="#"><dd>退换货政策</dd></a>
							<a href="#"><dd>保修状态查询</dd></a>
							<a href="#"><dd>配件防伪查询</dd></a>
		                </dl>
		            </div>
		            <div>
		                <dl>
		                    <dt>购物相关</dt>
		                    <br>
		                    <a href="#"><dd>购物指南</dd></a>
		                    <a href="#"><dd>配送方式</dd></a>
							<a href="#"><dd>支付方式</dd></a>
							<a href="#"><dd>常见问题</dd></a>
		                </dl>
		            </div>
		        </div>
		    </div>
		</div>
	</body>
</html>