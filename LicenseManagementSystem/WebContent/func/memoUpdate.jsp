<%@page import="service.MemoVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="service.UserVO"%>
<%@page import="service.SQLMgt"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	MemoVO memoVO = new MemoVO();

	memoVO.setMemoSeq(request.getParameter("memoSeq"));
	memoVO.setMemoTitle(request.getParameter("memoTitle"));
	memoVO.setMemoCont(request.getParameter("memoCont"));
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		sqlMgt.updateMemo(memoVO);
		%><meta http-equiv='refresh' content='0; url=../memoRetrieve.jsp?memoSeq=<%= memoVO.getMemoSeq() %>'><%
	}catch(Exception e){
		out.println(e.toString());
	}
%>