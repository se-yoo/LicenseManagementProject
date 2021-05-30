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
			software.setSwNm(srchCont);
		}
		else {
			srchCont="";
		}
		
		result = sqlMgt.getSoftwareList(software);
	}catch(Exception e){
		out.println(e.toString());
	}
%>
<div class="pb-3">
	<form action="licList.jsp" method="POST">
		<div class="form-group row">
			<div class="col-6 col-md-offset-5">
				<input id="srchCont" class="form-control input-lg" type="text" name="srchCont" value="<%=srchCont%>" placeholder="검색할 SW명 입력">
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
						<a href="licRetrieve.jsp?swSeq=<%= swItem.getSwSeq() %>">
							<%= swItem.getSwNm() %>
						</a>
					</td>
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