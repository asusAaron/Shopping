<%@ page language="java" contentType="text/html; charset=utf-8"
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
		} else if (document.getElementById("id").value == "") {
			alert("请输入账号");
			return false;
		} else if ((document.getElementById("id").value).length!=11) {
			alert("账号格式不对，请重新输入！");
			return false;
		} else if (document.getElementById("password").value == "") {
			alert("请输入密码！");
			return false;
		} else {
			return true;
		}

	}
//检查输入的账号位数，不对就把输入的内容颜色设置为红色警告，正确位数将字体颜色设置为黑色
function checkPhoneInput(){
	var num=document.getElementById("phoneInput").value;
	if(isNaN(num)){
		document.getElementById("phoneInput").style.color='red';
		document.getElementById("checkPhoneInputResult").innerHTML="手机号必须全部为数字！";
		document.getElementById("checkPhoneInputResult").style.color='red';
	}
	else{
	//获得输入字符
	var input=document.getElementById("phoneInput").value;
	if(input.length!=11){
		document.getElementById("phoneInput").style.color='red';
		document.getElementById("checkPhoneInputResult").innerHTML="手机号位数错误，请重新输入";
		document.getElementById("checkPhoneInputResult").style.color='red';
	}	
	else{
		document.getElementById("phoneInput").style.color='black';
		document.getElementById("checkPhoneInputResult").innerHTML="手机号位数正确";
		document.getElementById("checkPhoneInputResult").style.color='green';
	}
        }
}
//检查第一次输入的密码
function checkPassword(){
	var input=document.getElementById("passwordInput").value;
	if(input.length<6){
		document.getElementById("checkPasswordResult").innerHTML="密码长度不够，请重新输入";	
		document.getElementById("checkPasswordResult").style.color='red';
	}
	else{
		document.getElementById("checkPasswordResult").innerHTML="操作正确！";	
		document.getElementById("checkPasswordResult").style.color='green';
	}
}
//检查两次输入的密码匹配问题
function checkSame(){
	var input=document.getElementById("passwordInputAgain").value;
	var input1=document.getElementById("passwordInput").value;
	if(input!=input1){
		document.getElementById("checkSameResult").innerHTML="两次输入密码不匹配，请重新输入";	
		document.getElementById("checkSameResult").style.color='red';
	}
	else{
		document.getElementById("checkSameResult").innerHTML="操作正确！";	
		document.getElementById("checkSameResult").style.color='green';
	}
}
//检查密保是不是已经填写
function checkSecurity(){
	var input=document.getElementById("security").value;
	if(input.length>0){
		document.getElementById("checkSecurityResult").innerHTML="操作正确！";	
		document.getElementById("checkSecurityResult").style.color='green';
	}
	else{
		document.getElementById("checkSecurityResult").innerHTML="必须输入密保信息！";	
		document.getElementById("checkSecurityResult").style.color='red';
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
			width: 35%;
			margin-top: 2%;
			margin-left: 28%;
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
			width: 70%;
			margin-top: 0;
		}
		.form-span{
		    width: 10%;	
		    float:left;	
		    margin-left:6%;
		    margin-top:2%;
		    font-style: STKaiti;
		    font-weight:800;
		}
		.form-pgroup{
			width: 70%;
			margin-top: 0;
		}
		.form-lastgroup{
			width: 70%;
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
		.a{
		    width: 100%;
		    margin-left:11%;
		    margin-top:2%;
		 }
		 。p{
		    margin-left:4%;
		 }
	</style>
</head>
<body style="background: url(../resource/2.jpg) no-repeat center fixed; background-size: 100%;">
	<div class="login-box">
		<h3 class="login-title">注册</h3>
		<form action="<%=request.getContextPath()%>/login" class="form-horizontal" method="post">
			<div class="form-group">
				<label for="phoneInput" class="col-sm-2 control-label">
					<span class="glyphicon glyphicon-envelope"> </span>
				</label>
				<div class="col-sm-10">
					<input onBlur="checkPhoneInput()"id="phoneInput" type="text" class="form-control" 
						   name="username" placeholder="请输入您的手机号">
				</div>
			</div>
			<p id="checkPhoneInputResult"class="p"></p>
			<div class="form-group">
				<label  for="passwordInput" class="col-sm-2 control-label"> <span
						class="glyphicon glyphicon-lock"></span>
				</label>
				<div class="col-sm-10">
					<input onBlur="checkPassword()" id="passwordInput"type="password" class="form-control" 
						   name="password" placeholder="请输入密码,密码的个数必须大于6">
				</div>
			</div>
			<p id="checkPasswordResult"class="p"></p>
			<div class="form-group">
				<label for="passwordInputAgain" class="col-sm-2 control-label"> <span
						class="glyphicon glyphicon-lock"></span>
				</label>
				<div class="col-sm-10">
					<input onBlur="checkSame()"id="passwordInputAgain"type="password" class="form-control"
						   name="password" placeholder="请再次输入密码">
				</div>
			</div>		
			<p id="checkSameResult"class="p"></p>
			<div class="form-pgroup">	
			<span class="form-span">密保</span>		
				<div class="col-sm-10">
					<input onBlur="checkSecurity()" id="security"type="text" class="form-control" 
						   placeholder="请输入你喜欢的人姓氏？";>
				</div>
			</div>
			<p id="checkSecurityResult"class="p"></p>
			<div class="form-lastgroup">
				<div class="btn-container">
				   <a class="a" href="register.jsp"><button onclick="checkId()" class="btn btn-success">
				      重置</button></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button style="margin-bottom:10%;margin-top: 2%;" onclick="checkId()" class="btn btn-danger">确认注册</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>