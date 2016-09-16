<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我爱我家-个人空间管理</title>
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/persion/userspace.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/persion/erweima.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/persion/css.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/persion/css(1).css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/persion/base.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/persion/nav.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/persion/top_change.adc5d856.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/persion/scenter.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/persion/reveiwnotice.css">
<LINK rel="stylesheet" href="<%=request.getContextPath() %>/css/persion/index_nav_noshadow_style.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/persion/usercenter.css">
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/persion/hospital-erweima.css">
<SCRIPT language="javascript" type="text/javascript" src="<%=request.getContextPath() %>/script/jquery-1.4.2.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath() %>/css/persion/usercenter.d4d53894.js"></SCRIPT>
<link href="<%=request.getContextPath() %>/css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/banner1.js"></script>
<script type="text/javascript">
function checklogin(){
	var session_username ='${sessionScope.username}';
	if(session_username==""){
		window.location.href='<%=request.getContextPath() %>/index.jsp';
	}
}

$(function(){
    $(".doc_down_codeimg .close").bind("click",function(){
        $(this).parent("div").css("display","none");
    });
});
</script>
</head>
<body onload="checklogin()">
<iframe style="width:100%;height:200px" scrolling="no" frameborder="0" src="<%=request.getContextPath() %>/header.jsp"></iframe>
	<DIV class="usercenter_box">
		<DIV class="usercenter clearfix">
			<DIV class="usercenter_bg"></DIV>
			<jsp:include page="/view/admin/left_menu.jsp"></jsp:include>
			<!--start scenterContent-->
			<DIV class="usercenter_con">
				<!--start scenterMain-->
				<DIV class="doc_down_codeimg">
					<SPAN class="close"></SPAN>
				</DIV>
				<!--start scenterMain-->
				<IFRAME style="display: none;" id="report_image_iframe" height="0"
					src="about:blank" width="0" name="report_image_iframe"></IFRAME>

				<DIV class="usercenter_con">
					<SCRIPT language="javascript">
						$(document).ready(function() {
							$(".userinfo_box .userpic span").hover(function() {
								$(this).find("a").show();
							}, function() {
								$(this).find("a").hide();
							})
						});
					</SCRIPT>

					<DIV class="userinfo_box">
						<DIV class="userpic">
							<SPAN id="abc"><IMG alt="" src="<%=request.getContextPath() %>/images/person/person_photo.gif">
						    <A onclick="index_update_doctor_headphoto(this)" href="javascript:void(0);">修改头像</A>
							</SPAN>
						</DIV>
						<DIV class="userinfo">
							<DIV class="welcome">${user.username}&nbsp;您好！</DIV>
							<DIV class="num">
								家乡新闻: <A class="blue"	href="#">3个</A>&nbsp;&nbsp;&nbsp;&nbsp;
								账户余额: <A class="red" href="#">0.00</A>	元 
								<SPAN style="margin-left: 15px;">留言数量: <A class="blue"	href="#">0</A>个
								</SPAN>
							</DIV>
							<DIV class="num">
								<SPAN class="black">0&nbsp;</SPAN>农产品数量&nbsp;&nbsp;&nbsp;&nbsp; <SPAN
									class="black">0&nbsp;</SPAN>游记心得&nbsp;&nbsp;&nbsp;&nbsp; <SPAN
									class="black">0&nbsp;</SPAN>美食体验
							</DIV>
							<DIV class="num">
								<DIV>
									<SPAN>家乡地址：${user.village}</SPAN>
								</DIV>
							</DIV>
							<DIV class="num">
								<DIV>
									<SPAN>手机号码：${user.phone}</SPAN>
								</DIV>
							</DIV>
							<DIV class="num">
								<DIV>
									<SPAN>邮箱地址：${user.email}</SPAN>
								</DIV>
							</DIV>
						</DIV>
					</DIV>
				
				</DIV>
				<STYLE>
#msg_box a {
	color: #005eac;
}
</STYLE>

				<DIV class="user_center_normalbox">
					<DIV class="user_center_normaltitle">最近的通知</DIV>
					<UL class="user_center_normallist">
						<LI>
							<TABLE width="100%">
								<TBODY>
									<TR>
										<TD width="70%"><STRONG>恭喜您成为好大夫在线患友会成员</STRONG></TD>
										<TD class="time" width="30%" align="right">2016-05-23</TD>
									</TR>
									<TR id="msg_box">
										<TD colSpan="2">
											<P style="color: rgb(102, 102, 102); line-height: 1.5;">

												${user.username},您好！<BR>您已经加入到廖更新医生的患友会！在电脑上打开医生的患友会可以发表话题。建议您在疾病治疗过程中，多跟病友交流，分享经验！
											</P>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</LI>
						<LI>
							<TABLE width="100%">
								<TBODY>
									<TR>
										<TD width="70%"><STRONG>鹿相花大夫和您有新对话</STRONG></TD>
										<TD class="time" width="30%" align="right">2016-05-20</TD>
									</TR>
									<TR id="msg_box">
										<TD colSpan="2">
											<P style="color: rgb(102, 102, 102); line-height: 1.5;">
												鹿相花大夫和您有新对话<A
													href="http://www.haodf.com/wenda/luxianghuadr_g_4458633177.htm"
													target="_blank">点击查看详情</A>
											</P>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</LI>
						<LI>
							<TABLE width="100%">
								<TBODY>
									<TR>
										<TD width="70%"><STRONG>恭喜您成为好大夫在线患友会成员</STRONG></TD>
										<TD class="time" width="30%" align="right">2016-05-20</TD>
									</TR>
									<TR id="msg_box">
										<TD colSpan="2">
											<P style="color: rgb(102, 102, 102); line-height: 1.5;">

												hdfd7xnp,您好！<BR>您已经加入到鹿相花医生的患友会！在电脑上打开医生的患友会可以发表话题。建议您在疾病治疗过程中，多跟病友交流，分享经验！
											</P>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</LI>
					</UL>
					<DIV class="find_more">
						<A href="#">浏览更多&gt;</A>
					</DIV>
				</DIV>
			</DIV>
			<SCRIPT>
				$(".user_center_normalbox").hover(function() {
					$(this).addClass("on");
				}, function() {
					$(this).removeClass("on");
				});
			</SCRIPT>
		</DIV>
	</DIV>
</body>
</html>