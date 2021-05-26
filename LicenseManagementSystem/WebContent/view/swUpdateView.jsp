<%@page import="java.util.ArrayList"%>
<%@page import="service.SoftwareKeyVO"%>
<%@page import="java.util.List"%>
<%@page import="service.SQLMgt"%>
<%@page import="service.SoftwareVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%
	String swSeq = request.getParameter("swSeq");
	SoftwareVO result = new SoftwareVO();
	List<SoftwareKeyVO> subResults = new ArrayList<>();
	
	try{
		
		SQLMgt sqlMgt = new SQLMgt();
		SoftwareVO software = new SoftwareVO();
		
		software.setSwSeq(swSeq);
		
		result = sqlMgt.getSoftware(software);
		subResults = sqlMgt.getSoftwareKeyList(software);
	}catch(Exception e){
		out.println(e.toString());
	}
%>
<script>
$(document).ready(function(){
	$("#create-btn").click(function(){
		$("#modal").load("modal/swKeyCreateModal.jsp",function(){
			$("#modal input[name=swSeq]").val(<%= result.getSwSeq() %>);
			$("#modal").modal();
		});	
	});
	
	$("#update-btn").click(function(){
		var selectIdx = $("input[name=licKey]:checked").val();
		
		if(selectIdx!=undefined) {
			var rowId = "#key-list-row-"+selectIdx;
			$("#modal").load("modal/swKeyUpdateModal.jsp", function(){
				$("#modal input[name=swSeq]").val(<%= result.getSwSeq() %>);
				$("#modal #licKey").val($(rowId+" .licKey").text());
				$("#modal #allowCnt").val($(rowId+" .allowCnt").text());
				$("#modal").modal();
			});
		}
		else {
			alert("������ �׸��� �������ּ���.");
		}
	});
	
	$("#delete-btn").click(function(){
		if(confirm("���� �����Ͻðڽ��ϱ�?\n(�����Ȳ, �뿩��� �� ���� �����͵� ��� �����˴ϴ�.)")) {
			var selectIdx = $("input[name=licKey]:checked").val();
			
			if(selectIdx!=undefined) {
				var swSeq = "<%= result.getSwSeq() %>";
				var rowId = "#key-list-row-"+selectIdx;
				
				location.href="func/swKeyDelete.jsp?swSeq="+swSeq+"&licKey="+$(rowId+" .licKey").text();
			} else {
				alert("������ �׸��� �������ּ���.");
			}
		}
	});
});
</script>
</head>
<body>
<div>
	<form action="func/swUpdate.jsp" method="POST">
		<input type="hidden" name="swSeq" value="<%= result.getSwSeq() %>">
		SW��: <input type="text" name="swNm" value="<%= result.getSwNm() %>" required><br>
		������: <input type="text" name="mnfNm" value="<%= result.getMnfNm() %>" required><br>
		����: <input type="text" name="swVer" value="<%= result.getSwVer() %>" required><br>
		����: <input type="number" name="swEa" value="<%= result.getSwEa() %>" ><br>
		<input type="submit" value="����">
	</form>
	<a href="retrieve.jsp?swSeq=<%= result.getSwSeq() %>">
		<button>���</button>
	</a>
</div>
<div>
	<button id="create-btn">���</button>
	<button id="update-btn">����</button>
	<button id="delete-btn">����</button>
	<table>
		<tr>
			<td></td>
			<td>���̼��� Ű</td>
			<td>����ο�</td>
		</tr>
	<%
		if(subResults.size()==0){
			%>
			<tr>
				<td colspan="4">��ϵ� ���̼��� Ű�� �����ϴ�.</td>
			</tr>
			<%
		}
		else {
			int idx = 0;
			for(SoftwareKeyVO swKeyItem : subResults) {
				%>
				<tr id="key-list-row-<%= idx %>">
					<td>
						<input type="radio" name="licKey" value="<%= idx %>">
					</td>
					<td class="licKey"><%= swKeyItem.getLicKey() %></td>
					<td class="allowCnt"><%= swKeyItem.getAllowCnt() %></td>
				</tr>
				<%
				idx++;
			}
		}
	%>
	</table>
</div>
<div class="modal fade" id="modal" role="dialog"></div>
</body>
</html>