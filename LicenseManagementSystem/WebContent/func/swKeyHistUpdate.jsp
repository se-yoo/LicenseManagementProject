<%@page import="service.SoftwareKeyHistVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="service.UserVO"%>
<%@page import="service.SQLMgt"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	SoftwareKeyHistVO swKeyHistVO = new SoftwareKeyHistVO();
	
	swKeyHistVO.setHistSeq(request.getParameter("histSeq"));
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		sqlMgt.updateSoftwareKeyHist(swKeyHistVO);
	}catch(Exception e){
		out.println(e.toString());
	}
%>