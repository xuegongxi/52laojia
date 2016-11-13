/*
	[Discuz!] (C)2001-2099 Comsenz Inc.
	This is NOT a freeware, use is subject to license terms

	$Id: register.js 33433 2013-06-13 07:36:25Z nemohou $
*/

var lastusername = '', lastpassword = '', lastemail = '', lastinvitecode = '', stmp = new Array(), modifypwd = false, profileTips = '如不需要更改密码，此处请留空';
$(function(){
    select1();
    $("#S1").change(function(){
    	 $("#S3 option:gt(0)").remove();
    	 $("#S4 option:gt(0)").remove();
    	 $("#S5 option:gt(0)").remove();
    	 select2();
    });
    $("#S2").change(function(){
      $("#S3 option:gt(0)").remove();
      $("#S4 option:gt(0)").remove();
      $("#S5 option:gt(0)").remove();
   	 select3();
   });
    $("#S3").change(function(){
      $("#S4 option:gt(0)").remove();
      $("#S5 option:gt(0)").remove();
   	 select4();
   });
    $("#S4").change(function(){
    $("#S5 option:gt(0)").remove();
   	 select5();
   });
    
   /* $('#S1').bind("change", select2);
    $('#S2').bind("change", select3);
    $('#S3').bind("change", select4);
    $('#S4').bind("change", select5);*/
});

function select1() {
    $.ajax(
    {
        type: "post",
        url: "user.do?method=getposition",
        data: { "type": "province" },
        dataType: "json", 
        success: function (msg) {
            for (var i = 0; i < msg.length; i++) {
                $("#S1").append("<option value=" + msg[i].ProvinceID + ">" + msg[i].ProvinceName + "</option>");
            }
           // select2();
        }
    });
};
function select2() {
    $("#S2").html("");
    $.ajax(
    {
        type: "post",
        url: "user.do?method=getposition",
        data: { "type": "city","provinceID":$('#S1').attr("value") },
        dataType: "json", 
        success: function (msg) {
        	if(msg==null){
        		 $("#S2").append("<option value='0'>所有城市</option>");
        	}else{
        		 $("#S2").append("<option value='0'>所有城市</option>");
        		 for (var i = 0; i < msg.length; i++) {
                     $("#S2").append("<option value=" + msg[i].CityID + ">" + msg[i].CityName + "</option>");
                 }
                 //select3();
        	}
        }
    });
};

function select3() {
    $("#S3").html("");
    $.ajax(
    {
        type: "post",
        url: "user.do?method=getposition",
        data: { "type": "county","cityID":$('#S2').attr("value") },
        dataType: "json", 
        success: function (msg) {
        	if(msg==null){
        		 $("#S3").append("<option value='0'>所有区/县</option>");
        	}else{
        		$("#S3").append("<option value='0'>所有区/县</option>");
        		for (var i = 0; i < msg.length; i++) {
                    $("#S3").append("<option value=" + msg[i].county_id + ">" + msg[i].county_name + "</option>");
                }
                //select4();
        	}
            
        }
    });
};
function select4() {
    $("#S4").html("");
    $.ajax(
    {
        type: "post",
        url: "user.do?method=getposition",
        data: { "type": "town","countyID":$('#S3').attr("value") },
        dataType: "json", 
        success: function (msg) {
        	if(msg==null){
        		 $("#S4").append("<option value='0'>所有乡镇</option>");
        	}else{
        		 $("#S4").append("<option value='0'>所有乡镇</option>");
        		 for (var i = 0; i < msg.length; i++) {
                     $("#S4").append("<option value=" + msg[i].town_id + ">" + msg[i].town_name + "</option>");
                 }
                 //select5();
        	}
        }
    });
};
function select5() {
    $("#S5").html("");
    $.ajax(
    {
        type: "post",
        url: "user.do?method=getposition",
        data: { "type": "village","townID":$('#S4').attr("value") },
        dataType: "json", 
        success: function (msg) {
        	if(msg==null){
        		 $("#S5").append("<option value='0'>所有村</option>");
        	}else{
        		 $("#S5").append("<option value='0'>所有村</option>");
        		for (var i = 0; i < msg.length; i++) {
                    $("#S5").append("<option value=" + msg[i].village_id + ">" + msg[i].village_name + "</option>");
                }
        	}
        }
    });
};

