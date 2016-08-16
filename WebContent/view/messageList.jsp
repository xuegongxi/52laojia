<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <title>我爱我家-个人空间管理</title> -->
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
	href="<%=request.getContextPath()%>/css/persion/style_3_common.css">
<SCRIPT language="javascript" type="text/javascript"
	src="<%=request.getContextPath()%>/script/jquery-1.4.2.min.js"></SCRIPT>
<SCRIPT type="text/javascript"
	src="<%=request.getContextPath()%>/css/persion/usercenter.d4d53894.js"></SCRIPT>
<link href="<%=request.getContextPath()%>/css/style.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/banner1.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/ueditor1_4_3/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<SCRIPT type="text/javascript"
	src="<%=request.getContextPath() %>/script/jquery.min.js"></SCRIPT>
<SCRIPT>
	jQ = jQuery.noConflict();
</SCRIPT>
<SCRIPT type="text/javascript">
	var strongpw = new Array();
	var pwlength = 6;
</SCRIPT>
<SCRIPT type="text/javascript"
	src="<%=request.getContextPath() %>/js/register.js"></SCRIPT>
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
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }

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
							<TD width="50%" align="center">提交的医疗请求</TD>
							<TD width="17%" align="center">提交时间</TD>
							<TD width="14%" align="center">状态</TD>
							<TD width="19%" align="center">操作</TD>
						</TR>
						<TR>
							<TD class="rela_pad90" align="left"><SPAN class="green">网上咨询</SPAN>
								：胎儿多囊肾<BR> 请求医生： 卢彦平 301医院 妇产科</TD>
							<TD align="center">2016-05-23<BR> 16:47
							</TD>
							<TD align="center"><SPAN>分诊完成</SPAN></TD>
							<TD align="center"><A class="blue"
								href="http://passport.haodf.com/myhealthcare/myservicedetail?id=4465760676&amp;type=INTENTION">查看详情</A></TD>
						</TR>
						<TR>
							<TD class="rela_pad90" align="left"><SPAN class="green">网上咨询</SPAN>
								：胎儿多囊肾<BR> 请求医生： 魏瑗 北医三院 产科</TD>
							<TD align="center">2016-05-20<BR> 11:45
							</TD>
							<TD align="center"><SPAN>分诊完成</SPAN></TD>
							<TD align="center"><A class="blue"
								href="http://passport.haodf.com/myhealthcare/myservicedetail?id=4458560400&amp;type=INTENTION">查看详情</A></TD>
						</TR>
						<TR>
							<TD class="rela_pad90" align="left"><SPAN class="green">网上咨询</SPAN>
								：前2胎都是婴儿多囊肾，做试管能避免吗 修改<BR> 请求医生： 高江曼 北医三院 生殖医学中心</TD>
							<TD align="center">2016-01-11<BR> 12:36
							</TD>
							<TD align="center"><SPAN>分诊完成</SPAN></TD>
							<TD align="center"><A class="blue"
								href="http://passport.haodf.com/myhealthcare/myservicedetail?id=4108683650&amp;type=INTENTION">查看详情</A></TD>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>
			</div>
		</DIV>
	</DIV>
</body>
</html>