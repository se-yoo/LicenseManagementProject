<%@page import="java.util.ArrayList"%>
<%@page import="service.SoftwareKeyVO"%>
<%@page import="java.util.List"%>
<%@page import="service.SQLMgt"%>
<%@page import="service.MemoVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
function fn_delete(memoSeq) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href="func/memoDelete.jsp?memoSeq="+memoSeq;
	}
}
</script>
</head>
<body>
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
<div class="form-horizontal fs-16 pb-3">
	<div class="form-group">
	  <label for="memoTitle" class="col-sm-1 control-label">제목</label>
	  <div class="col-sm-11">
	    <p class="form-control-static"><%= result.getMemoTitle() %></p>
	  </div>
	</div>
	<div class="form-group">
	  <label for="memoCont" class="col-sm-1 control-label">내용</label>
	  <div class="col-sm-11">
	    <textarea class="form-control" id="memoCont" name="memoCont" rows="15" readonly><%= result.getMemoCont() %></textarea>
	  </div>
	</div>
	<div class="form-group">
	  <label class="col-sm-1 control-label">등록자</label>
	  <div class="col-sm-5">
	    <p class="form-control-static"><%= result.getRgstId() %></p>
	  </div>
	  <label class="col-sm-1 control-label">등록일</label>
	  <div class="col-sm-5">
	    <p class="form-control-static"><%= result.getRgstDt() %></p>
	  </div>
	</div>
	<div class="form-group text-right">
		<a href="memoUpdate.jsp?memoSeq=<%= result.getMemoSeq() %>" class="btn btn-primary btn-lg btn-blue mr-2">수정</a>
		<button onclick="fn_delete(<%= result.getMemoSeq() %>)" class="btn btn-primary btn-lg btn-blue mr-2">삭제</button>
		<a href="memoList.jsp" class="btn btn-default btn-lg">목록</a>
	</div>
</div>
</body>
</html>