<%@page import="service.SQLMgt"%>
<%@page import="service.SoftwareVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
	function fn_delete(swSeq) {
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href="func/swDelete.jsp?swSeq="+swSeq;
		}
	}
</script>
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
SW명: <%= result.getSwNm() %><br>
제조사: <%= result.getMnfNm() %><br>
버전: <%= result.getSwVer() %><br>
수량: <%= result.getSwEa() %><br>
등록자: <%= result.getRgstId() %><br>
등록일: <%= result.getRgstDt() %><br>
<a href="update.jsp?swSeq=<%= result.getSwSeq() %>">
	<button>수정</button>
</a>

<button onclick="fn_delete(<%= result.getSwSeq() %>)">삭제</button>

<a href="main.jsp">
	<button>목록</button>
</a>
</body>
</html>