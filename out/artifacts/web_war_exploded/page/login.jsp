<%@ page import="entity.People" %>
<%@ page import="util.CustomUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>登陆界面</title>
	
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
				<li class="active"><a href="../index.jsp">系统首页</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						登陆/注册
						<span class="caret"></span>
						&ensp;
					</a>
					<ul class="dropdown-menu">
						<li><a href="./login.jsp">登陆</a></li>
						<li class="divider"></li>
						<li><a href="./register.jsp">注册</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<br />
		<h1>欢迎来到登陆界面</h1>
		<br />
		<%
			String login_error_info = null;
			
			if (session.getAttribute("login_error_info") != null) {
				login_error_info = (String) session.getAttribute("login_error_info");
				
				out.print(login_error_info);
				
				CustomUtil.outPosition("yellow", "login.jsp");
				CustomUtil.outParameter("yellow", "login_error_info", login_error_info);
			}
		%>
		<br />
		<h4 class="lead">请按照输入框提示输入，当左侧标签全为<strong>绿色</strong>后点击登陆</h4>
		<br />
		<form action="../PeopleServlet/login" method="post" class="form-horizontal" onsubmit="return onSubmit()">
			<!-- id -->
			<div class="form-group">
				<!-- 通过control-label使标签变为可控标签，默认右对齐 -->
				<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_id">&emsp;账号&emsp;</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="id" id="id" placeholder="请输入您的账号">
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
					<input type="text" class="form-control" name="code" id="code" placeholder="请输入验证码" autocomplete="off">
				</div>
				<img class="checkcode" src="../CheckCodeServlet">
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
            /*正则验证完成前限制提交*/
            function onSubmit() {
                if (tag_id == 1 && tag_password == 1 && tag_code == 1) {

                } else {
                    alert("请完成全部正则验证!");
                    return false;
                }
            }
            
	        /*id*/
            let id = /^[0-9]{1,8}$/;//只能包含数字
	        let txt_id = document.getElementById("id");
	        let label_id = document.getElementById("label_id");
	        let tag_id = 0;
	        txt_id.onblur = function()//onblur：失去焦点
	        {
	            let str_id = txt_id.value;
	            if (id.test(str_id)) {
	                label_id.id = "successful";
	                tag_id = 1;
	            }
	            else {
	                label_id.id = "unsuccessful";
	                tag_id = 0;
	            }
	        }
	        
	        /*password*/
	        let password = /^[0-9,a-z,A-Z]{6,10}$/;//只能包含数字字母，长度为6-10
	        let txt_password = document.getElementById("password");
	        let label_password = document.getElementById("label_password");
	        let tag_password = 0;
	        txt_password.onblur = function()
	        {
	            let str_password = txt_password.value;
	            if (password.test(str_password)) {
	                label_password.id = "successful";
	                tag_password = 1;
	            }
	            else {
	                label_password.id = "unsuccessful";
	                tag_password = 0;
	            }
	        }
	        
	        /*code*/
	        let txt_code = document.getElementById("code");
	        let label_code = document.getElementById("label_code");
	        let tag_code = 0;
	        txt_code.onblur = function()
	        {
	            if (txt_code.value != "") {
	                label_code.id = "successful";
	                tag_code = 1;
	            }
	            else {
	                label_code.id = "unsuccessful";
	                tag_code = 0;
	            }
	        }
		</script>
	</div>
</body>
</html>
