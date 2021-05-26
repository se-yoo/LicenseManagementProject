<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_id = (String) session.getAttribute("user_id");
	if (user_id == null) {
		response.sendRedirect("login.jsp");
	} else {
%>
<jsp:forward page="template.jsp">
	<jsp:param name="CONTENTPAGE" value="view/swUpdateView.jsp" />
</jsp:forward>
<%
	}
%>