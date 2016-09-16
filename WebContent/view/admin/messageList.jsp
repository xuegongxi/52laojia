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
<link rel="stylesheet" type="text/css"  href="<%=path%>/css/page.css"/>
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
<SCRIPT type="text/javascript"	src="<%=path%>/script/jquery-1.4.2.min.js"></SCRIPT>
<SCRIPT type="text/javascript"	src="<%=path%>/css/persion/usercenter.d4d53894.js"></SCRIPT>
<script type="text/javascript"	src="<%=path%>/js/banner1.js"></script>
<SCRIPT type="text/javascript"	src="<%=path%>/script/jquery.min.js"></SCRIPT>
<script type="text/javascript" src="<%=path%>/js/jquery-1.6.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.myPagination.js"></script>
<script type="text/javascript" src="<%=path%>/js/msgbox/msgbox.js"></script>

<style>
A:link {
	color: blue;
	text-decoration: underline;
}
A:hover {
	color:black;
	text-decoration:none;
}
.dl{background:#D4E4E4;height:26px;border:1px solid #ccc;padding-top: 3PX;font-size: 14px};
</style>
<script type="text/javascript">
function checklogin(){
	var session_username ='${sessionScope.username}';
	if(session_username==""){
		window.location.href='<%=request.getContextPath()%>/index.jsp';
		}
	}
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
					  url: "<%=path%>/news.do?method=getNewsListByAdmin",
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
		 
		 $("#mytab > tbody").html(insetViewData);
		 $('#mytab > tbody > tr:even').addClass('a1'); //奇偶变色，添加样式 
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
			              url: "<%=path%>/news.do?method=getNewsList",
						  dataType: 'json', 
						  param:{on:true,page:1,url_param:formData},
						  callback: 'ajaxCallBack'
			            }
			    });
		});
	}

	function createTR(obj) {
		var tr = "<tr id="+obj.news_id +">";
		tr += "<td>" + obj.rowno + "</td>";
		tr += "<td><a target='_blank' href='<%=path%>/news.do?method=news_detail&news_id="+obj.news_id+"'>" + obj.news_title + "</a></td>";
		tr += "<td>" + obj.create_time + "</td>";
		tr += "<td><a href='"+obj.approve_state+"'>" + obj.approve_state + "</a></td>";
		tr += "<td><input type='button' onclick='del(" + obj.news_id + ")' value='删除'/></td>";
		tr += "</tr>";
		return tr;
	}
	
	function del(id){
		$.ajax( {
			type : "POST",
			url : "<%=path%>/news.do?method=del&id=" + id,
			dataType: "json",
			success : function(data) {
				if(data.del == "true"){
					alert("删除成功！");
					$("#" + id).remove();
				}
				else{
					alert("删除失败！");
				}
			},
			error :function(){
				alert("网络连接出错！");
			}
		});
		}
</script>
</head>
<body onload="checklogin()">
	<iframe style="width: 100%; height: 200px" scrolling="no"
		frameborder="0" src="<%=request.getContextPath()%>/header.jsp"></iframe>
	<DIV class="usercenter_box">
		<DIV class="usercenter clearfix">
			<DIV class="usercenter_bg"></DIV>
			<jsp:include page="/view/admin/left_menu.jsp"></jsp:include>
			<!--start scenterContent-->
			<div class="usercenter_con">
			<DIV class="user_center_tablebox">
				<TABLE id="mytab"
					style="padding: inherit; border-collapse: separate; border-spacing: 1px;"
					border="0" cellSpacing="1" cellPadding="0" width="100%"
					bgColor="#aad9f7">
					<thead>
						<TR class="user_center_tabletitle">
						    <TD width="5%" align="center">序号</TD>
							<TD width="50%" align="center">信息标题</TD>
							<TD width="17%" align="center">提交时间</TD>
							<TD width="14%" align="center">状态</TD>
							<TD width="19%" align="center">操作</TD>
						</TR>
                    </thead>
						<tbody>
						  <tr class="a1">
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  </tbody>
						<c:forEach items="${list}" var="news" varStatus="status">
								<tr>
								    <td>${ status.index + 1}</td>
									<td class="rela_pad90" align="left"><A  target="_blank"  href="news.do?method=news_detail&news_id=${news.news_id}"><c:out value="${news.news_title}"/></A></td>
									<td align="center"><c:out value="${news.create_time}" /></td>
									<td align="center">待审核</td>
									<td align="center"><input type="button" onclick="del('<c:out value="${news.news_id}"/>')" value="删除"/></td>
								</tr>
						</c:forEach>	
				</TABLE>
				<div id="demo1"></div>
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