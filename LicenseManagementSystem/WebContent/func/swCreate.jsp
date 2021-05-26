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
	
	swVO.setSwNm(request.getParameter("swNm"));
	swVO.setMnfNm(request.getParameter("mnfNm"));
	swVO.setSwVer(request.getParameter("swVer"));
	swVO.setSwEa(Integer.parseInt(request.getParameter("swEa")));
	swVO.setRgstId(user_id);
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		sqlMgt.createSoftware(swVO);
		%><meta http-equiv='refresh' content='0; url=../main.jsp'><%
	}catch(Exception e){
		out.println(e.toString());
	}
%>