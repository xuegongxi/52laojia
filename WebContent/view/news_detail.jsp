<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${news_title}--我爱老家</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<SCRIPT type="text/javascript" src="<%=request.getContextPath() %>/script/jquery.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath() %>/script/jquery-1.4.2.min.js"></SCRIPT>
<SCRIPT>
	jQ = jQuery.noConflict();
</SCRIPT>
<style type="text/css">
.bm {
	margin-bottom: 10px;
	background: rgb(255, 255, 255);
	border: 1px solid rgb(205, 205, 205);
}

.bm p {
	margin: 0 0 20px 0;
	font-size: 16px;
	text-indent: 30px;
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
				<DIV id="main_message" class="bm">
					${newscontent}
				</DIV>
			</DIV>
		</DIV>
	</DIV>

<!-- JiaThis Button BEGIN --><div id="ckepop">
<span class="jiathis_txt">分享到：</span>
<a class="jiathis_button_weixin">微信</a> 
<a href="http://www.jiathis.com/share"  class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
<a class="jiathis_counter_style"></a> </div> 
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1" charset="utf-8"></script>
</div> <!-- JiaThis Button END -->




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