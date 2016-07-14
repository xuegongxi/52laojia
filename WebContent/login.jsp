<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我爱老家--登录页面</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<style type="text/css">
.bm_h {
	background: rgb(242, 242, 242); padding: 0px 10px; height: 31px; line-height: 31px; overflow: hidden; border-top-color: rgb(255, 255, 255); border-bottom-color: rgb(194, 213, 227); border-top-width: 1px; border-bottom-width: 1px; border-top-style: solid; border-bottom-style: solid; white-space: nowrap;
}
.bbs {
	border-bottom-color: rgb(205, 205, 205) !important; border-bottom-width: 1px !important; border-bottom-style: solid !important;
}
.bm {
	margin-bottom: 10px;
	background: rgb(255, 255, 255); border: 1px solid rgb(205, 205, 205);
}
.bn {
	margin-bottom: 10px;
}
.ptm {
	padding-top: 10px !important;
}
.wp {
	margin: 0px auto; width: 998px; clear: both;
}
.cl::after {
	height: 0px; clear: both; display: block; visibility: hidden; content: ".";
}
.cl {
	zoom: 1;
}
#ct {
	min-height: 300px;
}
.xs2 {
	font-size: 14px !important;
}
.xi2 {
	color: rgb(51, 102, 153);
}
.xi2 a {
	color: rgb(51, 102, 153);
}
.y {
	float: right;
}
.mn {
	overflow: hidden;
}
.flb {
	padding: 10px 10px 8px; height: 20px; line-height: 20px;
}
.flb em {
	color: rgb(51, 102, 153); font-size: 14px; font-weight: 700; float: left;
}
.flb em a {
	text-decoration: none;
}
.rfm {
	margin: 0px auto; width: 760px; border-bottom-color: rgb(205, 205, 205); border-bottom-width: 1px; border-bottom-style: dotted;
}
.rfm a {
	color: rgb(51, 102, 153);
}
.rfm .rq {
	
}
.rfm th {
	padding: 10px 2px; line-height: 24px; vertical-align: top;
}
.rfm td {
	padding: 10px 2px; line-height: 24px; vertical-align: top;
}
.rfm .tipwide {
	padding-top: 0px;
}
.rfm th {
	width: 10em; text-align: right; padding-right: 10px;
}
.rfm .px {
	width: 220px;
}
.rfm .px:focus {
	background: rgb(255, 255, 255); border-color: rgb(51, 102, 153);
}
.rfm .p_tip {
	background: rgb(255, 255, 255); width: 390px; color: rgb(102, 102, 102); padding-left: 10px; font-style: normal; display: none; position: absolute; z-index: 2;
}
.rfm .p_chk {
	width: 390px; color: red; padding-left: 10px; font-family: Tahoma,"Microsoft Yahei","Simsun"; font-weight: 700; position: absolute; z-index: 1;
}
.rfm #emailmore {
	position: absolute;
}
hr.l {
	background: rgb(205, 205, 205); border: currentColor; height: 1px; color: rgb(205, 205, 205);
}
</style>
<script type="text/javascript" src="js/banner1.js"></script>
</head>

