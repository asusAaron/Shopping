<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> 
	<title>登录</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style=" background:url(../resource/2.jpg) no-repeat center fixed; background-size: 100%;  ">
<h3 style="text-align:center;margin-top:2%;">图书管理系统</h3>
<form class="form-horizontal" role="form">
	<div style="margin:10% 25% 5% 25%"class="form-group">
		<label for="firstname" class="col-sm-2 control-label"><span class="glyphicon glyphicon-envelope">
		</span>&nbsp;邮箱账号
		</label>
		<div  class="col-sm-10">
			<input type="text" class="form-control" id="firstname" 
				   placeholder="请输入邮箱，格式为：aaa@aaa">
		</div>
	</div>
	<div style="margin:0 25% 5% 25%" class="form-group">
		<label for="lastname" class="col-sm-2 control-label">密码</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname" 
				   placeholder="请输入密码，密码个数必须大于6位数">
		</div>
	</div>
	<div style="margin:0 25% 5% 25%" class="form-group">
		<label for="lastname2" class="col-sm-2 control-label">密码确认</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname2"
				   placeholder="请再次输入密码">
		</div>
	</div>
	<div style="margin:10% 35% 5% 40%"class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-info">重置</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-danger">注册</button>
		</div>
	</div>
</form>
</body>
</html>