<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="service.MemoVO"%>
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
	List<MemoVO> result = new ArrayList<>();
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		MemoVO memo = new MemoVO();
		
		if(srchCont!=null) {
			memo.setMemoTitle(srchCont);
		}else {
			srchCont="";
		}
		
		result = sqlMgt.getMemoList(memo);
	}catch(Exception e){
		out.println(e.toString());
	}
%>
<div class="pb-3">
	<form action="main.jsp" method="POST">
		<div class="form-group row">
			<div class="col-2 pr-1">
				<a href="memoCreate.jsp">
					<div class="btn btn-default btn-lg">
						등록 <span class="glyphicon glyphicon-pencil ml-1" aria-hidden="true"></span>
					</div>
				</a>
			</div>
			<div class="col-6 col-md-offset-3">
				<input id="srchCont" class="form-control input-lg" type="text" name="srchCont" value="<%=srchCont%>" placeholder="검색할 제목 입력">
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
				<th>제목</th>
				<th>등록자</th>
				<th>등록일</th>
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
				for(MemoVO memoItem : result) {
				%>
				<tr>
					<td>
						<a href="memoRetrieve.jsp?memoSeq=<%= memoItem.getMemoSeq() %>">
							<%= memoItem.getMemoTitle() %>
						</a>
					</td>
					<td><%= memoItem.getRgstId() %></td>
					<td><%= memoItem.getRgstDt() %></td>
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