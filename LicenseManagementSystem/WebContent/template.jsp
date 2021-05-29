<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>라이선스 관리 시스템</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<style>
	.container{
		min-height: 85%;
	}
</style>
</head>
<body>
<%
	String contentpage=request.getParameter("CONTENTPAGE");
%>
<div class="container">
	<div class="header text-center mb-4">
		<div class="text-right">
			<a href="func/logout.jsp">로그아웃</a>
		</div>
		<a href="main.jsp">
			<img src="resources/desktop.png" class="logo-img mb-4">
			<label class="title-text">라이선스 관리 시스템</label>
		</a>
	</div>
	<jsp:include page="<%= contentpage %>"></jsp:include>
</div>
</body>
</html>