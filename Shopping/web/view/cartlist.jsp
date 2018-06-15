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
<!--购物车 -->
<div style="margin:0 2% 0 2%;">
<table class="table table-striped table-bordered table-hover">
	<caption style="margin-left:47%;margin-top:4%;">我的购物车</caption>
	<thead>
		<tr>
			<th style="text-align:center">书名</th>
			<th style="text-align:center">操作状态</th>
		</tr>
	</thead>
	<tbody>
	    <tr>
	        <td>
	<div style="margin-right:1%;margin-left:20%;margin-top:0;float:left;width:40%;height:20%">
<div class="row">
        <div class="thumbnail">
            <img src="img/book.jpg" alt="叶子图书"
            style="width:150px;height:200px;">                           
            <div class="caption">   
            <h3 style="text-align:center;">叶子图书</h3>           
                <p>售价:&nbsp;<span id="price">100</span></p>
                <p>库存:&nbsp;<span id="bookNumber">80</span></p>
            </div>
        </div>  
</div>
</div></td>
			<td>
   <div style="margin-right:1%;margin-top:4%;margin-left:30%;float:left; width:30%;height:40%">
<p id="actor">作者: [英] 夏洛特·勃朗特 著</p>
<p id="publisher">出版社: 世界图书出版公司</p>
<p id="publishTime">出版时间: 2011-10</p>
<div>
        <p>购买数量
        <button type="button"onclick="minus()" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-minus"></span>
        </button>
        <span id="number">0</span>
        <button type="button"onclick="plus()" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-plus"></span>
        </button>
        </p>
</div>
<p>总价格为：&nbsp;<span id="sumNumber">0</span></p>
<div style="margin-left:1%;margin-top:30%">
<button type="button" class="btn btn-info"onclick="buy()">立即购买</button>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="cartlist.jsp"><button type="button" class="btn btn-danger"onclick="checkcart()">取消订单</button></a>
</div>
</div></td>
		</tr>
	</tbody>
</table>
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
//购买图书
function buy(){
	var money=parseInt(document.getElementById('sumNumber').innerHTML);
	var r=confirm("你 购买的图书总价为："+money);
	if (r==true){
		alert("你已经成功付款！");//成功付款
	}
	else{
		alert(x="付款失败！");//取消付款
	}
}
//购买中相应进入哪个图书页面
function checkcart(){
	var x;
	var r=confirm("你确定取消该订单吗？");
	if (r==true){
		alert("取消订单成功！");//如果点击了确认，那么链接启动，删除数据库中的内容后重新将订单写出来
	}
	else{
		alert("取消失败！");//取消操作，一切依旧
	}
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