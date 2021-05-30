<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<form class="form-horizontal fs-16" action="func/memoCreate.jsp" method="POST" accept-charset="utf-8">
	<div class="form-group">
	  <label for="memoTitle" class="col-sm-1 control-label">제목</label>
	  <div class="col-sm-11">
	    <input type="text" class="form-control" id="memoTitle" name="memoTitle" required>
	  </div>
	</div>
	<div class="form-group">
	  <label for="memoCont" class="col-sm-1 control-label">내용</label>
	  <div class="col-sm-11">
	    <textarea class="form-control" id="memoCont" name="memoCont" rows="15"></textarea>
	  </div>
	</div>
	<div class="form-group text-right">
	    <button type="submit" class="btn btn-primary btn-lg btn-blue mr-2">등록</button>
	    <a href="memoList.jsp" class="btn btn-default btn-lg mr-4">취소</a>
  	</div>
</form>
</body>
</html>