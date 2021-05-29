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
			alert("허용 인원을 초과했습니다.");
			return;
		}
		
		var userNm = prompt("사용자 이름을 입력해주세요");
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
			alert("완료 처리할 항목을 선택해주세요.");
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
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 id="modal-title" class="modal-title">사용현황</h4>
		</div>
		<div class="modal-body">
			<div>
				<button onclick="addItem()">
					추가
				</button>
				<button onclick="setStatus()">
					사용 완료
				</button>
			</div>
			<table class="table">
				<tr>
					<th></th>
					<th>사용자</th>
					<th>사용시작일</th>
				</tr>	
				<%
					if(results.size()==0){
					%>
						<tr>
							<td colspan="3">데이터가 없습니다.</td>
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