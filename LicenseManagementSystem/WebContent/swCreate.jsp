<%@page import="service.SoftwareVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="service.UserVO"%>
<%@page import="service.SQLMgt"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	SoftwareVO swVO = new SoftwareVO();
	String user_id = (String) session.getAttribute("user_id");
	
	swVO.setSwNm(request.getParameter("sw_nm"));
	swVO.setMnfNm(request.getParameter("mnf_nm"));
	swVO.setSwVer(request.getParameter("sw_ver"));
	swVO.setSwEa(Integer.parseInt(request.getParameter("sw_ea")));
	swVO.setRgstId(user_id);
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		sqlMgt.createSoftware(swVO);
		%><meta http-equiv='refresh' content='0; url=main.jsp'><%
	}catch(Exception e){
		out.println(e.toString());
	}
%>