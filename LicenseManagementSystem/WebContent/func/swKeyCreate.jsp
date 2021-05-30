<%@page import="service.SoftwareKeyVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="service.UserVO"%>
<%@page import="service.SQLMgt"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	SoftwareKeyVO swKeyVO = new SoftwareKeyVO();
	String user_id = (String) session.getAttribute("user_id");
	
	swKeyVO.setSwSeq(request.getParameter("swSeq"));
	swKeyVO.setLicKey(request.getParameter("licKey"));
	swKeyVO.setAllowCnt(Integer.parseInt(request.getParameter("allowCnt")));
	swKeyVO.setRgstId(user_id);
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		sqlMgt.createSoftwareKey(swKeyVO);
		%><meta http-equiv='refresh' content='0; url=../licUpdate.jsp?swSeq=<%=swKeyVO.getSwSeq()%>'><%
	}catch(Exception e){
		out.println(e.toString());
	}
%>