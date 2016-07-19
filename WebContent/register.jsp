<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我爱老家--注册页面</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<SCRIPT type="text/javascript" src="<%=request.getContextPath() %>/script/jquery.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath() %>/script/jquery-1.4.2.min.js"></SCRIPT>
<SCRIPT>
	jQ = jQuery.noConflict();
</SCRIPT>
<SCRIPT type="text/javascript">
	var strongpw = new Array();
	var pwlength = 6;
</SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath() %>/js/register.js"></SCRIPT>
<style type="text/css">
.bm_h {
	background: rgb(242, 242, 242);
	padding: 0px 10px;
	height: 31px;
	line-height: 31px;
	overflow: hidden;
	border-top-color: rgb(255, 255, 255);
	border-bottom-color: rgb(194, 213, 227);
	border-top-width: 1px;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-bottom-style: solid;
	white-space: nowrap;
}

.bbs {
	border-bottom-color: rgb(205, 205, 205) !important;
	border-bottom-width: 1px !important;
	border-bottom-style: solid !important;
}

.bm {
	margin-bottom: 10px;
	background: rgb(255, 255, 255);
	border: 1px solid rgb(205, 205, 205);
}

.bn {
	margin-bottom: 10px;
}

.ptm {
	padding-top: 10px !important;
}

.wp {
	margin: 0px auto;
	width: 998px;
	clear: both;
}

.cl::after {
	height: 0px;
	clear: both;
	display: block;
	visibility: hidden;
	content: ".";
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
	padding: 10px 10px 8px;
	height: 20px;
	line-height: 20px;
}

.flb em {
	color: rgb(51, 102, 153);
	font-size: 14px;
	font-weight: 700;
	float: left;
}

.flb em a {
	text-decoration: none;
}

.rfm {
	margin: 0px auto;
	width: 760px;
	border-bottom-color: rgb(205, 205, 205);
	border-bottom-width: 1px;
	border-bottom-style: dotted;
}

.rfm a {
	color: rgb(51, 102, 153);
}
.rq {
	color: red;
}
.rfm .rq {
	
}

.rfm th {
	padding: 10px 2px;
	line-height: 24px;
	vertical-align: top;
}

.rfm td {
	padding: 10px 2px;
	line-height: 24px;
	vertical-align: top;
}

.rfm .tipwide {
	padding-top: 0px;
}

.rfm th {
	width: 10em;
	text-align: right;
	padding-right: 10px;
}

.rfm .px {
	width: 220px;
}

.rfm .px:focus {
	background: rgb(255, 255, 255);
	border-color: rgb(51, 102, 153);
}

.rfm .p_tip {
	background: rgb(255, 255, 255);
	width: 390px;
	color: rgb(102, 102, 102);
	padding-left: 10px;
	font-style: normal;
	display: none;
	position: absolute;
	z-index: 2;
}

.rfm .p_chk {
	width: 390px;
	color: red;
	padding-left: 10px;
	font-family: Tahoma, "Microsoft Yahei", "Simsun";
	font-weight: 700;
	position: absolute;
	z-index: 1;
}

.rfm #emailmore {
	position: absolute;
}

hr.l {
	background: rgb(205, 205, 205);
	border: currentColor;
	height: 1px;
	color: rgb(205, 205, 205);
}
</style>
<script type="text/javascript" src="js/banner1.js"></script>
</head>

