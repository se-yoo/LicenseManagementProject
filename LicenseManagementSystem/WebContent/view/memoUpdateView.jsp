<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="service.SQLMgt"%>
<%@page import="service.MemoVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%
	String memoSeq = request.getParameter("memoSeq");
	MemoVO result = new MemoVO();
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		MemoVO memo = new MemoVO();
		
		memo.setMemoSeq(memoSeq);
		
		result = sqlMgt.getMemo(memo);
	}catch(Exception e){
		out.println(e.toString());
	}
%>
</head>
<body>
<div class="pb-3 fs-16">
	<form action="func/memoUpdate.jsp" method="POST" class="form-horizontal" accept-charset="utf-8">
		<input type="hidden" name="memoSeq" value="<%= result.getMemoSeq() %>">
		<div class="form-group">
		  <label for="memoTitle" class="col-sm-1 control-label">제목</label>
		  <div class="col-sm-11">
		    <input type="text" class="form-control" id="memoTitle" name="memoTitle" value="<%= result.getMemoTitle() %>" required>
		  </div>
		</div>
		<div class="form-group">
		  <label for="memoCont" class="col-sm-1 control-label">내용</label>
		  <div class="col-sm-11">
		    <textarea class="form-control" id="memoCont" name="memoCont" rows="15"><%= result.getMemoCont() %></textarea>
		  </div>
		</div>
		<div class="form-group text-right">
		    <button type="submit" class="btn btn-primary btn-lg btn-blue mr-2">수정</button>
		    <a href="memoRetrieve.jsp?memoSeq=<%= result.getMemoSeq() %>" class="btn btn-default btn-lg mr-4">취소</a>
	  	</div>
	</form>
</div>
</body>
</html>