<%@page import="service.SQLMgt"%>
<%@page import="service.SoftwareVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<%
	String swSeq = request.getParameter("swSeq");
	SoftwareVO result = new SoftwareVO();
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		SoftwareVO software = new SoftwareVO();
		
		software.setSwSeq(swSeq);
		
		result = sqlMgt.getSoftware(software);
	}catch(Exception e){
		out.println(e.toString());
	}
%>
<form action="func/swUpdate.jsp" method="POST">
	<input type="hidden" name="swSeq" value="<%= result.getSwSeq() %>">
	SW��: <input type="text" name="swNm" value="<%= result.getSwNm() %>" required><br>
	������: <input type="text" name="mnfNm" value="<%= result.getMnfNm() %>" required><br>
	����: <input type="text" name="swVer" value="<%= result.getSwVer() %>" required><br>
	����: <input type="number" name="swEa" value="<%= result.getSwEa() %>" ><br>
	<input type="submit" value="����">
</form>
<a href="retrieve.jsp?swSeq=<%= result.getSwSeq() %>">
	<button>���</button>
</a>
</body>
</html>