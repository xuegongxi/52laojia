<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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



.mn {
	overflow: hidden;	
	margin-top: 100px;
	margin-left: 100px;
}
.mn img{
	width: 40px;
	height: 40px;
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
				<c:choose>
					<c:when	test="${addstate==true}">
					    <img alt="" src="images/register/ok1.png"><span>${sessionScope.username}</span>注册成功！
                        <a href='view/person_main.jsp' class='index_font'>如果您的浏览器没有自动跳转,请点击这里</a>	
					</c:when>
					<c:otherwise>
						<img alt="" src="images/register/error.png">注册失败！(由于网络问题，或是系统原因)
                        <a href='register.jsp' class='index_font'>请重新注册</a>	
					</c:otherwise>
				</c:choose>
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