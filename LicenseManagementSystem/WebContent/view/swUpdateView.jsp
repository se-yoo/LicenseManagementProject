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
</head>
<body>
<div class="pb-3 fs-16">
	<form action="func/swUpdate.jsp" method="POST" class="form-horizontal">
		<input type="hidden" name="swSeq" value="<%= result.getSwSeq() %>">
		<div class="form-group">
		  <label for="swNm" class="col-sm-1 control-label">SW명</label>
		  <div class="col-sm-5">
		    <input type="text" class="form-control" id="swNm" name="swNm" value="<%= result.getSwNm() %>" required>
		  </div>
		  <label for="mnfNm" class="col-sm-1 control-label">제조사</label>
		  <div class="col-sm-5">
		    <input type="text" class="form-control" id="mnfNm" name="mnfNm" value="<%= result.getMnfNm() %>" required>
		  </div>
		</div>
		<div class="form-group">
		  <label for="swVer" class="col-sm-1 control-label">버전</label>
		  <div class="col-sm-5">
		    <input type="text" class="form-control" id="swVer" name="swVer" value="<%= result.getSwVer() %>" required>
		  </div>
		  <label for="swEa" class="col-sm-1 control-label">수량</label>
		  <div class="col-sm-5">
		    <input type="text" class="form-control" id="swEa" name="swEa" value="<%= result.getSwEa() %>" required>
		  </div>
		</div>
		<div class="form-group text-right">
		    <button type="submit" class="btn btn-primary btn-lg btn-blue mr-2">수정</button>
		    <a href="retrieve.jsp?swSeq=<%= result.getSwSeq() %>" class="btn btn-default btn-lg mr-4">취소</a>
	  	</div>
	</form>
</div>
</body>
</html>