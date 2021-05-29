<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body class="text-center bg-blue">
	<div id="login-form">
		<div class="header">
			<img src="resources/desktop.png" class="logo-img mb-4">
			<h3>라이선스 관리 시스템</h3>
		</div>
		<br>
		<div class="login">
			<form action="func/signIn.jsp" method="POST">
				<input type="text" name="user_id" class="form-control input-lg" placeholder="아이디" required>
				<input type="password" name="user_pw" class="form-control input-lg" placeholder="비밀번호" required><br>
				<input type="submit" value="Login" class="btn btn-primary btn-lg btn-block btn-blue">
			</form>
		</div>
	</div>
</body>
</html>