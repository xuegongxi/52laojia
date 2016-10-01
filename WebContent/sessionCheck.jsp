<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>校验用户是否登录</title>
</head>
<%
 Object obj = session.getAttribute("user");
 if(obj==null){
   out.print("你没有登录");
   response.sendRedirect("../index.jsp");
}
%>

<%-- <%@include  file="../sessionCheck.jsp"%> --%>

<body>
</body>
</html>