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
<body >

<div id="all">
<div id="title"style="margin-top:2%;">
<p style="text-align:center;">图书管理系统</p>
</div>
<div id="top"style="margin-left:10%;margin-top:1%;float:left;width:90%;height:10%">
<ul class="nav nav-tabs">
	<li><a href="/book">主页</a></li>
	<li><a href="/cartlist">我的订单</a></li>
	<li><a href="/view/history.jsp">购买历史</a></li>
	<li class="dropdown" style="float:right">
		<a class="dropdown-toggle"data-toggle="dropdown" href="#">
		 <span class="glyphicon glyphicon-th-list"></span>&nbsp;
			个人中心 <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li> <a href="/view/personInfo.jsp">
          <span class="glyphicon glyphicon-user"></span>&nbsp;User
        </a></li>
            <li><a href="#"><span class="glyphicon glyphicon-cog"></span>&nbsp;设置</a></li>
            <li><a href="../book"><span class="glyphicon glyphicon-home"></span>&nbsp;主页</a></li>
			<li><a href="../cartlist">我的订单</a></li>
			<li><a href="/view/history.jsp">购买记录</a></li>
			<li class="divider"></li>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" style="float:center;"class="btn btn-primary btn-sm" id="btnClose"  onClick="custom_close()">退出</button>
			</li>
		</ul>
	</li>
</ul>
</div>
<div style="margin:3%;">
	<table class="table table-bordered">
		<caption style="margin-left:20%;margin-top:2%;color:blue;">图书购买记录</caption>
		<thead>
			<tr>
				<th>图书名称</th>
				<th>付款日期</th>
				<th>交易状态</th>
				<th>确认信息</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>叶子图书</td>
				<td>23/11/2013</td>
				<td id="11"style="color:red;">待发货</td>
				<td><button id="1" type="button"onclick="done(this.id)" class="btn btn-success">确认收货</button></td>
			</tr>
			<tr>
				<td>十万个为什么</td>
				<td>10/11/2013</td>
				<td id="22"style="color:red;">发货中</td>
				<td><button id="2" type="button"onclick="done(this.id)" class="btn btn-success">确认收货</button></td>
			</tr>
			<tr>
				<td>标签图书</td>
				<td>20/10/2013</td>
				<td id="33"style="color:red;">待确认</td>
				<td><button id="3" type="button"onclick="done(this.id)" class="btn btn-success">确认收货</button></td>
			</tr>
			<tr>
				<td>简爱</td>
				<td>20/10/2013</td>
				<td id="44"style="color:red;">发货中</td>
				<td><button id="4"type="button"onclick="done(this.id)" class="btn btn-success">确认收货</button></td>
			</tr>
		</tbody>
</table>
</div>  	
</div>
<script>
function custom_close(){
    if(confirm("您确定退出吗？")){
        window.opener=null;
        window.open('','_self');
        window.close();
    }
    else{
    }
}
//a是一个局部变量，用来获取当前按钮的id,进而找到表格
function done(a){
	document.getElementById(a+a).innerHTML="已收货";
	document.getElementById(a+a).style.color="green";
}
</script>
</body>
</html>