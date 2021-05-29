<%@page import="java.sql.SQLException"%>
<%@page import="service.UserVO"%>
<%@page import="service.SQLMgt"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.setAttribute("user_id", null);
	%><meta http-equiv='refresh' content='0; url=../main.jsp'><%
%>