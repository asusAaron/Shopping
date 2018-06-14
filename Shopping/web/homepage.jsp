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
<body>

<div id="all">
<div id="title"style="margin-top:2%;">
<p style="text-align:center;">图书管理系统</p>
</div>
<div id="top" style="margin-left:10%;margin-top:1%;float:left;width:90%;height:10%">
<ul class="nav nav-tabs">
	<="#li><a href="homepage.jsp">主页</a></li>
    <li><a href">我的订单</a></li>
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
			<li><a href="#"><span class="glyphicon glyphicon-th"></span>&nbsp;我的订单</a></li>
			<li><a href="history.jsp"> <span class="glyphicon glyphicon-book"></span>&nbsp;购买记录</a></li>
			<li class="divider"></li>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" style="float:center;"class="btn btn-primary btn-sm" id="btnClose"  onClick="custom_close()">退出</button>
			</li>
		</ul>
	</li>
</ul>
</div>
<div id="left" style="margin-left:1%;margin-top:7%;float: left; width: 8%;height:70%">
<ul class="nav nav-pills nav-stacked">
	<li class="disabled"><a href="#">书籍种类</a></li>
	<li><a href="#">文学</a></li>
	<li><a href="#">漫画</a></li>
	<li><a href="#">历史</a></li>
	<li><a href="#">Java</a></li>
	<li><a href="#">PHP</a></li>
</ul>
</div>
<div id="text"style="margin-right:2%;margin-top:2%;float: right; width: 80%;height:10%">
<ul class="nav nav-tabs">
    <li class="disabled"><a href="#">图书排序</a></li>
	<li><a href="#">默认排序</a></li>
	<li><a href="#">按价格排序</a></li>
	<li><a href="#">按存储量排序</a></li>
</ul>
</div>
<div id="introduce"style="margin-right:2%;margin-top:2%;float:left; width: 80%;height:60%">
<div class="row">
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="img/book.jpg" alt="叶子图书"
            style="width:150px;height:200px;">                           
            <div class="caption">   
            <h3 style="text-align:center;">叶子图书</h3>           
               <p>售价:&nbsp;<span id="price">100</span></p>
               <p>库存:&nbsp;<span id="bookNumber">80</span>
                   <a style="float:right;"href="buybook1.jsp" class="btn btn-primary" role="button">购买
                   </a>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="img/book1.jpg"alt="十万个为什么"
            style="width:150px;height:200px;">
            <div class="caption">
                <h3 style="text-align:center;">十万个为什么</h3>
                <p>售价:&nbsp;120</p>
                <p>库存:&nbsp;12
                    <a style="float:right;"href="buybook2.jsp" class="btn btn-primary" role="button">购买
                    </a>             
                </p>
            </div>
        </div>
    </div>  
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="img/logo.jpg"alt="标签图书"
            style="width:150px;height:200px;">
            <div class="caption">
                <h3 style="text-align:center;">标签图书</h3>
                <p>售价:&nbsp;50</p>
                <p>库存:&nbsp;85
                    <a style="float:right;"href="buybook3.jsp" class="btn btn-primary" role="button">购买
                    </a>             
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="img/jianai.jpg"alt="简爱"
            style="width:150px;height:200px;">
            <div class="caption">
                <h3 style="text-align:center;">简爱</h3>
                <p>售价:&nbsp;60</p>
                <p>库存:&nbsp;80
                    <a id="4"style="float:right;"href="buybook4.jsp" class="btn btn-primary" role="button">购买
                    </a>             
                </p>
            </div>
        </div>
    </div>
</div>
<ul class="pager">
	<li class="previous"style="margin-left:0%;"><a href="#">&larr; 上一页</a></li>
	<li class="next"style="margin-right:0%;"><a href="#">下一页 &rarr;</a></li>
</ul>
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
</script>
</body>
</html>