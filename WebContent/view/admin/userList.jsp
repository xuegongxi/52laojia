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
<link rel="stylesheet" type="text/css" href="<%=path%>/css/where.css"/>
<link rel="stylesheet" type="text/css"  href="<%=path%>/css/style.css"/>
<link rel="stylesheet" type="text/css"  href="<%=path%>/css/page.css"/>
<LINK rel="stylesheet" type="text/css"	href="<%=path%>/css/table/table.css">
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
<script type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
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
					  url: "<%=path%>/user.do?method=getUserList",
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
			              url: "<%=path%>/user.do?method=getUserList",
						  dataType: 'json', 
						  param:{on:true,page:1,url_param:formData},
						  callback: 'ajaxCallBack'
			            }
			    });
		});
	}

	function createTR(obj) {
		var tr = "<tr id="+obj.userid +">";
		tr += "<td>" + obj.rowno + "</td>";
		tr += "<td>" + obj.username + "</a></td>";
		tr += "<td>" + obj.nickname + "</td>";
		tr += "<td>" + obj.email + "</td>";
		tr += "<td>" + obj.phone + "</td>";
		tr += "<td>" + obj.create_time + "</td>";
		tr += "<td><input type='button' onclick='del(" + obj.userid + ")' value='删除'/><input type='button' onclick='resetPassword(" + obj.userid + ")' value='重置密码'/></td>";
		tr += "</tr>";
		return tr;
	}
	
	function del(id){
		$.ajax( {
			type : "POST",
			url : "<%=path%>/user.do?method=del&id=" + id,
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
	function resetPassword(id){
		$.ajax( {
			type : "POST",
			url : "<%=path%>/user.do?method=resetPassword&id=" + id,
			dataType: "json",
			success : function(data) {
				if(data.reset == "true"){
					alert("重置密码成功！");
				}
				else{
					alert("重置密码失败！");
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
				<form id="queryForm" name="queryForm">
					<table width="100%" id="tab">
						<thead>
							<tr>
								<th colspan="7">查询条件</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td_css">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
								<td colspan="2"><input type="text" id="username"
									name="username" style="width: 130px; color: #000;" /></td>
								<td class="td_css"> &nbsp;&nbsp; 昵称：</td>
								<td colspan="2"><input type="text" id="nickname"
									name="nickname" style="width: 130px; color: #000;"/></td>
								<td colspan="1"><input id="query" name="query"
									type="button"
									style="width: 63px; height: 25px; line-height: 21px; margin: 0 50px 0 0px; font-weight: bold; float: right;"
									value="搜索" /></td>
							</tr>
							
							<tr class="tr_edd">
								<td class="td_css">邮箱：</td>
								<td colspan="2"><input type="text" id="email"
									name="email" style="width: 130px; color: #000;" /></td>
									<td class="td_css">手机号：</td>
								<td colspan="2"><input type="text" id="phone"
									name="phone" style="width: 130px; color: #000;" /></td>
							</tr>
							<tr>
								<td class="td_css">创建日期：</td>
								<td colspan="4"><input name ="start_date"class="Wdate" type="text" id="d15" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
								&nbsp;至&nbsp;   <input name="end_date" class="Wdate" type="text" id="d15" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
								</td>
								<td class="td_css">删除状态：</td>
								<td colspan="2"><label style="margin: 0 10px 0 0;">
										<label style="margin: 0 10px 0 0;"> <input
											name="is_delte" type="checkbox" value="1" /> 已删除
									</label> </td>
								
							</tr>
						</tbody>
					</table>
				</form>


				<DIV class="user_center_tablebox">
			
				<TABLE id="mytab"
					style="padding: inherit; border-collapse: separate; border-spacing: 1px;"
					border="0" cellSpacing="1" cellPadding="0" width="100%"
					bgColor="#aad9f7">
					<thead>
						<TR class="user_center_tabletitle">
						    <TD width="5%" align="center">序号</TD>
							<TD width="25%" align="center">用户名</TD>
							<TD width="15%" align="center">昵称</TD>
							<TD width="25%" align="center">邮箱</TD>
							<TD width="25%" align="center">电话</TD>
							<TD width="20%" align="center">创建时间</TD>
							<TD width="25%" align="center">操作</TD>
						</TR>
                    </thead>
						<tbody>
						  <tr class="a1">
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
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
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  </tbody>						
				</TABLE>
				<div id="demo1"></div>
				</DIV>
			</div>
		</DIV>
	</DIV>	
	<div class="theme-popover-mask"></div>
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