<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<body>
<DIV class="usercenter_nav">
	<DIV class="bigtitle">
		<A href="#">我的中心</A>
	</DIV>
	<DIV class="item">
		<DIV class="listtitle on">
			<I></I>基础信息管理
		</DIV>
		<UL class="item_list">
			<LI><A href="<%=request.getContextPath() %>/view/admin/userList.jsp">用户管理</A></LI>
			<LI><A href="#">我的旅游</A></LI>
			<LI><A href="#">品质生活</A></LI>
			<LI><A href="#">老乡会</A></LI>
		</UL>
	</DIV>
	<DIV class="item">
		<DIV class="listtitle on">
			<I></I>信息审核管理
		</DIV>
		<UL class="item_list">
			<LI><A href="<%=request.getContextPath() %>/sendMessage.jsp">信息发布</A></LI>
			<LI><A href="<%=request.getContextPath() %>/view/admin/messageList.jsp">信息列表</A></LI>
			<!--li>
                            <a href="/healthmanage/nolist">患者选择</a>
                        </li-->
		</UL>
	</DIV>
	<DIV class="item">
		<DIV class="listtitle on">
			<I></I>收藏与订阅
		</DIV>
		<UL class="item_list">
			<LI><A href="#">我的收藏</A></LI>
			<LI><A href="#">我的订阅</A></LI>
			<LI><A href="#">收藏文章</A></LI>
		</UL>
	</DIV>
	<DIV class="item">
		<DIV class="listtitle">
			<I></I>我的账户
		</DIV>
		<UL style="display: none;" class="item_list">
			<LI><A href="#">我的个人资料</A></LI>
			<LI><A href="#">更改手机</A></LI>
			<LI><A href="#">修改密码</A></LI>
		</UL>
	</DIV>
	<DIV class="item">
		<DIV class="listtitle">
			<I></I>通知中心
		</DIV>
		<UL style="display: none;" class="item_list">
			<LI><A href="#">站内信</A></LI>
		</UL>
	</DIV>
</DIV>
</body>