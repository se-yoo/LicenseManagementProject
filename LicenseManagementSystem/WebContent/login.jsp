<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
</head>
<body>
	<div class="header">
		<div>
			라이선스 관리 시스템
		</div>
	</div>
	<br>
	<div class="login">
		<form action="func/signIn.jsp" method="POST">
			<input type="text" name="user_id" required><br>
			<input type="password" name="user_pw" required><br>
			<input type="submit" value="Login">
		</form>
	</div>
</body>
</html>