function errormessage(id, msg) {
	if($(id)) {
		try{
			showInputTip();
		} catch (e) {}
		msg = !msg ? '' : msg;
		if($('tip_' + id)) {
			if(msg == 'succeed') {
				msg = '';
				$('tip_' + id).parentNode.className = $('tip_' + id).parentNode.className.replace(/ p_right/, '');
				$('tip_' + id).parentNode.className += ' p_right';
			} else if(msg !== '') {
				$('tip_' + id).parentNode.className = $('tip_' + id).parentNode.className.replace(/ p_right/, '');
			}
		}
		if($('chk_' + id)) {
			$('chk_' + id).innerHTML = msg;
		}
		$(id).className = $(id).className.replace(/ er/, '');
		$(id).className += !msg ? '' : ' er';
	}
}

function addFormEvent(formid, focus){
	jQ('#'+formid).find("input").each(function(e,d){
		if(jQ(this).attr('name') == ''){
			jQ(this).attr('name',jQ(this).attr('id'));
		}
		t = jQ(this).attr('type')
		if(t == 'text' || t=='password'){
			console.log(jQ(this).attr("id"));
			jQ(this).on("focus",function(){
				showInputTip(jQ(this).attr("id"));
			})
		}
	})
	// if(reg_method == 0){
		jQ("#registerform").on("blur",'.reg_mobile',function(){
			checkphone(jQ(this).attr("id"))
		})
	// }else{
		jQ("#registerform").on("blur",'.reg_email',function(){
			addMailEvent(jQ(this)[0])
		})
	// }
	jQ("#registerform").on("blur",".reg_username",function(){
		checkusername(jQ(this).attr("id"))
	})

	checkPwdComplexity(jQ("#registerform .reg_password")[0], jQ("#registerform .reg_password2")[0]);
	
	
	try {
		if(focus) {
			$('invitecode').focus();
		} else {
			formNode[stmp[0]].focus();
		}
	} catch(e) {}
}

function checkPwdComplexity(firstObj, secondObj, modify) {
	modifypwd = modify || false;
	firstObj.onblur = function () {
		if(firstObj.value == '') {
			var pwmsg = !modifypwd ? '请填写密码' : profileTips;
			if(pwlength > 0) {
				pwmsg += ', 最小长度为 '+pwlength+' 个字符';
			}
			errormessage(firstObj.id, pwmsg);
		}else{
			errormessage(firstObj.id, !modifypwd ? 'succeed' : '');
		}
		checkpassword(firstObj.id, secondObj.id);
	};
	firstObj.onkeyup = function () {
		if(pwlength == 0 || $(firstObj.id).value.length >= pwlength) {
			var passlevels = new Array('','弱','中','强');
			var passlevel = checkstrongpw(firstObj.id);
			errormessage(firstObj.id, '<span class="passlevel passlevel'+passlevel+'">密码强度:'+passlevels[passlevel]+'</span>');
		}
	};
	secondObj.onblur = function () {
		if(secondObj.value == '') {
			errormessage(secondObj.id, !modifypwd ? '请再次输入密码' : profileTips);
		}
		checkpassword(firstObj.id, secondObj.id);
	};
}

function addMailEvent(mailObj) {

	mailObj.onclick = function (event) {
		emailMenu(event, mailObj.id);
	};
	mailObj.onkeyup = function (event) {
		emailMenu(event, mailObj.id);
	};
	mailObj.onkeydown = function (event) {
		emailMenuOp(4, event, mailObj.id);
	};
	mailObj.onblur = function () {
		if(mailObj.value == '') {
			errormessage(mailObj.id, '请输入邮箱地址');
		}
		emailMenuOp(3, null, mailObj.id);
	};
	stmp['email'] = mailObj.id;
}
function checkstrongpw(id) {
	var passlevel = 0;
	if($(id).value.match(/\d+/g)) {
		passlevel ++;
	}
	if($(id).value.match(/[a-z]+/ig)) {
		passlevel ++;
	}
	if($(id).value.match(/[^a-z0-9]+/ig)) {
		passlevel ++;
	}
	return passlevel;
}
function showInputTip(id) {
	jQ("#registerform i.p_tip").css({'display':'none'});
	console.log("#tip_"+id)
	jQ("#tip_"+id).css({'display':'block'});
}

