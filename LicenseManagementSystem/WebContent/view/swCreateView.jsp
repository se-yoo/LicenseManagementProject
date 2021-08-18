<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<form class="form-horizontal fs-16" action="func/swCreate.jsp" method="POST" accept-charset="utf-8">
	<div class="form-group">
	  <label for="swNm" class="col-sm-1 control-label">SW명</label>
	  <div class="col-sm-5">
	    <input type="text" class="form-control" id="swNm" name="swNm" required>
	  </div>
	  <label for="mnfNm" class="col-sm-1 control-label">제조사</label>
	  <div class="col-sm-5">
	    <input type="text" class="form-control" id="mnfNm" name="mnfNm" required>
	  </div>
	</div>
	<div class="form-group">
	  <label for="swVer" class="col-sm-1 control-label">버전</label>
	  <div class="col-sm-5">
	    <input type="text" class="form-control" id="swVer" name="swVer" required>
	  </div>
	  <label for="swEa" class="col-sm-1 control-label">수량</label>
	  <div class="col-sm-5">
	    <input type="text" class="form-control" id="swEa" name="swEa" required>
	  </div>
	</div>
	<div class="form-group text-right">
	    <button type="submit" class="btn btn-primary btn-lg btn-blue mr-2">등록</button>
	    <a href="main.jsp" class="btn btn-default btn-lg mr-4">취소</a>
  	</div>
</form>
</body>
</html>