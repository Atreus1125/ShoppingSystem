<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>登陆界面</title>
		
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
			
			.checkcode {
				padding-top: 5px;
				padding-right: 410px;
			}
			
			.form-control {
				background-image: linear-gradient(-225deg, #FFFEFF 0%, #D7FFFE 100%);
			}
			
			.btn-default {
				background-image: linear-gradient(-225deg, #FFFEFF 0%, #D7FFFE 100%);
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
			</div>
		</nav>
		
		<div class="container">
			<br />
			<h1>欢迎来到登陆界面</h1>
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
			%>
			<br />
			<h4 class="lead">请严格按照输入框提示输入, 当左侧标签全为<strong>绿色</strong>后再点击登陆!</h4>
			<br />
			<form action="DoLogin" method="post" class="form-horizontal">
				<!-- id -->
				<div class="form-group">
					<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_id">&emsp;工号&emsp;</label><!-- 通过control-label使标签变为可控标签,默认右对齐 -->
					<div class="col-md-3">
						<input type="text" class="form-control" name="id" id="id" placeholder="请输入您的工号">
					</div>
				</div>
				<!-- password -->
				<div class="form-group">
					<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_password">&emsp;密码&emsp;</label>
					<div class="col-md-3">
						<input type="password" class="form-control" name="password" id="password" placeholder="请输入您的密码">
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
						<button type="submit" class="btn btn-default">登陆</button>
					</div>
				</div>
				<br />
			</form>
			<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
			<br /><br /><br /><br /><br />
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
				/* password */
				var password = /^[0-9,a-z,A-Z]{6,10}$/;//只能包含数字字母，长度为6-10
				var txt_password = document.getElementById("password");
				var label_password = document.getElementById("label_password");		
				txt_password.onblur = function()
				{
					var str_password = txt_password.value;
					if (password.test(str_password)) {
						label_password.id = "successful";
					}
					else {
						label_password.id = "unsuccessful";
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
		</div>
	</body>
</html>