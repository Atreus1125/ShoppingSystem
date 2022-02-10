<%--
//                         _ooOoo_
//                        o8888888o
//                        88" . "88
//                        (| -_- |)
//                         O\ = /O
//                     ____/`---'\____
//                   .   ' \\| |// `.
//                    / \\||| : |||// \
//                  / _||||| -:- |||||- \
//                    | | \\\ - /// | |
//                  | \_| ''\---/'' | |
//                   \ .-\__ `-` ___/-. /
//                ___`. .' /--.--\ `. . __
//             ."" '< `.___\_<|>_/___.' >'"".
//            | | : `- \`.;`\ _ /`;.`/ - ` : | |
//              \ \ `-. \_ __\ /__ _/ .-` / /
//      ======`-.____`-.___\_____/___.-`____.-'======
//                         `=---='
//
//      .............................................
//               佛祖保佑             永无BUG
--%>
<%@ page import="util.CustomUtil" %>
<%@ page import="entity.People" %>
<%@ page import="entity.Goods" %>
<%@ page import="service.GoodsService" %>
<%@ page import="service.impl.GoodsServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>购物系统主页</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<base href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"%>">
	
	<link rel="stylesheet" href="./css/index.css">
	<link rel="stylesheet" href="./css/bootstrap.min.css"/>
	<script src="./js/jquery-3.5.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</head>
