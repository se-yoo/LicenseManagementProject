<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̼��� ���� �ý���</title>
</head>
<body>
<%
	String contentpage=request.getParameter("CONTENTPAGE");
%>
<a href="main.jsp">���̼��� ���� �ý���</a>
<jsp:include page="<%= contentpage %>"></jsp:include>
</body>
</html>