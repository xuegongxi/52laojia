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
	href="<%=request.getContextPath()%>/css/persion/style_3_common.css">
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
		window.location.href='<%=request.getContextPath()%>
	/index.jsp';
		}
	}

	$(function() {
		$(".doc_down_codeimg .close").bind("click", function() {
			$(this).parent("div").css("display", "none");
		});
	});
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
									<form id="ttHtmlEditor" method="post" autocomplete="off"
										action="home.php?mod=spacecp&amp;ac=blog&amp;blogid="
										onsubmit="validate(this);" enctype="multipart/form-data">

										<table cellspacing="0" cellpadding="0" class="tfm">
											<tr>
												<td><input type="text" id="subject" name="subject"
													value="" size="60" onblur="relatekw();" class="px"
													style="width: 63%;" /></td>
											</tr>
											<tr>
												<td><div id="icoImg_image_menu" style="display: none"
														unselectable="on">
														<table width="100%" cellpadding="0" cellspacing="0"
															class="fwin">
															<tr>
																<td class="t_l"></td>
																<td class="t_c"></td>
																<td class="t_r"></td>
															</tr>
															<tr>
																<td class="m_l">&nbsp;&nbsp;</td>
																<td class="m_c"><div class="mtm mbm">
																		<ul class="tb tb_s cl" id="icoImg_image_ctrl"
																			style="margin-top: 0; margin-bottom: 0;">
																			<li class="y"><span class="flbc"
																				onclick="hideAttachMenu('icoImg_image_menu')">关闭</span></li>
																			<li class="current" id="icoImg_btn_imgattachlist"><a
																				href="javascript:;" hidefocus="true"
																				onclick="switchImagebutton('imgattachlist');">上传图片</a></li>
																			<li id="icoImg_btn_albumlist"><a
																				href="javascript:;" hidefocus="true"
																				onclick="switchImagebutton('albumlist');">相册图片</a></li>
																			<li id="icoImg_btn_www"><a href="javascript:;"
																				hidefocus="true" onclick="switchImagebutton('www');">网络图片</a></li>
																		</ul>
																		<div class="p_opt popupfix" unselectable="on"
																			id="icoImg_www" style="display: none">
																			<table cellpadding="0" cellspacing="0" width="100%">
																				<tr class="xg1">
																					<th>请输入图片地址</th>
																					<th>宽(可选)</th>
																					<th>高(可选)</th>
																				</tr>
																				<tr>
																					<td width="74%"><input type="text"
																						id="icoImg_image_param_1"
																						onchange="loadimgsize(this.value)"
																						style="width: 95%;" value="" class="px"
																						autocomplete="off" /></td>
																					<td width="13%"><input
																						id="icoImg_image_param_2" size="3" value=""
																						class="px p_fre" autocomplete="off" /></td>
																					<td width="13%"><input
																						id="icoImg_image_param_3" size="3" value=""
																						class="px p_fre" autocomplete="off" /></td>
																				</tr>
																				<tr>
																					<td colspan="3" class="pns ptn">
																						<button type="button" class="pn pnc"
																							onclick="insertWWWImg();">
																							<strong>提交</strong>
																						</button>
																					</td>
																				</tr>
																			</table>
																		</div>
																		<div class="p_opt" unselectable="on"
																			id="icoImg_imgattachlist">
																			<div class="pbm bbda cl">
																				<div id="uploadPanel" class="y">
																					上传到: <select name="savealbumid" id="savealbumid"
																						class="ps vm"
																						onchange="if(this.value == '-1') {selectCreateTab(0);}">
																						<option value="0">默认相册</option>
																						<option value="-1" style="color: red;">+创建新相册</option>
																					</select>
																				</div>
																				<div id="createalbum" class="y"
																					style="display: none">
																					<input type="text" name="newalbum" id="newalbum"
																						class="px vm" value="请输入相册名称"
																						onfocus="if(this.value == '请输入相册名称') {this.value = '';}"
																						onblur="if(this.value == '') {this.value = '请输入相册名称';}" />
																					<button type="button" class="pn pnc"
																						onclick="createNewAlbum();">
																						<span>创建</span>
																					</button>
																					<button type="button" class="pn"
																						onclick="selectCreateTab(1);">
																						<span>取消</span>
																					</button>
																				</div>
																				<span id="imgSpanButtonPlaceholder"></span>
																			</div>
																			<div class="upfilelist upfl bbda">
																				<div id="imgattachlist"></div>
																				<div class="fieldset flash" id="imgUploadProgress"></div>
																			</div>
																			<p class="notice">点击图片添加到编辑器内容中</p>
																		</div>
																		<div class="p_opt" unselectable="on"
																			id="icoImg_albumlist" style="display: none;">
																			<div class="upfilelist pbm bbda">
																				选择相册: <select name="view_albumid"
																					onchange="picView(this.value, 'albumphoto')"
																					class="ps">
																					<option value="none">选择相册</option>
																					<option value="0">默认相册</option>
																				</select>
																				<div id="albumphoto"></div>
																			</div>
																			<p class="notice">点击图片添加到编辑器内容中</p>
																		</div>
																	</div></td>
																<td class="m_r"></td>
															</tr>
															<tr>
																<td class="b_l"></td>
																<td class="b_c"></td>
																<td class="b_r"></td>
															</tr>
														</table>
													</div>


													<div id="icoAttach_attach_menu" style="display: none"
														unselectable="on">
														<table width="100%" cellpadding="0" cellspacing="0"
															class="fwin">
															<tr>
																<td class="t_l"></td>
																<td class="t_c"></td>
																<td class="t_r"></td>
															</tr>
															<tr>
																<td class="m_l">&nbsp;&nbsp;</td>
																<td class="m_c">
																	<div class="mtm mbm">
																		<ul class="tb tb_s cl" id="icoAttach_attach_ctrl"
																			style="margin-top: 0; margin-bottom: 0;">
																			<li class="y"><span class="flbc"
																				onclick="hideAttachMenu('icoAttach_attach_menu')">关闭</span></li>
																			<li class="current" id="icoAttach_btn_attachlist"><a
																				href="javascript:;" hidefocus="true"
																				onclick="switchAttachbutton('attachlist');">上传附件</a></li>
																		</ul>
																		<div class="p_opt post_tablelist" unselectable="on"
																			id="icoAttach_attachlist">
																			<div class="pbm bbda">
																				<span id="spanButtonPlaceholder"></span>
																			</div>
																			<table cellpadding="0" cellspacing="0" border="0"
																				width="100%" id="attach_tblheader" class="mtn bbs"
																				style="display: none;">
																				<tr>
																					<td class="atnu"></td>
																					<td class="atna pbn">文件名</td>
																					<td class="atds pbn">文件大小</td>
																					<td class="attc"></td>
																				</tr>
																			</table>
																			<div class="upfl">
																				<div id="attachlist"></div>
																				<div class="fieldset flash" id="fsUploadProgress"></div>
																			</div>
																			<div class="notice upnf">
																				<p id="attach_notice">点击文件名将附件添加到文章中</p>
																			</div>
																		</div>
																	</div>
																</td>
																<td class="m_r"></td>
															</tr>
															<tr>
																<td class="b_l"></td>
																<td class="b_c"></td>
																<td class="b_r"></td>
															</tr>
														</table>
													</div> <iframe name="attachframe" id="attachframe"
														style="display: none;"></iframe> <script
														src="static/js/upload.js?G3q" type="text/javascript"></script>
													<script type="text/javascript">
														var attachUpload = new SWFUpload({
																	// Backend Settings
																	upload_url : "http://www.zlsgx.com/misc.php?mod=swfupload&action=swfupload&operation=album",
																	post_params : {
																		"uid" : "1339",
																		"hash" : "6898d2b892af32d71b986d3f6c05ba9e"
																	},

																	// File Upload Settings
																	file_size_limit : "1000", // 100MB
																	file_types : "*.jpg;*.jpeg;*.gif;*.png",
																	file_types_description : "Image File",
																	file_upload_limit : 0,
																	file_queue_limit : 0,

																	// Event Handler Settings (all my handlers are in the Handler.js file)
																	swfupload_preload_handler : preLoad,
																	swfupload_load_failed_handler : loadFailed,
																	file_dialog_start_handler : fileDialogStart,
																	file_queued_handler : fileQueued,
																	file_queue_error_handler : fileQueueError,
																	file_dialog_complete_handler : fileDialogComplete,
																	upload_start_handler : uploadStart,
																	upload_progress_handler : uploadProgress,
																	upload_error_handler : uploadError,
																	upload_success_handler : uploadSuccess,
																	upload_complete_handler : uploadComplete,

																	// Button Settings
																	button_image_url : "static/image/common/uploadbutton.png",
																	button_placeholder_id : "spanButtonPlaceholder",
																	button_width : 100,
																	button_height : 25,
																	button_cursor : SWFUpload.CURSOR.HAND,
																	button_window_mode : "transparent",

custom_settings : {
																		progressTarget : "fsUploadProgress",
uploadSource: 'portal',
uploadType: 'attach',
imgBoxObj: $('attachlist')
//thumbnail_height: 400,
//thumbnail_width: 400,
//thumbnail_quality: 100
},

// Debug Settings
debug: false
});
var upload = new SWFUpload({
																	// Backend Settings
																	upload_url : "http://www.zlsgx.com/misc.php?mod=swfupload&action=swfupload&operation=album",
																	post_params : {
																		"uid" : "1339",
																		"hash" : "6898d2b892af32d71b986d3f6c05ba9e"
																	},

																	// File Upload Settings
																	file_size_limit : "1000", // 100MB
																	file_types : "*.jpg;*.jpeg;*.gif;*.png",
																	file_types_description : "Image File",
																	file_upload_limit : 0,
																	file_queue_limit : 0,

																	// Event Handler Settings (all my handlers are in the Handler.js file)
																	swfupload_preload_handler : preLoad,
																	swfupload_load_failed_handler : loadFailed,
																	file_dialog_start_handler : fileDialogStart,
																	file_queued_handler : fileQueued,
																	file_queue_error_handler : fileQueueError,
																	file_dialog_complete_handler : fileDialogComplete,
																	upload_start_handler : uploadStart,
																	upload_progress_handler : uploadProgress,
																	upload_error_handler : uploadError,
																	upload_success_handler : uploadSuccess,
																	upload_complete_handler : uploadComplete,

																	// Button Settings
																	button_image_url : "static/image/common/uploadbutton.png",
																	button_placeholder_id : "imgSpanButtonPlaceholder",
																	button_width : 100,
																	button_height : 25,
																	button_cursor : SWFUpload.CURSOR.HAND,
																	button_window_mode : "transparent",

custom_settings : {
																		progressTarget : "imgUploadProgress",
																		uploadSource : 'portal',
																		uploadType : 'blog',
																		imgBoxObj : $('imgattachlist')
																	//thumbnail_height: 400,
																	//thumbnail_width: 400,
																	//thumbnail_quality: 100
																	},

																	// Debug Settings
																	debug : false
																});
													</script> <script type="text/javascript">
	function switchImagebutton(btn) {
		switchButton(btn, 'image');
		$('icoImg_image_menu').style.height = '';
		doane();
	}
	function hideAttachMenu(id) {
		if ($(id)) {
			$(id).style.visibility = 'hidden';
		}
	}

	function insertWWWImg() {
		var urlObj = $('icoImg_image_param_1');
		if (urlObj.value != '') {
			var widthObj = $('icoImg_image_param_2');
			var heightObj = $('icoImg_image_param_3');
			insertImage(urlObj.value, null, widthObj.value, heightObj.value);
			urlObj.value = widthObj.value = heightObj.value = '';
		}
	}
	//note 选择图片
	function picView(albumid, listid) {
		if (albumid == 'none') {
			$(listid).innerHTML = '';
		} else {
			ajaxget('home.php?mod=misc&ac=ajax&op=album&id=' + albumid
					+ '&ajaxdiv=albumpic_body', listid);
		}
	}
	function createNewAlbum() {
		var inputObj = $('newalbum');
		if (inputObj.value == '' || inputObj.value == '请输入相册名称') {
			inputObj.value = '请输入相册名称';
		} else {
			var x = new Ajax();
			x.get('home.php?mod=misc&ac=ajax&op=createalbum&inajax=1&name='
					+ inputObj.value, function(s) {
				var aid = parseInt(s);
				var albumList = $('savealbumid');
				var haveoption = false;
				for (var i = 0; i < albumList.options.length; i++) {
					if (albumList.options[i].value == aid) {
						albumList.selectedIndex = i;
						haveoption = true;
						break;
					}
				}
				if (!haveoption) {
					var oOption = document.createElement("OPTION");
					oOption.text = trim(inputObj.value);
					oOption.value = aid;
					albumList.options.add(oOption);
					albumList.selectedIndex = albumList.options.length - 1;
				}
				inputObj.value = ''
			});
			selectCreateTab(1)
		}
	}
	function selectCreateTab(flag) {
		var vwObj = $('uploadPanel');
		var opObj = $('createalbum');
		var selObj = $('savealbumid');
		if (flag) {
			vwObj.style.display = '';
			opObj.style.display = 'none';
			selObj.value = selObj.options[0].value;
		} else {
			vwObj.style.display = 'none';
			opObj.style.display = '';
		}
	}
</script> <textarea class="pt" name="message" id="uchome-ttHtmlEditor"
														style="height: 100%; width: 100%; display: none; border: 0"></textarea>
													<div style="border: 1px solid #C5C5C5; height: 400px;">
														<iframe
															src='home.php?mod=editor&charset=utf-8&allowhtml=&doodle=1'
															name="uchome-ifrHtmlEditor" id="uchome-ifrHtmlEditor"
															scrolling="no" border="0" frameborder="0"
															style="width: 100%; height: 100%; position: relative;"></iframe>
													</div></td>
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
									<script type="text/javascript">
function validate(obj) {
var makefeed = $('makefeed');
if(makefeed) {
if(makefeed.checked == false) {
if(!confirm("友情提醒：您确定此次发布不发送动态吗？\n有了动态，好友才能及时看到您的更新 ")) {
return false;
}
}
}

if($('seccode')) {
var code = $('seccode').value;
var x = new Ajax();
x.get('home.php?mod=spacecp&ac=common&op=seccode&inajax=1&code=' + code, function(s){
s = trim(s);
if(s.indexOf('succeed') == -1) {
alert(s);
$('seccode').focus();
   		return false;
} else {
edit_save();
return true;
}
});
} else {
edit_save();
return true;
}
}
</script>


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