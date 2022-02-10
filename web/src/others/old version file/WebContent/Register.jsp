<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>注册界面</title>

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
				text-align: center;
			}
			
			.form-control {
				background-image: linear-gradient(-225deg, #FFFEFF 0%, #D7FFFE 100%);
			}
			
			.btn-default {
				background-image: linear-gradient(-225deg, #FFFEFF 0%, #D7FFFE 100%);
			}
			
			.checkcode {
				padding-top: 5px;
				padding-right: 410px;
			}
			
			label[name="label"] {
				color: red;
			}
			
			#successful {
				color: green;
			}
			
			#unsuccessful {
				color: red;
			}
		</style>
	</head>
	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="div">
				<ul class="nav navbar-nav">
					<li class="active"><a href="http://localhost:8080/ShoppingSystem/index.jsp">系统首页</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							登陆/注册
							<span class="caret"></span>
							&ensp;
						</a>
						<ul class="dropdown-menu">
							<li><a href="http://localhost:8080/ShoppingSystem/Login.jsp">登陆</a></li>
							<li class="divider"></li>
							<li><a href="http://localhost:8080/ShoppingSystem/Register.jsp">注册</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
		
		<div class="container">
			<br />
			<h1>欢迎来到注册界面</h1>
			<br />
			<%
				String error_sign = null;
				try {
					error_sign = (String)session.getAttribute("error_sign");
				} catch (Exception e) {
					// e.printStackTrace();
				} finally {
					if (error_sign != null) {
						out.print(error_sign);
					}
				}
				
				HashMap<String, String> register_hashmap = new HashMap<>();
				String sign = "correct";
				String id = "";
				String password_once = "";
				String password_twice = "";
				String name = "";
				String email = "";
				String address = "";
				String code = "";
				try {
					register_hashmap = (HashMap)session.getAttribute("register_hashmap");
					sign = register_hashmap.get("sign");
					System.out.println("注册界面HashMap中的sign:" + sign);
					if (sign.equals("error")) {
						id = register_hashmap.get("id");
						password_once = register_hashmap.get("password_once");
						password_twice = register_hashmap.get("password_twice");
						name = register_hashmap.get("name");
						email = register_hashmap.get("email");
						address = register_hashmap.get("address");
						code = register_hashmap.get("code");
					}
				} catch (Exception e) {
					// e.printStackTrace();
				} finally {
					
				}
			%>
			<br />
			<h4 class="lead">请严格按照输入框提示输入, 当左侧标签全为<strong>绿色</strong>后再点击注册!</h4>
			<br />
			<form action="DoRegister" method="post" class="form-horizontal">
				<!-- id -->
				<div class="form-group">
					<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_id">&emsp;账号&emsp;</label><!-- 通过control-label使标签变为可控标签,默认右对齐 -->
					<div class="col-md-3">
						<input type="text" class="form-control" name="id" id="id" placeholder="只能包含数字 长度为8" value="<%=id %>">
					</div>
				</div>
				<!-- password_once -->
				<div class="form-group">
					<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_password_once">设置密码</label>
					<div class="col-md-3">
						<input type="password" class="form-control" name="password_once" id="password_once" placeholder="只能包含字母数字 长度为6-10" value="<%=password_once %>">
					</div>
				</div>
				<!-- password_twice -->
				<div class="form-group">
					<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_password_twice">确认密码</label>
					<div class="col-md-3">
						<input type="password" class="form-control" name="password_twice" id="password_twice" placeholder="请确认您的密码" value="<%=password_twice %>">
					</div>
				</div>
				<!-- name -->
				<div class="form-group">
					<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_name">&emsp;姓名&emsp;</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="name" id="name" placeholder="请输入您的姓名" value="<%=name %>">
					</div>
				</div>
				<!-- email -->
				<div class="form-group">
					<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_email">&emsp;邮箱&emsp;</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="email" id="email" placeholder="请输入您的QQ邮箱" value="<%=email %>">
					</div>
				</div>
				<!-- address -->
				<div class="form-group">
					<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_address">所在城市</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="address" id="address" placeholder="请输入您所在的城市" value="<%=address %>">
					</div>
				</div>
				<!-- code -->
				<div class="form-group">
					<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_code">&ensp;验证码&ensp;</label>
					<div class="col-md-2">
						<input type="text" class="form-control" name="code" id="code" placeholder="请输入验证码">
					</div>
					<img class="checkcode" src="http://localhost:8080/ShoppingSystem/CheckCode">
				</div>
				<br />
				<div class="form-group">
					<div class="col-md-offset-4 col-md-4">
						<button type="submit" class="btn btn-default">完成注册</button>
					</div>
				</div>
			</form>
			<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		</div>
		<script>
			/* id */
			var id = /^[0-9]{8,8}$/;//只能包含数字，长度为8
			var txt_id = document.getElementById("id");
			var label_id = document.getElementById("label_id");
			txt_id.onblur = function()//onblur：失去焦点
			{
				var str_id = txt_id.value;
				if (id.test(str_id)) {
					label_id.id = "successful";
				}
				else {
					label_id.id = "unsuccessful";
				}
			}
			/* password_once */
			var password_once = /^[0-9,a-z,A-Z]{6,10}$/;//只能包含数字字母，长度为6-10
			var txt_password_once = document.getElementById("password_once");
			var label_password_once = document.getElementById("label_password_once");		
			txt_password_once.onblur = function()
			{
				var str_password_once = txt_password_once.value;
				if (password_once.test(str_password_once)) {
					label_password_once.id = "successful";
				}
				else {
					label_password_once.id = "unsuccessful";
				}
			}
			/* password_twice */
			var txt_password_twice = document.getElementById("password_twice");
			var label_password_twice = document.getElementById("label_password_twice");
			txt_password_twice.onblur = function()
			{
				var str_password_once = txt_password_once.value;
				var str_password_twice = txt_password_twice.value;
				if (str_password_twice == str_password_once) {
					label_password_twice.id = "successful";
				}
				else {
					label_password_twice.id = "unsuccessful";
				}
			}
			/* name */
			var txt_name = document.getElementById("name");
			var label_name = document.getElementById("label_name");
			txt_name.onblur = function()
			{
				if (txt_name.value != "") {
					label_name.id = "successful";
				}
				else {
					label_name.id = "unsuccessful";
				}
			}
			/* email */
			var email = /^[0-9]{9,10}@qq.com$/;//只支持qq邮箱
			var txt_email = document.getElementById("email");
			var label_email = document.getElementById("label_email");		
			txt_email.onblur = function()
			{
				var str_email = txt_email.value;
				if (email.test(str_email)) {
					label_email.id = "successful";
				}
				else {
					label_email.id = "unsuccessful";
				}
			}
			/* address */
			var txt_address = document.getElementById("address");
			var label_address = document.getElementById("label_address");
			txt_address.onblur = function()
			{
				if (txt_address.value != "") {
					label_address.id = "successful";
				}
				else {
					label_address.id = "unsuccessful";
				}
			}
			/* code */
			var txt_code = document.getElementById("code");
			var label_code = document.getElementById("label_code");
			txt_code.onblur = function()
			{
				if (txt_code.value != "") {
					label_code.id = "successful";
				}
				else {
					label_code.id = "unsuccessful";
				}
			}
		</script>
	</body>
</html>
