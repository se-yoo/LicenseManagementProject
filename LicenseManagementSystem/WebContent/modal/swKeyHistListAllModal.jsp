<%@page import="service.SoftwareKeyVO"%>
<%@page import="service.SQLMgt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.SoftwareKeyHistVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String swSeq = request.getParameter("swSeq");
	String licKey = request.getParameter("licKey");
	String srchUserNm = request.getParameter("srchUserNm");
	List<SoftwareKeyHistVO> result = new ArrayList<>();
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		SoftwareKeyVO softwareKey = new SoftwareKeyVO();
		
		softwareKey.setSwSeq(swSeq);
		softwareKey.setLicKey(licKey);
		
		if(srchUserNm!=null && !srchUserNm.equals("")) {
			softwareKey.setSrchUserNm(srchUserNm);
		}
		else {
			srchUserNm = "";
		}
		
		result = sqlMgt.getSoftwareKeyHistList(softwareKey);
	}catch(Exception e){
		out.println(e.toString());
	}
%>
<script>
	function search(){
		var srchUserNm = $("#srchUserNm").val();
		fn_histView(<%=swSeq%>,'<%=licKey%>', srchUserNm);
	}
	
	$(document).ready(function(){
		$("#srchUserNm").keyup(function(e){
			if(e.keyCode==13){
				search();
			}
		});
	});
</script>
<body>
<div class="modal-dialog">
	<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 id="modal-title" class="modal-title">�뿩���</h4>
		</div>
		<div class="modal-body">
			<div>
				<input id="srchUserNm" type="text" name="srchUserNm" value="<%=srchUserNm%>">
				<input type="button" value="�˻�" onclick="search()">
			</div>
			<table class="table">
				<tr>
					<th>�����</th>
					<th>��������</th>
					<th>���Ϸ���</th>
				</tr>	
				<%
					if(result.size()==0){
						%>
						<tr>
							<td colspan="3">�����Ͱ� �����ϴ�.</td>
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
	</div>
</div>
</body>
</html>