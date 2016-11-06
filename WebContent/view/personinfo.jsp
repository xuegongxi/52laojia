<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我爱我家-个人空间管理</title>
<LINK rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/persion/userspace.css">
<LINK rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/persion/erweima.css">
<LINK rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/persion/css.css">
<LINK rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/persion/css(1).css">
<LINK rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/persion/base.css">
<LINK rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/persion/nav.css">
<LINK rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/persion/top_change.adc5d856.css">
<LINK rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/persion/scenter.css">
<LINK rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/persion/reveiwnotice.css">
<LINK rel="stylesheet"
	href="<%=request.getContextPath()%>/css/persion/index_nav_noshadow_style.css">
<LINK rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/persion/usercenter.css">
<LINK rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/persion/hospital-erweima.css">
<SCRIPT language="javascript" type="text/javascript"
	src="<%=request.getContextPath()%>/script/jquery-1.4.2.min.js"></SCRIPT>
<SCRIPT type="text/javascript"
	src="<%=request.getContextPath()%>/css/persion/usercenter.d4d53894.js"></SCRIPT>
<link href="<%=request.getContextPath()%>/css/style.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/banner1.js"></script>
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
<style type="text/css">

#dddd td{
margin: 0px 23px; padding: 10px 13px; font-size: 13px; border-bottom-color: rgb(220, 220, 220); border-bottom-width: 1px; border-bottom-style: dashed;

}




</style>
</head>
<body onload="checklogin()">
	<iframe style="width: 100%; height: 200px" scrolling="no"
		frameborder="0" src="<%=request.getContextPath()%>/header.jsp"></iframe>
	<DIV class="usercenter_box">
		<DIV class="usercenter clearfix">
			<DIV class="usercenter_bg"></DIV>
			<jsp:include page="/view/left_menu.jsp"></jsp:include>
			<!--start scenterContent-->
			<DIV class="usercenter_con">
				<!--start scenterMain-->
				<DIV class="add-myMsg-box">
					<!--start checkPatients-msg-notice-->
					<DIV class="checkPatients-msg-notice">
						<TABLE>
							<TBODY>
								<TR>
									<TD><SPAN class="red">提示：</SPAN></TD>
								</TR>
								<TR>
									<TD>
										<P>1. 网站郑重承诺对您的个人信息保密，仅用户可见。</P>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</DIV>
					<!--end checkPatients-msg-notice-->
						<TABLE id="dddd" width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-left: 20px">
							<TBODY>
								<TR>
									<TD width="25%" align="right" class="myMsg-right">姓名：</TD>
									<TD width="74%">顶顶顶顶</TD>
								</TR>
								<TR>
									<TD width="25%" align="right" class="myMsg-right">昵称：</TD>
									<TD width="74%">大大大大</TD>
								</TR>
								<TR>
									<TD align="right">性别：</TD>
									<TD></TD>
								</TR>
								<TR>
									<TD align="right"> 出生日期：</TD>
									<TD></TD>
								</TR>
								<TR>
									<TD align="right"> 所在省市：</TD>
									<TD>我玩任務任務任務讓台灣人體為台灣人特別 </TD>
								</TR>
								<TR>
									<TD align="right" valign="top">手机：</TD>
									<TD>1246546548+64</TD>
								</TR>
								<TR>
									<TD align="right" valign="top">郵箱：</TD>
									<TD>adaadad@132.com</TD>
								</TR>
							</TBODY>
						</TABLE>
				</DIV>
			</DIV>
		</DIV>
	</DIV>
</body>
</html>