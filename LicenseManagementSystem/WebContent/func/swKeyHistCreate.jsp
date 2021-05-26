<%@page import="service.SoftwareKeyHistVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="service.UserVO"%>
<%@page import="service.SQLMgt"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	SoftwareKeyHistVO swKeyHistVO = new SoftwareKeyHistVO();
	String user_id = (String) session.getAttribute("user_id");
	
	swKeyHistVO.setSwSeq(request.getParameter("swSeq"));
	swKeyHistVO.setLicKey(request.getParameter("licKey"));
	swKeyHistVO.setUserNm(request.getParameter("userNm"));
	swKeyHistVO.setRgstId(user_id);
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		sqlMgt.createSoftwareKeyHist(swKeyHistVO);
	}catch(Exception e){
		out.println(e.toString());
	}
%>