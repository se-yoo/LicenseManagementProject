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
		if(confirm("���� �����Ͻðڽ��ϱ�?")) {
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
SW��: <%= result.getSwNm() %><br>
������: <%= result.getMnfNm() %><br>
����: <%= result.getSwVer() %><br>
����: <%= result.getSwEa() %><br>
�����: <%= result.getRgstId() %><br>
�����: <%= result.getRgstDt() %><br>
<a href="update.jsp?swSeq=<%= result.getSwSeq() %>">
	<button>����</button>
</a>

<button onclick="fn_delete(<%= result.getSwSeq() %>)">����</button>

<a href="main.jsp">
	<button>���</button>
</a>
</body>
</html>