<body>
	<%
		People now_people = new People(0, null, null, null, null, 0);
		if (session.getAttribute("now_people") != null) {
			now_people = (People) session.getAttribute("now_people");
		}
		
		CustomUtil.outPosition("yellow", "index.jsp");
		CustomUtil.outParameter("yellow", "now_people", now_people.toString());
		CustomUtil.outParameter("yellow", "base href", request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/");
		
		/*用于显示商品信息*/
		Goods goods = new Goods();
		GoodsService goodsService = new GoodsServiceImpl();
	%>
	<script>
		function onClick() {
            <%
				if (now_people.getId() == 0) {
				    out.print("alert(\"请先登录!\");");
					out.print("return false;");
				}
			%>
		}
	</script>

	<!-- 导航栏区域 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"><!-- <nav class="导航栏 导航栏样式 导航栏位置" 标识这是一个导航容器> -->
		<div class="div">
			<ul class="nav navbar-nav"><!-- 定义无序列表 -->
				<li class="active"><a href="./index.jsp">系统首页</a></li>
				<li><a href="#">华为官网</a></li>
				<li><a href="#">荣耀官网</a></li>
				<li><a href="#">花粉俱乐部</a></li>
				<li><a href="#">企业购</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<%
					String str_navbar_right;
					if (now_people.getId() == 0) {
						str_navbar_right =
								"<li class=\"dropdown\">" +
									"<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">" +
										"登陆/注册" +
										"<span class=\"caret\"></span>" +
										"&ensp;&ensp;" +
									"</a>" +
									"<ul class=\"dropdown-menu\">" +
										"<li><a href=\"./page/login.jsp\">登陆</a></li>" +
										"<li class=\"divider\"></li>" +
										"<li><a href=\"./page/register.jsp\">注册</a></li>" +
									"</ul>" +
								"</li>";
					}
					else {
						str_navbar_right =
								"<li><a href=\"#\">" + "当前登录:" + now_people.getName() + "</a></li>" +
								"<li><a href=\"./page/logoutCorrect.jsp\">注销</a></li>" +
								"<li><a href=\"./page/shopCar.jsp\">购物车</a></li>" + "&ensp;";
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
			<a href="#"><img src="png/phone0.png" alt=""></a>
		</div>
		<div class="right">
			<a href="./page/goods.jsp?goods_id=101" onclick="return onClick()">
				<div>
					<%
						goods = goodsService.find(101);
					%>
					<div class="images"><img src="<%=goods.getImage()%>" alt=""></div>
					<div class="name">
						<h3><%=goods.getName()%></h3>
					</div>
					<div class="explain">
						<p><%=goods.getInfo_brief()%></p>
					</div>
					<div class="price">
						<div class="newprice">
							<p><%=goods.getNew_price()%>元</p>
						</div>
						<div class="oldprice">
							<p><%=goods.getOld_price()%>元</p>
						</div>
					</div>
				</div>
			</a>
			<a href="./page/goods.jsp?goods_id=102" onclick="return onClick()">
				<div>
					<%
						goods = goodsService.find(102);
					%>
					<div class="images"><img src="<%=goods.getImage()%>" alt=""></div>
					<div class="name">
						<h3><%=goods.getName()%></h3>
					</div>
					<div class="explain">
						<p><%=goods.getInfo_brief()%></p>
					</div>
					<div class="price">
						<div class="newprice">
							<p><%=goods.getNew_price()%>元</p>
						</div>
						<div class="oldprice">
							<p><%=goods.getOld_price()%>元</p>
						</div>
					</div>
				</div>
			</a>
			<a href="./page/goods.jsp?goods_id=103" onclick="return onClick()">
				<div>
					<%
						goods = goodsService.find(103);
					%>
					<div class="images"><img src="<%=goods.getImage()%>" alt=""></div>
					<div class="name">
						<h3><%=goods.getName()%></h3>
					</div>
					<div class="explain">
						<p><%=goods.getInfo_brief()%></p>
					</div>
					<div class="price">
						<div class="newprice">
							<p><%=goods.getNew_price()%>元</p>
						</div>
						<div class="oldprice">
							<p><%=goods.getOld_price()%>元</p>
						</div>
					</div>
				</div>
			</a>
			<a href="./page/goods.jsp?goods_id=104" onclick="return onClick()">
				<div>
					<%
						goods = goodsService.find(104);
					%>
					<div class="images"><img src="<%=goods.getImage()%>" alt=""></div>
					<div class="name">
						<h3><%=goods.getName()%></h3>
					</div>
					<div class="explain">
						<p><%=goods.getInfo_brief()%></p>
					</div>
					<div class="price">
						<div class="newprice">
							<p><%=goods.getNew_price()%>元</p>
						</div>
						<div class="oldprice">
							<p><%=goods.getOld_price()%>元</p>
						</div>
					</div>
				</div>
			</a>
			<a href="./page/goods.jsp?goods_id=105" onclick="return onClick()">
				<div>
					<%
						goods = goodsService.find(105);
					%>
					<div class="images"><img src="<%=goods.getImage()%>" alt=""></div>
					<div class="name">
						<h3><%=goods.getName()%></h3>
					</div>
					<div class="explain">
						<p><%=goods.getInfo_brief()%></p>
					</div>
					<div class="price">
						<div class="newprice">
							<p><%=goods.getNew_price()%>元</p>
						</div>
						<div class="oldprice">
							<p><%=goods.getOld_price()%>元</p>
						</div>
					</div>
				</div>
			</a>
			<a href="./page/goods.jsp?goods_id=106" onclick="return onClick()">
				<div>
					<%
						goods = goodsService.find(106);
					%>
					<div class="images"><img src="<%=goods.getImage()%>" alt=""></div>
					<div class="name">
						<h3><%=goods.getName()%></h3>
					</div>
					<div class="explain">
						<p><%=goods.getInfo_brief()%></p>
					</div>
					<div class="price">
						<div class="newprice">
							<p><%=goods.getNew_price()%>元</p>
						</div>
						<div class="oldprice">
							<p><%=goods.getOld_price()%>元</p>
						</div>
					</div>
				</div>
			</a>
			<a href="./page/goods.jsp?goods_id=107" onclick="return onClick()">
				<div>
					<%
						goods = goodsService.find(107);
					%>
					<div class="images"><img src="<%=goods.getImage()%>" alt=""></div>
					<div class="name">
						<h3><%=goods.getName()%></h3>
					</div>
					<div class="explain">
						<p><%=goods.getInfo_brief()%></p>
					</div>
					<div class="price">
						<div class="newprice">
							<p><%=goods.getNew_price()%>元</p>
						</div>
						<div class="oldprice">
							<p><%=goods.getOld_price()%>元</p>
						</div>
					</div>
				</div>
			</a>
			<a href="./page/goods.jsp?goods_id=108" onclick="return onClick()">
				<div>
					<%
						goods = goodsService.find(108);
					%>
					<div class="images"><img src="<%=goods.getImage()%>" alt=""></div>
					<div class="name">
						<h3><%=goods.getName()%></h3>
					</div>
					<div class="explain">
						<p><%=goods.getInfo_brief()%></p>
					</div>
					<div class="price">
						<div class="newprice">
							<p><%=goods.getNew_price()%>元</p>
						</div>
						<div class="oldprice">
							<p><%=goods.getOld_price()%>元</p>
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
		<a href="#"><img src="./png/other0.png" alt=""></a>
		<a href="#"><img src="./png/other5.png" alt=""></a>
	</div>
	<div class="right">
		<a href="#">
			<div>
				<div class="images"><img src="./png/other1.png" alt=""></div>
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
				<div class="images"><img src="./png/other2.png" alt=""></div>
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
				<div class="images"><img src="./png/other3.png" alt=""></div>
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
				<div class="images"><img src="./png/other4.png" alt=""></div>
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
				<div class="images"><img src="./png/other6.png" alt=""></div>
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
				<div class="images"><img src="./png/other7.png" alt=""></div>
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
				<div class="images"><img src="./png/other8.png" alt=""></div>
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
				<div class="images"><img src="./png/other9.png" alt=""></div>
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
