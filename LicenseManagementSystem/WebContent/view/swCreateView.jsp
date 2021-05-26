<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<form action="func/swCreate.jsp" method="POST">
	SW명: <input type="text" name="swNm" required><br>
	제조사: <input type="text" name="mnfNm" required><br>
	버전: <input type="text" name="swVer" required><br>
	수량: <input type="number" name="swEa" ><br>
	<input type="submit" value="등록">
</form>
<a href="main.jsp">
	<button>취소</button>
</a>
</body>
</html>