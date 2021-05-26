<%@page import="service.SQLMgt"%>
<%@page import="service.SoftwareKeyVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	SoftwareKeyVO swKeyVO = new SoftwareKeyVO();
	String swSeq = request.getParameter("swSeq");
	String licKey = request.getParameter("licKey");
	
	swKeyVO.setSwSeq(swSeq);
	swKeyVO.setLicKey(licKey);
	
	try{
		SQLMgt sqlMgt = new SQLMgt();
		sqlMgt.deleteSoftwareKey(swKeyVO);
		%><meta http-equiv='refresh' content='0; url=../update.jsp?swSeq=<%=swKeyVO.getSwSeq()%>'><%
	}catch(Exception e){
		out.println(e.toString());
	}
%>