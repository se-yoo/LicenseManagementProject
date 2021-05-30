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
	List<SoftwareKeyHistVO> results = new ArrayList<>();
	SoftwareKeyVO result = new SoftwareKeyVO();
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		SoftwareKeyVO softwareKey = new SoftwareKeyVO();
		
		softwareKey.setSwSeq(swSeq);
		softwareKey.setLicKey(licKey);
		softwareKey.setSrchStat(0);
		
		result = sqlMgt.getSoftwareKey(softwareKey);
		results = sqlMgt.getSoftwareKeyHistList(softwareKey);
	}catch(Exception e){
		out.println(e.toString());
	}
%>
<script>
	function refresh(){
		fn_statusView(<%=swSeq%>,'<%=licKey%>');
	}
	
	function addItem(){
		if(chkOverMax()){
			alert("��� �ο��� �ʰ��߽��ϴ�.");
			return;
		}
		
		var userNm = prompt("����� �̸��� �Է����ּ���");
		if(userNm!="" && userNm!=undefined) {
			$("#loadFunc").load("func/swKeyHistCreate.jsp?swSeq=<%= swSeq %>&licKey=<%= licKey %>&userNm="
					+encodeURIComponent(userNm), refresh);
		}
	}
	
	function setStatus() {
		var histSeq = $("input[name=histSeq]:checked").val();
		
		if(histSeq!=undefined) {
			$("#loadFunc").load("func/swKeyHistUpdate.jsp?histSeq="+histSeq, refresh);
		} else {
			alert("�Ϸ� ó���� �׸��� �������ּ���.");
		}
	}
	
	function chkOverMax() {
		return <%= result.getAllowCnt() %> <= <%= results.size() %>;
	}
</script>
<body>
<div class="modal-dialog">
	<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<h4 id="modal-title" class="modal-title text-left">�����Ȳ</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		<div class="modal-body">
			<div class="form-group text-right">
				<button onclick="addItem()" class="btn btn-primary btn-blue">
					�߰�
				</button>
				<button onclick="setStatus()" class="btn btn-primary btn-blue">
					��� �Ϸ�
				</button>
			</div>
			<table class="table">
				<tr>
					<th></th>
					<th>�����</th>
					<th>��������</th>
				</tr>	
				<%
					if(results.size()==0){
					%>
						<tr>
							<td colspan="3">�����Ͱ� �����ϴ�.</td>
						</tr>
					<%
					}
					else {
						for(SoftwareKeyHistVO swItem : results) {
						%>
						<tr>
							<td><input type="radio" name="histSeq" value="<%= swItem.getHistSeq() %>"></td>
							<td><%= swItem.getUserNm() %></td>
							<td><%= swItem.getUseStrtDt() %></td>
						</tr>
						<%
						}
					}
				%>				
			</table>
		</div>
	</div>
</div>
<div id="loadFunc"></div>
</body>
</html>