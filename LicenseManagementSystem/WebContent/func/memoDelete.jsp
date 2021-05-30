<%@page import="service.SQLMgt"%>
<%@page import="service.MemoVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	MemoVO memoVO = new MemoVO();
	String memoSeq = request.getParameter("memoSeq");
	
	memoVO.setMemoSeq(memoSeq);
	
	try{
		SQLMgt sqlMgt = new SQLMgt();
		sqlMgt.deleteMemo(memoVO);
		%><meta http-equiv='refresh' content='0; url=../memoList.jsp'><%
	}catch(Exception e){
		out.println(e.toString());
	}
%>