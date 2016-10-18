<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我爱老家--信息列表</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/newsList.css" type="text/css" rel="stylesheet" />
<SCRIPT type="text/javascript"	src="<%=path%>/script/jquery-1.4.2.min.js"></SCRIPT>
<SCRIPT type="text/javascript"	src="<%=path%>/css/persion/usercenter.d4d53894.js"></SCRIPT>
<script type="text/javascript"	src="<%=path%>/js/banner1.js"></script>
<SCRIPT type="text/javascript"	src="<%=path%>/script/jquery.min.js"></SCRIPT>
<script type="text/javascript" src="<%=path%>/js/jquery-1.6.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.myPagination.js"></script>
<script type="text/javascript" src="<%=path%>/js/msgbox/msgbox.js"></script>

<script type="text/javascript">
var myPagination;
$(function() {
	init();
	initEvent();
	
	
	$(".doc_down_codeimg .close").bind("click", function() {
		$(this).parent("div").css("display", "none");
	});
});
function init(){
	var formData = $("#queryForm").serialize(); //序列化表单
    formData = decodeURIComponent(formData, true);	//解码
	myPagination = $("#demo1").myPagination({
				currPage: 1,
				pageSize: 10,
				ajax: {
				  on: true,
				  url: "<%=path%>/index.do?method=getNewsList&enum_code=${enum_code}",
				  dataType: 'json',
				  param:formData,
				  ajaxStart:function(){
					  ZENG.msgbox.show(" 正在加载中，请稍后...", 6, 10000);
				  },onClick:function(page){
					  $.fn.debug(page);
				  },
				  callback: 'ajaxCallBack'
				}
			  }); 
}

//自定义 回调函数  
function ajaxCallBack(data) {
	ZENG.msgbox.hide(); //隐藏加载提示
	var result = data.result;
	var insetViewData = "";
	 $.each(result, function(i) {
		insetViewData += createTR(result[i]);
	 });
	 
	 var divshow = $("#newsdiv");
     divshow.text("");// 清空数据
     divshow.append(insetViewData); // 添加Html内容，不能用Text 或 Val
}

function initEvent() {
	$("#keywords").focus();
	$("#query").click(function() {
		var formData = $("#queryForm").serialize(); //序列化表单
		formData = decodeURIComponent(formData, true); //解码
		 $("#demo1").myPagination({
			 currPage: 1,
		     pageSize: 10,
		      ajax: {
		              on: true,                         
		              url: "<%=path%>/index.do?method=getNewsList&enum_code=${enum_code}",
					  dataType: 'json', 
					  param:{on:true,page:1,url_param:formData},
					  callback: 'ajaxCallBack'
		            }
		    });
	});
}

function createTR(obj) {
	var s="<div class='news_one'><a class='item' href='<%=path%>/news.do?method=news_detail&news_id="+obj.news_id+"' > ";
	if(obj.img_path==null||obj.img_path==""){
	s+="<img src='<%=path%>/images/nopic-1.jpg' alt='"+obj.news_title+"' >";	
	}else{
	s+="<img src='"+obj.img_path+"' alt='"+obj.news_title+"' >";	
	}
	 s+="<div><h1>"+obj.news_title+"</h1>";
	 s+="<p>"+obj.news_from+" "+ obj.create_time+"</p>"
	 s+="<span>"+obj.news_summary+"</span>"
	 s+= "</div></a></div>";
	
	return s;
}
</script>
<SCRIPT type="text/javascript" src="<%=request.getContextPath() %>/js/register.js"></SCRIPT>
<style type="text/css">

</style>
<script type="text/javascript" src="js/banner1.js"></script>
</head>

<body>
	<iframe style="width: 100%; height: 200px" scrolling="no"
		frameborder="0" src="header.jsp"></iframe>
	<DIV id="wp" class="wp">
		<DIV id="ct" class="ptm wp cl">
			<div class="more-list">
			    <div class="sub-banner">新鲜推送</div>
				<div id="newsdiv" class="sub-title"></div>
				<!-- <a class="item"
					href="http://domestic.firefox.sina.com/16/1011/08/FRG4SVYXQ5UKNC2L.html">
					<img
					src="images/news/77de9208jw1f8nzz6rpc3j20gr0av3zs.jpg"
					alt="济南限购令出台后1周网签量减少5500套">
					<div>
						<h1>济南限购令出台后1周网签量减少5500套</h1>
						<p>10月11日 08:05 齐鲁晚报</p>
						<span> 原标题：楼市降温！济南限购令一出，一周网签量少了5500套
							限购令出台一周，济南新建商品住宅网签量出现断崖式下跌，比限购前下降了76%，济南楼市进入降温期。此外，业内人士指出，网签量下降的客观原因还有…</span>
					</div>
				</a> -->
				 <div id="demo1"></div>
			</div>
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