function showbirthday(){
	var el = $('birthday');
	var birthday = el.value;
	el.length=0;
	el.options.add(new Option('日', ''));
	for(var i=0;i<28;i++){
		el.options.add(new Option(i+1, i+1));
	}
	if($('birthmonth').value!="2"){
		el.options.add(new Option(29, 29));
		el.options.add(new Option(30, 30));
		switch($('birthmonth').value){
			case "1":
			case "3":
			case "5":
			case "7":
			case "8":
			case "10":
			case "12":{
				el.options.add(new Option(31, 31));
			}
		}
	} else if($('birthyear').value!="") {
		var nbirthyear=$('birthyear').value;
		if(nbirthyear%400==0 || (nbirthyear%4==0 && nbirthyear%100!=0)) el.options.add(new Option(29, 29));
	}
	el.value = birthday;
}

function trim(str) {
	return str.replace(/^\s*(.*?)[\s\n]*$/g, '$1');
}

var emailMenuST = null, emailMenui = 0, emaildomains = ['qq.com', '163.com', 'sina.com', 'sohu.com', 'yahoo.com', 'gmail.com', 'hotmail.com'];
function emailMenuOp(op, e, id) {
	if(op == 3 && BROWSER.ie && BROWSER.ie < 7) {
		checkemail(id);
	}
	if(!$('emailmore_menu')) {
		return;
	}
	if(op == 1) {
		$('emailmore_menu').style.display = 'none';
	} else if(op == 2) {
		showMenu({'ctrlid':'emailmore','pos': '13!'});
	} else if(op == 3) {
		emailMenuST = setTimeout(function () {
			emailMenuOp(1, id);
			checkemail(id);
		}, 500);
	} else if(op == 4) {
	       	e = e ? e : window.event;
                var obj = $(id);
        	if(e.keyCode == 13) {
                        var v = obj.value.indexOf('@') != -1 ? obj.value.substring(0, obj.value.indexOf('@')) : obj.value;
                        obj.value = v + '@' + emaildomains[emailMenui];
                        doane(e);
        	}
	} else if(op == 5) {
                var as = $('emailmore_menu').getElementsByTagName('a');
                for(i = 0;i < as.length;i++){
                        as[i].className = '';
                }
	}
}

function emailMenu(e, id) {
	if(BROWSER.ie && BROWSER.ie < 7) {
		return;
	}
	e = e ? e : window.event;
        var obj = $(id);
	if(obj.value.indexOf('@') != -1) {
		$('emailmore_menu').style.display = 'none';
		return;
	}
	var value = e.keyCode;
	var v = obj.value;
	if(!obj.value.length) {
		emailMenuOp(1);
		return;
	}

        if(value == 40) {
		emailMenui++;
		if(emailMenui >= emaildomains.length) {
			emailMenui = 0;
		}
	} else if(value == 38) {
		emailMenui--;
		if(emailMenui < 0) {
			emailMenui = emaildomains.length - 1;
		}
	} else if(value == 13) {
  		$('emailmore_menu').style.display = 'none';
  		return;
 	}
        if(!$('emailmore_menu')) {
		menu = document.createElement('div');
		menu.id = 'emailmore_menu';
		menu.style.display = 'none';
		menu.className = 'p_pop';
		menu.setAttribute('disautofocus', true);
		$('append_parent').appendChild(menu);
	}
	var s = '<ul>';
	for(var i = 0; i < emaildomains.length; i++) {
		s += '<li><a href="javascript:;" onmouseover="emailMenuOp(5)" ' + (emailMenui == i ? 'class="a" ' : '') + 'onclick="$(stmp[\'email\']).value=this.innerHTML;display(\'emailmore_menu\');checkemail(stmp[\'email\']);">' + v + '@' + emaildomains[i] + '</a></li>';
	}
	s += '</ul>';
	$('emailmore_menu').innerHTML = s;
	emailMenuOp(2);
}

function checksubmit() {
	var p_chks = $('registerform').getElementsByTagName('kbd');
	for(i = 0;i < p_chks.length;i++){
		if(p_chks[i].className == 'p_chk'){
			p_chks[i].innerHTML = '';
		}
	}
	ajaxpost('registerform', 'returnmessage4', 'returnmessage4', 'onerror');
	return;
}

