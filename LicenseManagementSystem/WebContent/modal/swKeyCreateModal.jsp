<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<div class="modal-dialog">
	<div class="modal-content">
		<form id="create-form" action="func/swKeyCreate.jsp" method="POST">
			<input name="swSeq" type="hidden" required>
			<div class="modal-header">
				<h4 id="modal-title" class="modal-title text-left">���</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td>���̼��� Ű</td>
						<td><input class="form-control" name="licKey" type="text" required></td>
					</tr>
					<tr>
						<td>����ο�</td>
						<td><input class="form-control" name="allowCnt" type="number" required></td>
					</tr>					
				</table>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary btn-blue">���</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>