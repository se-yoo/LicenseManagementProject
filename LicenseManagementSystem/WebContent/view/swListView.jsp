<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="service.SoftwareVO"%>
<%@page import="service.SQLMgt"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<%
	String srchCont = request.getParameter("srchCont");
	String srchDiv = request.getParameter("srchDiv");
	List<SoftwareVO> result = new ArrayList<>();
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		SoftwareVO software = new SoftwareVO();
		
		if(srchCont!=null) {
			if(srchDiv.equals("0")) 
				software.setSwNm(srchCont);
			else if(srchDiv.equals("1")) 
				software.setMnfNm(srchCont);
		}else {
			srchCont="";
			srchDiv="0";
		}
		
		result = sqlMgt.getSoftwareList(software);
	}catch(Exception e){
		out.println(e.toString());
	}
%>
<form action="main.jsp" method="POST">
	<select id="srchDiv" name="srchDiv">
		<option value="0" <%= srchDiv.equals("0")? "selected" : ""%>>SW명</option>
		<option value="1" <%= srchDiv.equals("1")? "selected" : ""%>>제조사</option>
	</select>
	<input id="srchCont" type="text" name="srchCont" value="<%=srchCont%>">
	<input type="submit" value="검색">
</form>
<table>
	<tr>
		<td>SW명</td>
		<td>제조사</td>
		<td>버전</td>
		<td>수량</td>
	</tr>
<%
	if(result.size()==0){
		%>
		<tr>
			<td colspan="4">데이터가 없습니다.</td>
		</tr>
		<%
	}
	else {
		for(SoftwareVO swItem : result) {
		%>
		<tr>
			<td>
				<a href="retrieve.jsp?swSeq=<%= swItem.getSwSeq() %>">
					<%= swItem.getSwNm() %>
				</a>
			</td>
			<td><%= swItem.getMnfNm() %></td>
			<td><%= swItem.getSwVer() %></td>
			<td><%= swItem.getSwEa() %></td>
		</tr>
		<%
		}
	}
%>
</table>
<a href="create.jsp">
	<button>등록</button>
</a>
</body>
</html>