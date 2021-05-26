<%@page import="service.SoftwareKeyVO"%>
<%@page import="service.SQLMgt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.SoftwareKeyHistVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%
	String swSeq = request.getParameter("swSeq");
	String licKey = request.getParameter("licKey");
	List<SoftwareKeyHistVO> result = new ArrayList<>();
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		SoftwareKeyVO softwareKey = new SoftwareKeyVO();
		
		softwareKey.setSwSeq(swSeq);
		softwareKey.setLicKey(licKey);
		
		result = sqlMgt.getSoftwareKeyHistList(softwareKey);
	}catch(Exception e){
		out.println(e.toString());
	}
%>
<div class="modal-dialog">
	<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 id="modal-title" class="modal-title">대여기록</h4>
		</div>
		<div class="modal-body">
			<table class="table">
				<tr>
					<th>사용자</th>
					<th>사용시작일</th>
					<th>사용완료일</th>
				</tr>	
				<%
					if(result.size()==0){
						%>
						<tr>
							<td colspan="3">데이터가 없습니다.</td>
						</tr>
						<%
					}
					else {
						for(SoftwareKeyHistVO swItem : result) {
						%>
						<tr>
							<td><%= swItem.getUserNm() %></td>
							<td><%= swItem.getUseStrtDt() %></td>
							<td><%= swItem.getUseEndDt() %></td>
						</tr>
						<%
						}
					}
				%>				
			</table>
		</div>
		<div class="modal-footer">
			<button type="submit" class="btn btn-success">수정</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		</div>
	</div>
</div>
</body>
</html>