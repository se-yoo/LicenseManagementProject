<%@page import="java.sql.SQLException"%>
<%@page import="service.UserVO"%>
<%@page import="service.SQLMgt"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = request.getParameter("user_id");
	String user_pw=request.getParameter("user_pw");
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		UserVO user = new UserVO();
		user = sqlMgt.getLoginUser(user_id, user_pw);
		
		if(user.getUserId().equals("")){
			out.println("<script>alert('아이디 혹은 비밀번호를 확인해주세요.')</script>");
			%><meta http-equiv='refresh' content='0; url=../login.jsp'><%
		} else {
			session.setAttribute("user_id", user.getUserId());
			%><meta http-equiv='refresh' content='0; url=../main.jsp'><%
		}
	}catch(Exception e){
		out.println(e.toString());
	}
%>