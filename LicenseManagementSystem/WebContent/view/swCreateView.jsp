<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<form action="func/swCreate.jsp" method="POST">
	SW��: <input type="text" name="swNm" required><br>
	������: <input type="text" name="mnfNm" required><br>
	����: <input type="text" name="swVer" required><br>
	����: <input type="number" name="swEa" ><br>
	<input type="submit" value="���">
</form>
<a href="main.jsp">
	<button>���</button>
</a>
</body>
</html>