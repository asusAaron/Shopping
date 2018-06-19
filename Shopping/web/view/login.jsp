<%@ page contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<script type="text/javascript">
	function checkId(){
	if (document.getElementById("password").value == ""&& document.getElementById("username").value == "") {
			alert("请输入账号和密码！");
			return false;
		} else if (document.getElementById("username").value == "") {
			alert("请输入账号");
			return false;
		} else if ((document.getElementById("username").value).length>50) {
			alert("账号格式不对，请重新输入！");
			return false;
		} else if (document.getElementById("password").value == "") {
			alert("请输入密码！");
			return false;
		} else {
			return true;
		}

	}
function checkPhoneInput(){
	//获得输入字符
	var input=document.getElementById("firstname").value;
	if(input.length!=11){
		document.getElementById("firstname").style.color='red';
	}	
	else{
		document.getElementById("firstname").style.color='black';
	}
}
</script>
<%
	Object message = session.getAttribute("message");
	if (message != null && !"".equals(message)) {
%>
<script type="text/javascript">
	alert("<%=message%>");
</script>
<%
	}
	session.setAttribute("message", "");
%>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
		.login-box{
			display: flex;
			flex-direction: column;
			align-items: center;
			height: 60%;
			width: 30%;
			margin-top: 5%;
			margin-left: 35%;
			border: 1px solid lightgray;;
			border-radius: 15px;
			background-color: rgba(234, 255, 246, 0.6);
		}
		.login-title{
			text-align: center;
			margin-top: 10%;
		}
		.form-horizontal{
			display: flex;
			flex-direction: column;
			align-items: center;
			width: 100%;
		}
		.form-group{
			width: 60%;
			margin-top: 7%;
		}
		.btn-container{
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}
		.btn{
			width: 90%;
		}
		.forget-div{
			width: 100%;
			display: flex;
			flex-direction: row;
			justify-content: center;
		}
		.forget-txt{
			color: blue;
			font-size: 15px;
			text-align: center;
		}
	</style>
</head>
<body style="background: url(../resource/2.jpg) no-repeat center fixed; background-size: 100%;">
	<div class="login-box">
		<h3 class="login-title">登录</h3>
		<form action="<%=request.getContextPath()%>/login" class="form-horizontal" method="post">
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">
					<span class="glyphicon glyphicon-user" style="font-size: 20px;"> </span>
				</label>
				<div class="col-sm-10">
					<input onBlur="checkPhoneInput()" type="text" class="form-control" id="username"
						   name="username" placeholder="请输入您的账号">
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">
					<span class="glyphicon glyphicon-lock" style="font-size: 20px;"></span>
				</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password"
						   name="password" placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<div class="btn-container">
					<button type="button" class="btn btn-success" onclick="window.location.href('view/register.jsp')">注册</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button onclick="checkId()" type="submit" class="btn btn-danger">登录</button>
				</div>
			</div>
			<div  class="form-group">
				<div  class="forget-div">
					<a href="#" class="forget-txt">忘记密码？</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>