<%@page import="service.SQLMgt"%>
<%@page import="service.SoftwareVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	SoftwareVO swVO = new SoftwareVO();
	String swSeq = request.getParameter("swSeq");
	
	swVO.setSwSeq(swSeq);
	
	try{
		SQLMgt sqlMgt = new SQLMgt();
		sqlMgt.deleteSoftware(swVO);
		%><meta http-equiv='refresh' content='0; url=../main.jsp'><%
	}catch(Exception e){
		out.println(e.toString());
	}
%>