<body>
	<iframe style="width: 100%; height: 200px" scrolling="no"
		frameborder="0" src="header.jsp"></iframe>
	<DIV id="wp" class="wp">
		<DIV id="ct" class="ptm wp cl">
			<DIV class="mn">

				<DIV id="main_message" class="bm">
					<DIV id="main_hnav" class="bm_h bbs">
						<SPAN class="y"><A class="xi2"
							onClick="showWindow('login', this.href);return false;"
							href="login.jsp">已有帐号？现在登录</A>
						</SPAN>
						<H3 id="layer_reginfo_t" class="xs2">立即注册</H3>
					</DIV>

					<FORM id="registerform"  action="<%=request.getContextPath() %>/user.do?method=save" method="post">
						<h3 class="flb">
									<em id="returnmessage_LweiS"> </em><span style="color: red">${registererror}</span>
						</h3>
						
						<DIV id="layer_reg" class="bm_c">						
							<!--邮箱-->
							<DIV id="reg_select_email">
								
								<DIV class="rfm">
									<TABLE>
										<TBODY>
											<TR>
												<TH><SPAN class="rq">*</SPAN><LABEL for="DYmmkZ2">用户名:</LABEL></TH>
												<TD><INPUT id="DYmmkZ2" class="reg_username"
													tabIndex="1" name="username" maxLength="15" size="25"
													type="text"></TD>
												<TD class="tipcol"><I id="tip_DYmmkZ2" class="p_tip">用户名由
														3 到 15 个字符组成</I></TD>
											</TR>
										</TBODY>
									</TABLE>
								</DIV>
								<DIV class="rfm">
									<TABLE>
										<TBODY>
											<TR>
												<TH><SPAN class="rq">*</SPAN><LABEL for="EXWfnn2">密码:</LABEL></TH>
												<TD><INPUT id="EXWfnn2" class="reg_password"
													tabIndex="1" name="password" size="25" type="password"
													required=""></TD>
												<TD class="tipcol"><I id="tip_EXWfnn2" class="p_tip">请填写密码,
														最小长度为 6 个字符</I> <KBD id="chk_EXWfnn2" class="p_chk"></KBD></TD>
											</TR>
										</TBODY>
									</TABLE>
								</DIV>
								<DIV class="rfm">
									<TABLE>
										<TBODY>
											<TR>
												<TH><SPAN class="rq">*</SPAN><LABEL for="A1ELG32">确认密码:</LABEL></TH>
												<TD><INPUT id="A1ELG32" class="reg_password2"
													tabIndex="1" name="password2" size="25" type="password"
													required=""></TD>
												<TD class="tipcol"><I id="tip_A1ELG32" class="p_tip">请再次输入密码</I>
													<KBD id="chk_A1ELG32" class="p_chk"></KBD></TD>
											</TR>
										</TBODY>
									</TABLE>
								</DIV>
								<DIV class="rfm">
									<TABLE>
										<TBODY>
											<TR>
												<TH><LABEL for="reg_mobile2">手机绑定:</LABEL></TH>
												<TD><INPUT id="reg_mobile2" class="reg_mobile"
													tabIndex="1" name="phone" maxLength="15" size="25"
													type="text"></TD>
												<TD class="tipcol"><I id="tip_reg_mobile2"
													class="p_tip">重要！请准确填写，以便激活帐号、找回密码。</I> <KBD
														id="chk_reg_mobile2" class="p_chk"></KBD></TD>
											</TR>
										</TBODY>
									</TABLE>
								</DIV>
								<DIV class="rfm">
									<TABLE>
										<TBODY>
											<TR>
												<TH><LABEL for="reg_mobile2">家乡所在地:</LABEL></TH>
												<TD><select id="S1" name="S1"></select>
												    <select id="S2" name="S2"></select>
												    <select id="S3" name="S3"></select>
												    <select id="S4" name="S4"></select>
												    <select id="S5" name="S5"></select>
												 </TD>												
											</TR>
										</TBODY>
									</TABLE>
								</DIV>
								<DIV class="rfm">
									<TABLE>
										<TBODY>
											<TR>
												<TH><SPAN class="rq">*</SPAN><LABEL for="f17HBt2">邮箱注册:</LABEL></TH>
												<TD><INPUT id="f17HBt2" class="reg_email" tabIndex="1"
													name="email" size="25" type="text" ><BR> 
													<EM id="emailmore">&nbsp;</EM></TD>
												<TD class="tipcol"><I id="tip_f17HBt2" class="p_tip">请输入正确的邮箱地址</I>
													<KBD id="chk_f17HBt2" class="p_chk"></KBD></TD>
											</TR>
										</TBODY>
									</TABLE>
								</DIV>
							</DIV>
						</DIV>
						<DIV id="layer_reginfo_b">
							<DIV class="rfm mbw bw0">
								<TABLE width="100%">
									<TBODY>
										<TR>
											<TH>&nbsp;</TH>
											<TD><SPAN id="reginfo_a_btn"><EM>&nbsp;</EM>
													<BUTTON id="registerformsubmit" class="pn pnc" tabIndex="1"
														name="regsubmit" type="submit" value="true">
														<STRONG>提交</STRONG>
													</BUTTON> <INPUT id="agreebbrule" class="pc" name="agreebbrule"
													value="753e5df3" CHECKED="checked" type="checkbox">
													<LABEL for="agreebbrule">同意<A
														onClick="showBBRule()" href="javascript:;">网站服务条款</A></LABEL></SPAN></TD>
											<TD></TD>
										</TR>
									</TBODY>
								</TABLE>
							</DIV>
						</DIV>
					</FORM>
				</DIV>
				<DIV style="display: none;" id="layer_regmessage"
					class="f_c blr nfl">
					<DIV class="c">
						<DIV class="alert_right">
							<DIV id="messageleft1"></DIV>
							<P id="messageright1" class="alert_btnleft"></P>
						</DIV>
					</DIV>
					<DIV style="display: none;" id="layer_bbrule">
						<DIV style="width: 700px; height: 350px; overflow: auto;"
							class="c">
							<BR> dsvdsvdsfds<BR> <BR>
						</DIV>
						<P class="fsb pns cl hm">
							<BUTTON class="pn pnc"
								onClick="$('agreebbrule').checked = true;hideMenu('fwin_dialog', 'dialog');">
								<SPAN>同意</SPAN>
							</BUTTON>
							<BUTTON class="pn"
								onclick="location.href='http://www.52laojia.cn/'">
								<SPAN>不同意</SPAN>
							</BUTTON>
						</P>
					</DIV>
					<SCRIPT type="text/javascript">
						var ignoreEmail = false;
						function showBBRule() {
							showDialog($('layer_bbrule').innerHTML, 'info',
									'我爱老家网 网站服务条款');
							$('fwin_dialog_close').style.display = 'none';
						}
					</SCRIPT>
				</DIV>
			</DIV>
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
	<!--footer end-->
</body>
</html>