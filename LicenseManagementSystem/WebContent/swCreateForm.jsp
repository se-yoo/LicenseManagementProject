<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<form action="swCreate.jsp" method="POST">
	SW명: <input type="text" name="sw_nm" required><br>
	제조사: <input type="text" name="mnf_nm" required><br>
	버전: <input type="text" name="sw_ver" required><br>
	수량: <input type="number" name="sw_ea" ><br>
	<input type="submit" value="등록">
</form>
<a href="main.jsp">
	<button>취소</button>
</a>
</body>
</html>