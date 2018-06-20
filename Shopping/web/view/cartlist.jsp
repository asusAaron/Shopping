<%@ page import="model.Book" %>
<%@ page import="java.util.List" %>
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
	<style type="text/css">
	.content{width:60%;margin:10px auto;}
	.hide_box{z-index:999;filter:alpha(opacity=50);background:#666;opacity: 0.5;-moz-opacity: 0.5;left:0;top:0;height:99%;width:100%;position:fixed;display:none;}
	.shang_box{width:540px;height:540px;padding:10px;background-color:#fff;border-radius:10px;position:fixed;z-index:1000;left:50%;top:50%;margin-left:-280px;margin-top:-280px;border:1px dotted #dedede;display:none;}
	.shang_box img{border:none;border-width:0;}
	.dashang{display:block;width:100px;margin:5px auto;height:25px;line-height:25px;padding:10px;background-color:#E74851;color:#fff;text-align:center;text-decoration:none;border-radius:10px;font-weight:bold;font-size:16px;transition: all 0.3s;}
	.dashang:hover{opacity:0.8;padding:15px;font-size:18px;}
	.shang_close{float:right;display:inline-block;}
	        .shang_logo{display:block;text-align:center;margin:20px auto;}
	.shang_tit{width: 100%;height: 75px;text-align: center;line-height: 66px;color: #a3a3a3;font-size: 16px;background: url('/dsimg/cy-reward-title-bg.jpg');font-family: 'Microsoft YaHei';margin-top: 7px;margin-right:2px;}
	.shang_tit p{color:#a3a3a3;text-align:center;font-size:16px;}
	.shang_payimg{width:140px;padding:5px;border:6px solid #EA5F00;margin:0 auto;border-radius:3px;height:140px;}
	.shang_payimg img{display:block;width:120px;height:120px;margin:1% 1% 1% 1%; }
	.pay_explain{text-align:center;margin:10px auto;font-size:12px;color:#545454;}
	.radiobox{width: 16px;height: 16px;background: url('https://static.runoob.com/images/dashang/radio2.jpg');display: block;float: left;margin-top: 5px;margin-right: 14px;}
	.checked .radiobox{background:url('https://static.runoob.com/images/dashang/radio1.jpg');}
	.shang_payselect{text-align:center;margin:0 auto;margin-top:40px;cursor:pointer;height:60px;width:280px;}
	.shang_payselect .pay_item{display:inline-block;margin-right:10px;float:left;}
	.shang_info{clear:both;}
	.shang_info p,.shang_info a{color:#C3C3C3;text-align:center;font-size:12px;text-decoration:none;line-height:2em;}
	</style>
    <%
        String message = (String) request.getAttribute("deleteMessage");
        if(message!=null&&message!="")
        {
    %>
    <script type="text/javascript">
        alert("<%=message%>");
    </script>
    <%
        }
    %>
</head>

<body onunload="goodbye()">
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
			<li><a href="/view/personInfo.jsp">
          <span class="glyphicon glyphicon-user"></span>&nbsp;User
        </a></li>
            <li><a href="#"><span class="glyphicon glyphicon-cog"></span>&nbsp;设置</a></li>
            <li><a href="/book"><span class="glyphicon glyphicon-home"></span>&nbsp;主页</a></li>
			<li><a href="/cartlist">我的购物车</a></li>
			<li><a href="/view/history.jsp">购买记录</a></li>
			<li class="divider"></li>
		<li>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" style="float:center;"class="btn btn-primary btn-sm" id="btnClose"  onClick="custom_close()">退出</button>
			</li>
		</ul>
	</li>
</ul>
</div>
<!--购物车 -->
<div style="margin:0 1% 0 4%;">
<table class="table table-striped table-bordered table-hover">
	<caption style="margin-left:47%;margin-top:2%;">我的购物车</caption>
	<thead>
		<tr>
			<th style="text-align:center">书名</th>
			<th style="text-align:center">操作状态</th>
		</tr>
	</thead>
	<tbody>
    <%
        List<Book> books = (List)request.getAttribute("cartlist");
        if(books!=null&&books.size()!=0)
        {
            for(int i=0;i<books.size();i++)
            {
                Book b = books.get(i);

    %>
	    <tr>
	         <td style="vertical-align:bottom; text-align:center;margin:0 1% 0 1%;width:40%;height:10%">
	        <div class="thumbnail">
            <img src=<%=b.getPicSource()%> alt="叶子图书"
            style="width:300px;height:100px;">   
            <div class="caption">   
            <h3 style="text-align:center;"><%=b.getBookName()%></h3>
            <p>售价:&nbsp;<span id="price">￥<%=b.getPrice()%></span></p>
            <p>库存:&nbsp;<span id="bookNumber">80</span></p>               
            </div>       
            </div>                         
            </td>
			<td>
   <div style="margin-right:1%;margin-top:4%;margin-left:30%;float:left; width:30%;height:40%">
<p id="actor">作者：<%=b.getAuthor()%></p>
<p id="publisher">关于: <%=b.getDetail()%></p>
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
<p>总价格为：<span id="sumNumber">0</span></p>
<div style="margin-top:8%">
<a href="javascript:void(0)">
<button type="button" class="btn btn-info"onclick="dashangToggle()">立即购买</button></a>
<a href="/deleteBook?bookId=<%=b.getBookId()%>"><button type="button" class="btn btn-danger"onclick="checkcart()">取消订单</button></a>
</div>
</div></td>
		</tr>
		 <%
             }
         }else{

         %>
    <script type="text/javascript">
        alert("购物车为空!");
    </script>
    <%
        }
    %>
	</tbody>
</table>
</div>
<!-- 支付弹出框 -->
<div class="content">
<div class="hide_box"></div>
<div class="shang_box">
    <a class="shang_close" href="javascript:void(0)" onclick="dashangToggle()" title="关闭"><img src="https://static.runoob.com/images/dashang/close.jpg" alt="取消" /></a>
    <div class="shang_tit">
        <h3>扫码付款</h3>
    </div>
    <div class="shang_payimg">
        <img src="/resource/alipay.jpg" alt="扫码支持" title="扫一扫" />
    </div>
        <div class="pay_explain">请选择付款方式</div>
    <div class="shang_payselect">
        <div class="pay_item checked" data-id="alipay">
            <span class="radiobox"></span>
            <span class="pay_logo"><img src="https://static.runoob.com/images/dashang/alipay.jpg" alt="支付宝" /></span>
        </div>
        <div class="pay_item" data-id="weipay">
            <span class="radiobox"></span>
            <span class="pay_logo"><img src="https://static.runoob.com/images/dashang/wechat.jpg" alt="微信" alt="微信" /></span>
        </div>
    </div>
    <div class="shang_info">
        <p>打开<span id="shang_pay_txt">支付宝</span>扫一扫，即可付款</p>
    </div>
    <div style="text-align:center;margin-top:10%;">
    <a href="javascript:void(0)"><!-- 不需要输出 -->
    <button onclick="dashangToggle()"type="button" class="btn btn-danger">取消支付</button>
    </a>&nbsp;&nbsp;
    <button onclick="checkpay()" type="button" class="btn btn-success">完成支付</button>
    </div>
</div>
</div>
<script>
//按钮数字减去1
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
//按钮数字加1
function plus(){
	var num=parseInt(document.getElementById('number').innerHTML);
	var price=parseInt(document.getElementById('price').innerHTML);
	document.getElementById('number').innerHTML=num+1;
	var temp=price*(num+1);
	document.getElementById('sumNumber').innerHTML=temp;
}

//取消订单
function checkcartfail(){
	var x;
	var r=confirm("你确定取消该订单吗？");
	if (r==true){
		alert("取消订单成功！");//如果点击了确认，那么链接启动，删除数据库中的内容后重新将订单写出来
	}
	else{
		alert("取消失败！");//取消操作，一切依旧
	}
}
//窗口退出
function custom_close(){
    if(confirm("您确定退出吗？")){
        window.opener=null;
        window.open('','_self');
        window.close();
    }
    else{
    }
}
//支付操作
function checkpay(){
	var r=confirm("我们正在进行支付确认\n如果您已经付款就会直接发货，谢谢您的支持。");
	if (r==true)
	 {
		dashangToggle();
	 }
	else
	 {
		dashangToggle();
	 } 
}
$(function(){
    $(".pay_item").click(function(){
        $(this).addClass('checked').siblings('.pay_item').removeClass('checked');
        var dataid=$(this).attr('data-id');
        $(".shang_payimg img").attr("src","img/"+dataid+".jpg");
        $("#shang_pay_txt").text(dataid=="alipay"?"支付宝":"微信");
    });
});
function dashangToggle(){
	var money=parseInt(document.getElementById('sumNumber').innerHTML);
	if(money==0){
		alert("请选择要购买图书数量");
	}
	else{
    $(".hide_box").fadeToggle();
    $(".shang_box").fadeToggle();
	}
}
</script>
</body>
</html>