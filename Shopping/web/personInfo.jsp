<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>图书管理</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body onunload="goodbye()">

<div id="all">
<div id="title"style="margin-top:2%;">
<p style="text-align:center;">图书管理系统</p>
</div>
<div id="top"style="margin-left:10%;margin-top:1%;float:left;width:90%;height:10%">
<ul class="nav nav-tabs">
	<li><a href="homepage.jsp">主页</a></li>
	<li><a href="cartlist.jsp">我的订单</a></li>
	<li><a href="history.jsp">购买历史</a></li>
	<li class="dropdown" style="float:right">
		<a class="dropdown-toggle"data-toggle="dropdown" href="#">
		 <span class="glyphicon glyphicon-th-list"></span>&nbsp;
			个人中心 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="personInfo.jsp">
          <span class="glyphicon glyphicon-user"></span>&nbsp;User
        </a></li>
            <li><a href="#"><span class="glyphicon glyphicon-cog"></span>&nbsp;设置</a></li>
            <li><a href="homepage.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;主页</a></li>
			<li><a href="cartlist.jsp">我的购物车</a></li>
			<li><a href="history.jsp">购买记录</a></li>
			<li class="divider"></li>
		<li>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" style="float:center;"class="btn btn-primary btn-sm" id="btnClose"  onClick="custom_close()">退出</button>
			</li>
		</ul>
	</li>
</ul>
</div>
<!--个人信息 -->

<p style="margin-left:20%;margin-top:8%;">个人信息</p>
<div style="width:100%;height:100%">
<div style="margin-right:2%;margin-left:15%;margin-top:4%;float:left; width:20%;height:60%">
      <img style="width:250px;height:300px;" 
       src="img/person.jpg" alt="叶子图书"class="img-rounded">                                    
</div>
<div style=";margin-top:18%;margin-left:8%;float:left; width:20%;height:60%">
      <p>手机号：&nbsp;<span id="iponeNumber">13015846233</span></p>  
      <p>邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="iponeNumber">13015@qq.com</span></p>                                  
</div>
</div>
<script>

function minus(){
	var num=parseInt(document.getElementById('number').innerHTML);
	var price=parseInt(document.getElementById('price').innerHTML);
	if(num>0){
		document.getElementById('number').innerHTML=num-1;
		var temp=price*(num-1);
		document.getElementById('sumNumber').innerHTML=temp;
	}
	else{
		document.getElementById('number').innerHTML=0;
		document.getElementById('sumNumber').innerHTML=0;
	}
}
function plus(){
	var num=parseInt(document.getElementById('number').innerHTML);
	var price=parseInt(document.getElementById('price').innerHTML);
	document.getElementById('number').innerHTML=num+1;
	var temp=price*(num+1);
	document.getElementById('sumNumber').innerHTML=temp;
}
//购买中相应进入哪个图书页面
function buypage(){
	
}
function custom_close(){
    if(confirm("您确定退出吗？")){
        window.opener=null;
        window.open('','_self');
        window.close();
    }
    else{
    }
}
</script>
</body>
</html>