<body>
<iframe style="width:100%;height:200px" scrolling="no" frameborder="0" src="header.jsp"></iframe>
	<div id="wp" class="wp">
		<div id="ct" class="ptm wp w cl">
			<div class="nfl" id="main_succeed" style="display: none">
				<div class="f_c altw">
					<div class="alert_right">
						<p id="succeedmessage"></p>
						<p id="succeedlocation" class="alert_btnleft"></p>
						<p class="alert_btnleft">
							<a id="succeedmessage_href">如果您的浏览器没有自动跳转，请点击此链接</a>
						</p>
					</div>
				</div>
			</div>
			<div class="mn" id="main_message">
				<div class="bm">
					<div class="bm_h bbs">
						<span class="y"> <a href="member.php?mod=register"
							class="xi2">没有帐号？<a href="register.jsp">立即注册</a></a>
						</span>
						<h3 class="xs2">登录</h3>
					</div>
					<div>
						<div id="main_messaqge_LweiS">
							<div id="layer_login_LweiS">
								<h3 class="flb">
									<em id="returnmessage_LweiS"> </em><span style="color: red">${loginerror}</span>
								</h3>
								<form method="post" autocomplete="off" name="login"
									id="loginform_LweiS" class="cl"	action="user.do?method=login">
									<div class="c cl">
										<div class="rfm">
											<table>
												<tr>
													<th><label for="username_LweiS">用户名:</label></th>
													<td><input type="text" name="username"
														id="username_LweiS" autocomplete="off" size="30"
														class="px p_fre" tabindex="1" value=""/></td>
													<td class="tipcol"><a href="register.jsp">立即注册</a></td>
												</tr>
											</table>
										</div>
										<div class="rfm">
											<table>
												<tr>
													<th><label for="password3_LweiS">密码:</label></th>
													<td><input type="password" id="password3_LweiS"
														name="password" onfocus="clearpwd()" size="30"
														class="px p_fre" tabindex="1" /></td>
													<td class="tipcol"><a href="javascript:;"
														onclick="display('layer_login_LweiS');display('layer_lostpw_LweiS');"
														title="找回密码">找回密码</a></td>
												</tr>
											</table>
										</div>
										<div class="rfm">
											<table>
												<tr>
													<th>安全提问:</th>
													<td><select id="loginquestionid_LweiS" width="213"
														name="questionid"
														onchange="if($('loginquestionid_LweiS').value > 0) {$('loginanswer_row_LweiS').style.display='';} else {$('loginanswer_row_LweiS').style.display='none';}">
															<option value="0">安全提问(未设置请忽略)</option>
															<option value="1">母亲的名字</option>
															<option value="2">爷爷的名字</option>
															<option value="3">父亲出生的城市</option>
															<option value="4">您其中一位老师的名字</option>
															<option value="5">您个人计算机的型号</option>
															<option value="6">您最喜欢的餐馆名称</option>
															<option value="7">驾驶执照最后四位数字</option>
													</select></td>
												</tr>
											</table>
										</div>
										<div class="rfm" id="loginanswer_row_LweiS"
											style="display: none">
											<table>
												<tr>
													<th>答案:</th>
													<td><input type="text" name="answer"
														id="loginanswer_LweiS" autocomplete="off" size="30"
														class="px p_fre" tabindex="1" /></td>
												</tr>
											</table>
										</div>


										<div class="rfm ">
											<table>
												<tr>
													<th></th>
													<td><label for="cookietime_LweiS"><input
															type="checkbox" class="pc" name="cookietime"
															id="cookietime_LweiS" tabindex="1" value="2592000" />自动登录</label></td>
												</tr>
											</table>
										</div>

										<div class="rfm mbw bw0">
											<table width="100%">
												<tr>
													<th>&nbsp;</th>
													<td>
														<button class="pn pnc" type="submit" name="loginsubmit"
															value="true" tabindex="1">
															<strong>登录</strong>
														</button>
													</td>
													<td><a href="javascript:;"
														onclick="ajaxget('member.php?mod=clearcookies&formhash=9f592bd7', 'returnmessage_LweiS', 'returnmessage_LweiS');return false;"
														title="清除痕迹" class="y">清除痕迹</a></td>
												</tr>
											</table>
										</div>

										<div class="rfm bw0  mbw">
											<hr class="l" />
											<table>
												<tr>
													<th>快捷登录:</th>
													<td><a
														href="http://www.zlsgx.com/connect.php?mod=login&op=init&referer=http%3A%2F%2Fwww.zlsgx.com%2Fportal.php&statfrom=login"
														target="_top" rel="nofollow"><img
															src="images/register/qq_login.gif" class="vm" /></a> <a
														href="wechat-login.html"><img
															src="images/register/wechat_login.png"
															class="vm" /></a></td>
												</tr>
											</table>
										</div>
									</div>
								</form>
							</div>
							<div id="layer_lostpw_LweiS" style="display: none;">
								<h3 class="flb">
									<em id="returnmessage3_LweiS">找回密码</em> <span></span>
								</h3>
								<form method="post" autocomplete="off" id="lostpwform_LweiS"
									class="cl"
									onsubmit="ajaxpost('lostpwform_LweiS', 'returnmessage3_LweiS', 'returnmessage3_LweiS', 'onerror');return false;"
									action="member.php?mod=lostpasswd&amp;lostpwsubmit=yes&amp;infloat=yes">
									<div class="c cl">
										<input type="hidden" name="formhash" value="9f592bd7" /> <input
											type="hidden" name="handlekey" value="lostpwform" />
										<div class="rfm">
											<table>
												<tr>
													<th><span class="rq">*</span><label for="lostpw_email">Email:</label></th>
													<td><input type="text" name="email" id="lostpw_email"
														size="30" value="" tabindex="1" class="px p_fre" /></td>
												</tr>
											</table>
										</div>
										<div class="rfm">
											<table>
												<tr>
													<th><label for="lostpw_username">用户名:</label></th>
													<td><input type="text" name="username"
														id="lostpw_username" size="30" value="" tabindex="1"
														class="px p_fre" /></td>
												</tr>
											</table>
										</div>

										<div class="rfm mbw bw0">
											<table>
												<tr>
													<th></th>
													<td><button class="pn pnc" type="submit"
															name="lostpwsubmit" value="true" tabindex="100">
															<span>提交</span>
														</button></td>
												</tr>
											</table>
										</div>
									</div>
								</form>
							</div>
						</div>

						<div id="layer_message_LweiS" class="f_c blr nfl"
							style="display: none;">
							<h3 class="flb" id="layer_header_LweiS"></h3>
							<div class="c">
								<div class="alert_right">
									<div id="messageleft_LweiS"></div>
									<p class="alert_btnleft" id="messageright_LweiS"></p>
								</div>
							</div>

							<script type="text/javascript" reload="1">
var pwdclear = 0;
function initinput_login() {
document.body.focus();
if($('loginform_LweiS')) {
$('loginform_LweiS').username.focus();
}
}
initinput_login();

function clearpwd() {
if(pwdclear) {
$('password3_LweiS').value = '';
}
pwdclear = 0;
}
</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	<!--footer end-->
</body>
</html>