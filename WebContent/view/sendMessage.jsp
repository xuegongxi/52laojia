<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我爱我家-个人空间管理</title>
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
<body onload="checklogin()">
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
										<span class="y xs1 xw0"></span> 发表日志
									</h1>
								</div>
								<div class="bm_c">
									<script src="static/image/editor/editor_function.js?G3q"
										type="text/javascript"></script>
									<script src="static/js/home_blog.js?G3q" type="text/javascript"></script>
									<form id="ttHtmlEditor" method="post"  action="news.jsp" >

										<table cellspacing="0" cellpadding="0" class="tfm">
											<tr>
												<td><input type="text" id="subject" name="subject"
													value="" size="60" onblur="relatekw();" class="px"
													style="width: 63%;" /></td>
											</tr>
											<tr>
												<td>											
													<div style="border: 1px solid #C5C5C5; height: 500px;">
														<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
													</div>
												</td>
											</tr>
										</table>
										<table cellspacing="0" cellpadding="0" width="100%"
											class="tfm">


											<tr>
												<th>个人分类</th>
												<td><select name="classid" id="classid"
													onchange="addSort(this)">
														<option value="0">------</option>
														<option value="addoption" style="color: red;">+新建分类</option>
												</select></td>
											</tr>
											<tr>
												<th>标签</th>
												<td class="pns"><input type="text" class="px vm"
													size="40" id="tag" name="tag" value="" />
													<button type="button" name="clickbutton[]"
														onclick="relatekw();" class="pn vm">
														<em>自动获取</em>
													</button></td>
											</tr>


											<tr>
												<th>隐私设置</th>
												<td><select name="friend"
													onchange="passwordShow(this.value);" class="ps">
														<option value="0">全站用户可见</option>
														<option value="1">仅好友可见</option>
														<option value="2">指定好友可见</option>
														<option value="3">仅自己可见</option>
														<option value="4">凭密码可见</option>
												</select> <label><input type="checkbox" name="noreply"
														value="1" class="pc"> 不允许评论</label></td>
											</tr>
											<tbody id="span_password" style="display: none">
												<tr>
													<th>密码</th>
													<td class="pns"><input type="text" name="password"
														value="" size="10"
														onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" class="px" /></td>
												</tr>
											</tbody>


											<tbody id="tb_selectgroup" style="display: none">
												<tr>
													<th>指定好友</th>
													<td><select name="selectgroup"
														onchange="getgroup(this.value);" class="ps">
															<option value="">从好友组选择好友</option>
															<option value="0">其他</option>
															<option value="1">通过本站认识</option>
															<option value="2">通过活动认识</option>
															<option value="3">通过朋友认识</option>
															<option value="4">亲人</option>
															<option value="5">同事</option>
															<option value="6">同学</option>
															<option value="7">不认识</option>
													</select>
														<p class="d">多次选择会累加到下面的好友名单</p></td>
												</tr>
												<tr>
													<th>&nbsp;</th>
													<td><textarea name="target_names" id="target_names"
															rows="3" class="pt"></textarea>
														<p class="d">可以填写多个好友名，请用空格进行分割</p></td>
												</tr>
											</tbody>

											<tr>
												<th>动态选项</th>
												<td><label for="makefeed"><input
														type="checkbox" name="makefeed" id="makefeed" value="1"
														class="pc" checked="checked">发送动态 (<a
														href="http://www.zlsgx.com/home.php?mod=spacecp&amp;ac=privacy&amp;op=feed"
														target="_blank">更改默认配置</a>)</label></td>
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
										<input type="hidden" name="blogsubmit" value="true" /> <input
											type="hidden" name="formhash" value="b632b7ca" />
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