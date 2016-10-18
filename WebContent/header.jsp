<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/header.css" />
<title>我爱老家</title>
<script type="text/javascript" src="js/settab.js"></script>
<script type="text/javascript" src="js/sethostpage.js"></script>
<script language="javascript" type="text/javascript">
    function logout(){
    	if (confirm("您确定要退出登录吗？")){
    		
    		var _topWin = window;  
    		while (_topWin != _topWin.parent.window) {  
    		     _topWin = _topWin.parent.window;  
    		}  
    		if (window != _topWin){
    			_topWin.document.location.href ='<%=request.getContextPath()%>/user.do?method=loginout&username=${sessionScope.username}';  
    		}
    	}
    	  return false;
    }
</script>
</head>
<body>
<!--top begin-->
<div class="top">
 <div class="wrap">
  <span class="fl"><a href="javascript:void(0);" onclick="SetHome(this,'http://www.52laojia.cn');">设为首页</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="AddFavorite('我的网站',location.href)">收藏本站</a></span>
  <span class="fr">
  
   <c:if test="${sessionScope.username==null or sessionScope.username==''}">
   <a href="login.jsp" title="" target="_parent">请登录</a>&nbsp;&nbsp;<a href="register.jsp" title="" target="_parent">立即注册</a>
  </c:if>
   <c:if test="${sessionScope.username!=null and sessionScope.username!=''}">
  <a href="<%=request.getContextPath() %>/user.do?method=checklogin&username=${sessionScope.username}" title="" target="_blank"><strong>${sessionScope.username}</strong></a>&nbsp;&nbsp;<a href="javascript:window.opener=null;%20window.close();" onclick="logout()" >安全退出</a>
  </c:if>
  </span>
 </div>
</div>
<!--top end-->
<!--header begin-->
<div class="header">
 <div class="wrap">
  <!-- <a href="#" title="" target="_blank"><img src="images/ad1.jpg" width="1004" height="40" /></a> -->
  <div class="search_box">
   <a href="#" title="" target="_blank"><img src="images/logo.jpg" width="389" height="53"  alt="" class="fl"/></a>
   <div class="search">
     <div id="lenu1">
       <ul>
         <li class="hover" onmousemove="setTab(1,0)">故乡<span>|</span></li>
         <li onmousemove="setTab(1,1)">美食<span>|</span></li>
         <li onmousemove="setTab(1,2)">农产品<span>|</span></li>
         <li onmousemove="setTab(1,3)">风俗</li>
       </ul>
     </div>
     <div class="lain1_box" id="lain1">
       <ul class="block">
        <li><input type="text"  value="请输入故乡名称" onFocus="if(this.value=='请输入故乡名称'){this.value='';}" onBlur="if(this.value==''){this.value='请输入故乡名称';}" class="sertxt" /><input type="button" value="搜 索" name=""  class="serbtn"/></li>
       </ul>
       <ul>
        <li><input type="text"  value="请输入美食名称" onFocus="if(this.value=='请输入美食名称'){this.value='';}" onBlur="if(this.value==''){this.value='请输入美食名称';}" class="sertxt" /><input type="button" value="搜 索" name=""  class="serbtn"/></li>
       </ul>
       <ul>
        <li><input type="text"  value="请输入农产品名称" onFocus="if(this.value=='请输入农产品名称'){this.value='';}" onBlur="if(this.value==''){this.value='请输入农产品名称';}" class="sertxt" /><input type="button" value="搜 索" name=""  class="serbtn"/></li>
       </ul>
       <ul>
        <li><input type="text"  value="请输入风俗名称" onFocus="if(this.value=='请输入风俗名称'){this.value='';}" onBlur="if(this.value==''){this.value='请输入风俗名称';}"  class="sertxt" /><input type="button" value="搜 索" name=""  class="serbtn"/></li>
       </ul>
     </div>
   </div>
   <div class="cb"></div>
  </div>
 </div>
 <div class="nav">
  <div class="wrap">
   <ul class="nav_left">
    <li><a href="index.jsp" title="" target="_blank">首 页</a></li>
    <li><a href="index.do?enum_code=1001-0" title="" target="_blank">家乡动态</a></li>
    <li><a href="index.do?enum_code=1001-4" title="" target="_blank">图说家乡</a></li>
    <li><a href="index.do?enum_code=1001-3" title="" target="_blank">风土人情</a></li>
    <li><a href="index.do?enum_code=1001-1" title="" target="_blank">家乡美食</a></li>
    <li><a href="index.do?enum_code=1001-2" title="" target="_blank">家乡特产</a></li>
   </ul>
   <ul class="nav_right">
    <li><a href="#" title="" target="_blank">风俗</a><span>|</span></li>
    <li><a href="#" title="" target="_blank">美食</a><span>|</span></li>
    <li><a href="#" title="" target="_blank">特产</a></li>
   </ul>
  </div>
 </div>
</div>
<!--header end-->

</body>
</html>
