<%@page import="service.MemoVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="service.UserVO"%>
<%@page import="service.SQLMgt"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	MemoVO memoVO = new MemoVO();
	String user_id = (String) session.getAttribute("user_id");
	
	memoVO.setMemoTitle(request.getParameter("memoTitle"));
	memoVO.setMemoCont(request.getParameter("memoCont"));
	memoVO.setRgstId(user_id);
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		sqlMgt.createMemo(memoVO);
		%><meta http-equiv='refresh' content='0; url=../memoList.jsp'><%
	}catch(Exception e){
		out.println(e.toString());
	}
%>