function checkusername(id) {
	errormessage(id);
	var username = trim($(id).value);
	if($('tip_' + id).parentNode.className.match(/ p_right/) && (username == '' || username == lastusername)) {
		return;
	} else {
		lastusername = username;
	}
	if(username.match(/<|"/ig)) {
		errormessage(id, '用户名包含敏感字符');
		return;
	}
	var unlen = username.replace(/[^\x00-\xff]/g, "**").length;
	if(unlen < 3 || unlen > 15) {
		errormessage(id, unlen < 3 ? '用户名不得小于 3 个字符' : '用户名不得超过 15 个字符');
		return;
	}
	var x = new Ajax();
	$('tip_' + id).parentNode.className = $('tip_' + id).parentNode.className.replace(/ p_right/, '');
	x.get('forum.php?mod=ajax&inajax=yes&infloat=register&handlekey=register&ajaxmenu=1&action=checkusername&username=' + (BROWSER.ie && document.charset == 'utf-8' ? encodeURIComponent(username) : username.replace(/%/g, '%25').replace(/#/g, '%23')), function(s) {
		errormessage(id, s);
	});
}

function checkpassword(id1, id2) {
	if(!$(id1).value && !$(id2).value) {
		return;
	}
	if(pwlength > 0) {
		if($(id1).value.length < pwlength) {
			errormessage(id1, '密码太短，不得少于 '+pwlength+' 个字符');
			return;
		}
	}
	if(strongpw) {
		var strongpw_error = false, j = 0;
		var strongpw_str = new Array();
		for(var i in strongpw) {
			if(strongpw[i] === 1 && !$(id1).value.match(/\d+/g)) {
				strongpw_error = true;
				strongpw_str[j] = '数字';
				j++;
			}
			if(strongpw[i] === 2 && !$(id1).value.match(/[a-z]+/g)) {
				strongpw_error = true;
				strongpw_str[j] = '小写字母';
				j++;
			}
			if(strongpw[i] === 3 && !$(id1).value.match(/[A-Z]+/g)) {
				strongpw_error = true;
				strongpw_str[j] = '大写字母';
				j++;
			}
			if(strongpw[i] === 4 && !$(id1).value.match(/[^A-Za-z0-9]+/g)) {
				strongpw_error = true;
				strongpw_str[j] = '特殊符号';
				j++;
			}
		}
		if(strongpw_error) {
			errormessage(id1, '密码太弱，密码中必须包含 '+strongpw_str.join('，'));
			return;
		}
	}
	errormessage(id2);
	if($(id1).value != $(id2).value) {
		errormessage(id2, '两次输入的密码不一致');
	} else {
		errormessage(id2, !modifypwd ? 'succeed' : '');
	}
}

function checkemail(id) {
	errormessage(id);
	var email = trim($(id).value);
	if($(id).parentNode.className.match(/ p_right/) && (email == '' || email == lastemail)) {
		return;
	} else {
		lastemail = email;
	}
	if(email.match(/<|"/ig)) {
		errormessage(id, 'Email 包含敏感字符');
		return;
	}
	var x = new Ajax();
	$('tip_' + id).parentNode.className = $('tip_' + id).parentNode.className.replace(/ p_right/, '');
	x.get('forum.php?mod=ajax&inajax=yes&infloat=register&handlekey=register&ajaxmenu=1&action=checkemail&email=' + email, function(s) {
		errormessage(id, s);
	});
}
//check phone
function checkphone(id) {
	errormessage(id);
	var phone = trim($(id).value);
	console.log(phone);
	if(!phone.match(/(13|15|18)\d{9}/ig)) {
		errormessage(id, '请输入正确的手机号');
		return;
	}
	var x = new Ajax();
	x.get('forum.php?mod=ajax&inajax=yes&infloat=register&handlekey=register&ajaxmenu=1&action=checkphone&phone=' + phone, function(s) {
		errormessage(id, s);
	});
}


function checkinvite() {
	errormessage('invitecode');
	var invitecode = trim($('invitecode').value);
	if(invitecode == '' || invitecode == lastinvitecode) {
		return;
	} else {
		lastinvitecode = invitecode;
	}
	if(invitecode.match(/<|"/ig)) {
		errormessage('invitecode', '邀请码包含敏感字符');
		return;
	}
	var x = new Ajax();
	$('tip_invitecode').parentNode.className = $('tip_invitecode').parentNode.className.replace(/ p_right/, '');
	x.get('forum.php?mod=ajax&inajax=yes&infloat=register&handlekey=register&ajaxmenu=1&action=checkinvitecode&invitecode=' + invitecode, function(s) {
		errormessage('invitecode', s);
	});
	
	
}