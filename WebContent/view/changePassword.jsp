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
<link href="<%=request.getContextPath()%>/css/style.css" type="text/css"
	rel="stylesheet" />
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
.userspace_rightpanel {
    margin-bottom: 10px;
}

.table_green td {
    padding: 10px;
    border-bottom: 1px #e6e6e6 dashed;
}
 table td{
 font-size: 13px;
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
				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tbody>
						<tr>
							<td class="top_middle"></td>
							<td class="top_right"></td>
						</tr>
						<tr>
							<td class="middle_middle"><table
									class="userspace_rightpanel" width="100%" cellspacing="1"
									cellpadding="0" border="0">
									<tbody>
										<tr>
											<td class="top_tr bold font14"><img	src="../images/gear.png"
												width="16" align="absmiddle" height="16"> 修改用户密码</td>
										</tr>
									</tbody>
								</table>
								<table width="100%" cellspacing="0" cellpadding="0" border="0">
									<tbody>
										<tr>
											<td><form action="?doAction=modify" method="post"
													name="memberform" id="memberform" class="myForm">
													<table id="changepass" class="table_green" width="100%" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr>
																<td width="25%" align="right"><span class="red">*</span>
																	输入登录密码</td>
																<td width="75%"><input id="oldpassword"
																	alt="密码必须是6-20位字母、数字或字符" maxlength="16"
																	name="oldpassword" type="password">
																	（密码必须是6-20位字母、数字或字符）<br> <label id="chk_password"></label></td>
															</tr>
															<tr>
																<td align="right"><span class="red">*</span> 请输入新密码</td>
																<td><input alt="password:确认密码" maxlength="16"
																	name="newpassword" id="newpassword" type="password">
																	<label id="chk_password2"></label></td>
															</tr>
															<tr>
																<td align="right"><span class="red">*</span> 请确认新密码</td>
																<td><input alt="password:确认新密码" maxlength="16"
																	name="newpasswordsure" id="newpasswordsure"
																	type="password"> <label id="chk_password2"></label></td>
															</tr>
															<tr>
																<td>&nbsp;</td>
																<td><input class="mySubmit my_submit_button"
																	style="margin-top: 0px;" value="确定修改" type="button">
																</td>
															</tr>
														</tbody>
													</table>
													<input name="token" value="fddde5" type="hidden">
												</form></td>
										</tr>
									</tbody>
								</table></td>
							<td class="middle_right"></td>
						</tr>
					</tbody>
				</table>
			</DIV>
		</DIV>
	</DIV>
</body>
</html>