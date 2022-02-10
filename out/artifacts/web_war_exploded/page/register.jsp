<%@ page import="util.CustomUtil" %>
<%@ page import="entity.People" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	CustomUtil.outPosition("yellow", "register.jsp");
	CustomUtil.outParameter("yellow", "request.getContextPath()", request.getContextPath());
	CustomUtil.outParameter("yellow", "request.getRequestURL()", String.valueOf(request.getRequestURL()));
%>
<html>
<head>
	<title>注册界面</title>
	
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
		<h1>欢迎来到注册界面</h1>
		<br />
		<%
			String register_error_info = null;
			People people = new People(0, "", "", "", "", 0);
			String str_id = "";
			
			if (session.getAttribute("register_error_info") != null) {
				register_error_info = (String) session.getAttribute("register_error_info");
				people = (People) session.getAttribute("error_people");
				
				out.print(register_error_info);
				
				CustomUtil.outPosition("yellow", "register.jsp");
				CustomUtil.outParameter("yellow", "register_error_info", register_error_info);
				
				if (people.getId() != 0) {
					str_id = String.valueOf(people.getId());
				}
			}
		%>
		<br />
		<h4 class="lead">请严格按照输入框提示输入, 当左侧标签全为<strong>绿色</strong>后再点击注册!</h4>
		<br />
		<form action="../PeopleServlet/register" method="post" class="form-horizontal" onsubmit="return onSubmit()">
			<!-- id -->
			<div class="form-group">
				<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_id">&emsp;账号&emsp;</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="id" id="id" placeholder="只能包含数字 长度不超过8" value="<%=str_id%>" autocomplete="off">
				</div>
			</div>
			<!-- password_once -->
			<div class="form-group">
				<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_password_once">设置密码</label>
				<div class="col-md-3">
					<input type="password" class="form-control" name="password_once" id="password_once" placeholder="只能包含字母数字 长度为6-10" value="<%=people.getPassword()%>">
				</div>
			</div>
			<!-- password_twice -->
			<div class="form-group">
				<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_password_twice">确认密码</label>
				<div class="col-md-3">
					<input type="password" class="form-control" name="password_twice" id="password_twice" placeholder="请确认您的密码">
				</div>
			</div>
			<!-- name -->
			<div class="form-group">
				<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_name">&emsp;姓名&emsp;</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="name" id="name" placeholder="请输入您的姓名" value="<%=people.getName()%>" autocomplete="on">
				</div>
			</div>
			<!-- email -->
			<div class="form-group">
				<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_email">&emsp;邮箱&emsp;</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="email" id="email" placeholder="请输入您的QQ邮箱" value="<%=people.getEmail()%>" autocomplete="on">
				</div>
			</div>
			<!-- address -->
			<div class="form-group">
				<label class="col-md-1 col-md-offset-4 control-label" name="label" id="label_address">所在城市</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="address" id="address" placeholder="请输入您所在的城市" value="<%=people.getAddress()%>" autocomplete="on">
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
					<button type="submit" class="btn btn-default" id="submit">完成注册</button>
				</div>
			</div>
		</form>
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	</div>
	<script>
		/*正则验证完成前限制提交*/
		function onSubmit() {
		    if (tag_id == 1 && tag_password_once == 1 && tag_password_twice == 1 &&
			    tag_name == 1 && tag_email == 1 && tag_address == 1 && tag_code == 1) {
		     
		    } else {
		        alert("请完成全部正则验证!");
		        return false;
		    }
        }
		
	    /*id*/
	    let id = /^[0-9]{1,8}$/;//只能包含数字，长度不超过8
	    let txt_id = document.getElementById("id");
	    let label_id = document.getElementById("label_id");
	    let tag_id = 0;
	    txt_id.onblur = function()//失焦函数
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
	    
	    /*password_once*/
	    let password_once = /^[0-9,a-z,A-Z]{6,10}$/;//只能包含数字字母，长度为6-10
	    let txt_password_once = document.getElementById("password_once");
	    let label_password_once = document.getElementById("label_password_once");
        let tag_password_once = 0;
	    txt_password_once.onblur = function()
	    {
	        let str_password_once = txt_password_once.value;
	        if (password_once.test(str_password_once)) {
	            label_password_once.id = "successful";
                tag_password_once = 1;
	        }
	        else {
	            label_password_once.id = "unsuccessful";
                tag_password_once = 0;
	        }
	    }
	    
	    /*password_twice*/
	    let txt_password_twice = document.getElementById("password_twice");
	    let label_password_twice = document.getElementById("label_password_twice");
        let tag_password_twice = 0;
	    txt_password_twice.onblur = function()
	    {
	        let str_password_once = txt_password_once.value;
	        let str_password_twice = txt_password_twice.value;
	        if (str_password_twice == str_password_once) {
	            label_password_twice.id = "successful";
                tag_password_twice = 1;
	        }
	        else {
	            label_password_twice.id = "unsuccessful";
                tag_password_twice = 0;
	        }
	    }
	    
	    /*name*/
	    let txt_name = document.getElementById("name");
	    let label_name = document.getElementById("label_name");
        let tag_name = 0;
	    txt_name.onblur = function()
	    {
	        if (txt_name.value != "") {
	            label_name.id = "successful";
                tag_name = 1;
	        }
	        else {
	            label_name.id = "unsuccessful";
                tag_name = 0;
	        }
	    }
	    
	    /*email*/
	    let email = /^[0-9]{9,10}@qq.com$/;//只支持qq邮箱
	    let txt_email = document.getElementById("email");
	    let label_email = document.getElementById("label_email");
        let tag_email = 0;
	    txt_email.onblur = function()
	    {
	        let str_email = txt_email.value;
	        if (email.test(str_email)) {
	            label_email.id = "successful";
                tag_email = 1;
	        }
	        else {
	            label_email.id = "unsuccessful";
                tag_email = 0;
	        }
	    }
	    
	    /*address*/
	    let txt_address = document.getElementById("address");
	    let label_address = document.getElementById("label_address");
	    let tag_address = 0;
	    txt_address.onblur = function()
	    {
	        if (txt_address.value != "") {
	            label_address.id = "successful";
	            tag_address = 1;
	        }
	        else {
	            label_address.id = "unsuccessful";
	            tag_address = 0;
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
</body>
</html>
