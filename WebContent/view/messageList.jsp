<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.laojia.news.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=path%>">
<!-- <title>我爱我家-个人空间管理</title> -->
<link rel="stylesheet" type="text/css"  href="<%=path%>/css/style.css"/>
<LINK rel="stylesheet" type="text/css"	href="<%=path%>/css/persion/userspace.css">
<LINK rel="stylesheet" type="text/css"	href="<%=path%>/css/persion/erweima.css">
<LINK rel="stylesheet" type="text/css"	href="<%=path%>/css/persion/css.css">
<LINK rel="stylesheet" type="text/css"	href="<%=path%>/css/persion/css(1).css">
<LINK rel="stylesheet" type="text/css"	href="<%=path%>/css/persion/base.css">
<LINK rel="stylesheet" type="text/css"	href="<%=path%>/css/persion/nav.css">
<LINK rel="stylesheet" type="text/css"	href="<%=path%>/css/persion/top_change.adc5d856.css">
<LINK rel="stylesheet" type="text/css"	href="<%=path%>/css/persion/scenter.css">
<LINK rel="stylesheet" type="text/css"	href="<%=path%>/css/persion/reveiwnotice.css">
<LINK rel="stylesheet"	href="<%=path%>/css/persion/index_nav_noshadow_style.css">
<LINK rel="stylesheet" type="text/css"	href="<%=path%>/css/persion/usercenter.css">
<LINK rel="stylesheet" type="text/css"	href="<%=path%>/css/persion/style_3_common.css">
<SCRIPT language="javascript" type="text/javascript"	src="<%=path%>/script/jquery-1.4.2.min.js"></SCRIPT>
<SCRIPT type="text/javascript"	src="<%=path%>/css/persion/usercenter.d4d53894.js"></SCRIPT>
<script type="text/javascript"	src="<%=path%>/js/banner1.js"></script>
<SCRIPT type="text/javascript"	src="<%=path%>/script/jquery.min.js"></SCRIPT>

<style>
A:link {
	color: blue;
	text-decoration: underline;
}
A:hover {
	color:black;
	text-decoration:none;
}
</style>
<script type="text/javascript">
function checklogin(){
	var session_username ='${sessionScope.username}';
	if(session_username==""){
		window.location.href='<%=request.getContextPath()%>/index.jsp';
		}
	}

	$(function() {
		$(".doc_down_codeimg .close").bind("click", function() {
			$(this).parent("div").css("display", "none");
		});
	});
</script>
</head>
<body onload="">
	<iframe style="width: 100%; height: 200px" scrolling="no"
		frameborder="0" src="<%=request.getContextPath()%>/header.jsp"></iframe>
	<DIV class="usercenter_box">
		<DIV class="usercenter clearfix">
			<DIV class="usercenter_bg"></DIV>
			<jsp:include page="/view/left_menu.jsp"></jsp:include>
			<!--start scenterContent-->
			<div class="usercenter_con">
			<DIV class="user_center_tablebox">
				<TABLE
					style="padding: inherit; border-collapse: separate; border-spacing: 1px;"
					border="0" cellSpacing="1" cellPadding="0" width="100%"
					bgColor="#aad9f7">
					<TBODY>
						<TR class="user_center_tabletitle">
						    <TD width="5%" align="center">序号</TD>
							<TD width="50%" align="center">信息标题</TD>
							<TD width="17%" align="center">提交时间</TD>
							<TD width="14%" align="center">状态</TD>
							<TD width="19%" align="center">操作</TD>
						</TR>

						<c:forEach items="${list}" var="news" varStatus="status">
								<tr>
								    <td>${ status.index + 1}</td>
									<td class="rela_pad90" align="left"><A  target="_blank"  href="news.do?method=news_detail&news_id=${news.news_id}"><c:out value="${news.news_title}"/></A></td>
									<td align="center"><c:out value="${news.create_time}" /></td>
									<td align="center">待审核</td>
									<td align="center"><input type="button" onclick="del('<c:out value="${news.news_id}"/>')" value="删除"/></td>
								</tr>
						</c:forEach>	

                      <!-- 
							<TR>
							<td>1</td>
							<TD class="rela_pad90" align="left"><SPAN class="green">网上咨询</SPAN>
								：胎儿多囊肾<BR> 请求医生： 卢彦平 301医院 妇产科</TD>
							<TD align="center">2016-05-23<BR> 16:47
							</TD>
							<TD align="center"><SPAN>分诊完成</SPAN></TD>
							<TD align="center"><A class="blue"
								href="http://passport.haodf.com/myhealthcare/myservicedetail?id=4465760676&amp;type=INTENTION">查看详情</A></TD>
						</TR> -->
					</TBODY>
				</TABLE>
				<div id="Pagination" class="flickr" style="text-align:left"></div>
			</DIV>
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
</body>
</html>