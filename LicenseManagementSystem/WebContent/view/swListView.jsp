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
<div class="pb-3">
	<form action="main.jsp" method="POST">
		<div class="form-group row">
			<div class="col-2 pr-1">
				<a href="create.jsp">
					<div class="btn btn-default btn-lg">
						등록 <span class="glyphicon glyphicon-pencil ml-1" aria-hidden="true"></span>
					</div>
				</a>
			</div>
			<div class="col-2 col-md-offset-1 pr-1">
				<select id="srchDiv" name="srchDiv" class="form-control input-lg" size="1">
					<option value="0" <%= srchDiv.equals("0")? "selected" : ""%>>SW명</option>
					<option value="1" <%= srchDiv.equals("1")? "selected" : ""%>>제조사</option>
				</select>
			</div>
			<div class="col-6">
				<input id="srchCont" class="form-control input-lg" type="text" name="srchCont" value="<%=srchCont%>">
			</div>
			<div class="col-1 pl-1">
				<input type="submit" value="검색" class="btn btn-primary btn-lg btn-block btn-blue">
			</div>
		</div>
	</form>
</div>
<div class="pb-3 pt-3">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>SW명</th>
				<th>제조사</th>
				<th>버전</th>
				<th>수량</th>
			</tr>
		</thead>
		<tbody>
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
		</tbody>
	</table>
</div>
</body>
</html>