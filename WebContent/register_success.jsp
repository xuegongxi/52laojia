<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="Refresh" CONTENT="300; URL=index.jsp"/>
<title>我爱老家--注册页面</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<SCRIPT type="text/javascript" src="/script/jquery.min.js"></SCRIPT>
<SCRIPT>
	jQ = jQuery.noConflict();
</SCRIPT>
<SCRIPT type="text/javascript">
	var strongpw = new Array();
	var pwlength = 6;
</SCRIPT>
<SCRIPT type="text/javascript" src="/js/register.js"></SCRIPT>
<style type="text/css">
.bm_h {
	background: rgb(242, 242, 242);
	padding: 0px 10px;
	height: 31px;
	line-height: 31px;
	overflow: hidden;
	border-top-color: rgb(255, 255, 255);
	border-bottom-color: rgb(194, 213, 227);
	border-top-width: 1px;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-bottom-style: solid;
	white-space: nowrap;
}

.bbs {
	border-bottom-color: rgb(205, 205, 205) !important;
	border-bottom-width: 1px !important;
	border-bottom-style: solid !important;
}

.bm {
	margin-bottom: 10px;
	background: rgb(255, 255, 255);
	border: 1px solid rgb(205, 205, 205);
}

.bn {
	margin-bottom: 10px;
}

.ptm {
	padding-top: 10px !important;
}

.wp {
	margin: 0px auto;
	width: 998px;
	clear: both;
}

.cl::after {
	height: 0px;
	clear: both;
	display: block;
	visibility: hidden;
	content: ".";
}

.cl {
	zoom: 1;
}

#ct {
	min-height: 300px;
}

.xs2 {
	font-size: 14px !important;
}

.xi2 {
	color: rgb(51, 102, 153);
}

.xi2 a {
	color: rgb(51, 102, 153);
}

.y {
	float: right;
}

.mn {
	overflow: hidden;	
	margin-top: 100px;
	margin-left: 100px;
}
.mn img{
	width: 40px;
	height: 40px;
}

.flb {
	padding: 10px 10px 8px;
	height: 20px;
	line-height: 20px;
}

.flb em {
	color: rgb(51, 102, 153);
	font-size: 14px;
	font-weight: 700;
	float: left;
}

.flb em a {
	text-decoration: none;
}

.rfm {
	margin: 0px auto;
	width: 760px;
	border-bottom-color: rgb(205, 205, 205);
	border-bottom-width: 1px;
	border-bottom-style: dotted;
}

.rfm a {
	color: rgb(51, 102, 153);
}
.rq {
	color: red;
}
.rfm .rq {
	
}

.rfm th {
	padding: 10px 2px;
	line-height: 24px;
	vertical-align: top;
}

.rfm td {
	padding: 10px 2px;
	line-height: 24px;
	vertical-align: top;
}

.rfm .tipwide {
	padding-top: 0px;
}

.rfm th {
	width: 10em;
	text-align: right;
	padding-right: 10px;
}

.rfm .px {
	width: 220px;
}

.rfm .px:focus {
	background: rgb(255, 255, 255);
	border-color: rgb(51, 102, 153);
}

.rfm .p_tip {
	background: rgb(255, 255, 255);
	width: 390px;
	color: rgb(102, 102, 102);
	padding-left: 10px;
	font-style: normal;
	display: none;
	position: absolute;
	z-index: 2;
}

.rfm .p_chk {
	width: 390px;
	color: red;
	padding-left: 10px;
	font-family: Tahoma, "Microsoft Yahei", "Simsun";
	font-weight: 700;
	position: absolute;
	z-index: 1;
}

.rfm #emailmore {
	position: absolute;
}

hr.l {
	background: rgb(205, 205, 205);
	border: currentColor;
	height: 1px;
	color: rgb(205, 205, 205);
}
</style>
<script type="text/javascript" src="js/banner1.js"></script>
</head>

<body>
	<iframe style="width: 100%; height: 200px" scrolling="no"
		frameborder="0" src="header.jsp"></iframe>
	<DIV id="wp" class="wp">
		<DIV id="ct" class="ptm wp cl">
			<DIV class="mn">
			  <img alt="" src="images/register/ok1.png"><span>${sessionScope.username}</span>注册成功！
               <a href='view/person_main.jsp' class='index_font'>如果您的浏览器没有自动跳转,请点击这里</a>
			</DIV>
		</DIV>
	</DIV>





	<div class="footer">
		<p>
			<a href="/gygx/"> 关于我们</a> | <a href=#>人才招聘</a> | <a href="#">联系我们</a>
			| <a href="#">广告合作</a> | <a href="#">业务合作</a> | <a href="#">版权说明</a>
			| <a href="#">免责说明</a> | <a href="#">隐私权保护</a> |<a href="#">法律顾问</a>
		</p>
		<p>
			Copyright 2014-2015 Inc.All Right Reserved <br>我爱老家网
		</p>

	</div>
	<!--footer end-->
</body>
</html>