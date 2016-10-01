<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <title>我爱我家-个人空间管理</title> -->
<LINK rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/persion/userspace.css">
<LINK rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/persion/erweima.css">
<LINK rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/persion/css.css">
<LINK rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/persion/css(1).css">
<LINK rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/persion/base.css">
<LINK rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/persion/nav.css">
<LINK rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/persion/top_change.adc5d856.css">
<LINK rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/persion/scenter.css">
<LINK rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/persion/reveiwnotice.css">
<LINK rel="stylesheet"	href="<%=request.getContextPath()%>/css/persion/index_nav_noshadow_style.css">
<LINK rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/persion/usercenter.css">
<LINK rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/persion/style_3_common.css">
<SCRIPT language="javascript" type="text/javascript"	src="<%=request.getContextPath()%>/script/jquery-1.4.2.min.js"></SCRIPT>
<SCRIPT type="text/javascript"	src="<%=request.getContextPath()%>/css/persion/usercenter.d4d53894.js"></SCRIPT>
<link href="<%=request.getContextPath()%>/css/style.css"	type="text/css" rel="stylesheet" />
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/banner1.js"></script>
<script type="text/javascript" charset="utf-8"	src="<%=request.getContextPath()%>/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"	src="<%=request.getContextPath()%>/ueditor1_4_3/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"	src="<%=request.getContextPath()%>/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<SCRIPT type="text/javascript" src="<%=request.getContextPath() %>/script/jquery.min.js"></SCRIPT>
<SCRIPT>
	jQ = jQuery.noConflict();
</SCRIPT>
<SCRIPT type="text/javascript">
	var strongpw = new Array();
	var pwlength = 6;
</SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath() %>/js/sendMessage.js"></SCRIPT>
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
			<DIV class="usercenter_con">

				<div id="wp" class="wp">

					<div id="ct" class="wp cl">
						<div class="mn">
							<div class="bm cl">
								<div class="bm_h">
									<h1>
										<span class="y xs1 xw0"></span> 发表信息
									</h1>
								</div>
								<div class="bm_c">
									<form id="ttHtmlEditor" method="post"  action="../news.do?method=save" >

										<table cellspacing="0" cellpadding="0" class="tfm">
											<tr>
												<td>标题：<input type="text" id="news_title" name="news_title"
													value="" size="60" /></td>
											</tr>
											<tr>
												<td>信息发布人：<input type="text" id="news_person" name="news_person"
													value="" size="20" /></td>
											</tr>
											 <tr>
												<td>											
												<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
												</td>
											</tr>
										</table>
										<table cellspacing="0" cellpadding="0" width="100%"
											class="tfm">
                                          <tr>
                                          <th>信息来源：</th>
												<td><input type="text" id="news_title" name="news_from"
													value="" size="60" /></td>
											</tr>
                                         
											<tr>
												<th>信息分类</th>
												<td><select name="news_type" id="classid">
										            <option value="1001-0">家乡动态</option>
													<option value="1001-1">家乡美食</option>
													<option value="1001-2">家乡特产</option>
													<option value="1001-3">风俗文化</option>
													<option value="1001-4">旅游日志</option>	
												</select></td>
											</tr>
											<tr>
											   <TH>信息发生地:</TH>
												<TD><select id="S1" name="S1"></select>
												    <select id="S2" name="S2"></select>
												    <select id="S3" name="S3"></select>
												    <select id="S4" name="S4"></select>
												    <select id="S5" name="S5"></select>
												 </TD>				
											</tr>

											<tr>
												<th></th>
												<td></td>
											</tr>
											<tr>
												<th>&nbsp;</th>
												<td>
													<button type="submit" id="issuance" class="pn pnc">
														<strong>保存发布</strong>
													</button>
												</td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
if($('subject')) {
$('subject').focus();
}
</script>
				</div>

			</DIV>
		</DIV>
	</DIV>
</body>
</html>