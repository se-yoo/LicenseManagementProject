<%@page import="java.util.ArrayList"%>
<%@page import="service.SoftwareKeyVO"%>
<%@page import="java.util.List"%>
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
	if(confirm("���� �����Ͻðڽ��ϱ�?\n(���̼��� Ű, �����Ȳ, �뿩��� �� ���� �����͵� ��� �����˴ϴ�.)")) {
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
<div class="form-horizontal fs-16 pb-3">
	<div class="form-group">
	  <label for="swNm" class="col-sm-1 control-label">SW��</label>
	  <div class="col-sm-5">
	    <p class="form-control-static"><%= result.getSwNm() %></p>
	  </div>
	  <label for="mnfNm" class="col-sm-1 control-label">������</label>
	  <div class="col-sm-5">
	    <p class="form-control-static"><%= result.getMnfNm() %></p>
	  </div>
	</div>
	<div class="form-group">
	  <label for="swNm" class="col-sm-1 control-label">����</label>
	  <div class="col-sm-5">
	    <p class="form-control-static"><%= result.getSwVer() %></p>
	  </div>
	  <label for="mnfNm" class="col-sm-1 control-label">����</label>
	  <div class="col-sm-5">
	    <p class="form-control-static"><%= result.getSwEa() %></p>
	  </div>
	</div>
	<div class="form-group">
	  <label for="swNm" class="col-sm-1 control-label">�����</label>
	  <div class="col-sm-5">
	    <p class="form-control-static"><%= result.getRgstId() %></p>
	  </div>
	  <label for="mnfNm" class="col-sm-1 control-label">�����</label>
	  <div class="col-sm-5">
	    <p class="form-control-static"><%= result.getRgstDt() %></p>
	  </div>
	</div>
	<div class="form-group text-right">
		<a href="update.jsp?swSeq=<%= result.getSwSeq() %>" class="btn btn-primary btn-lg btn-blue mr-2">����</a>
		<button onclick="fn_delete(<%= result.getSwSeq() %>)" class="btn btn-primary btn-lg btn-blue mr-2">����</button>
		<a href="main.jsp" class="btn btn-default btn-lg">���</a>
	</div>
</div>
</body>
</html>