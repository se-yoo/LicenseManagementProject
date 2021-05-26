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
<script>
function fn_delete(swSeq) {
	if(confirm("���� �����Ͻðڽ��ϱ�?\n(���̼��� Ű, �����Ȳ, �뿩��� �� ���� �����͵� ��� �����˴ϴ�.)")) {
		location.href="func/swDelete.jsp?swSeq="+swSeq;
	}
}

function fn_statusView(swSeq,licKey) {
	$("#modal").load("modal/swKeyHistListNowModal.jsp?swSeq="+swSeq+"&licKey="+licKey,function(){
		$("#modal").modal();
	});	
}

function fn_histView(swSeq,licKey) {
	$("#modal").load("modal/swKeyHistListAllModal.jsp?swSeq="+swSeq+"&licKey="+licKey,function(){
		$("#modal").modal();
	});	
}
</script>
</head>
<body>
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
<div>
	SW��: <%= result.getSwNm() %><br>
	������: <%= result.getMnfNm() %><br>
	����: <%= result.getSwVer() %><br>
	����: <%= result.getSwEa() %><br>
	�����: <%= result.getRgstId() %><br>
	�����: <%= result.getRgstDt() %><br>
	<a href="update.jsp?swSeq=<%= result.getSwSeq() %>">
		<button>����</button>
	</a>
	
	<button onclick="fn_delete(<%= result.getSwSeq() %>)">����</button>
	
	<a href="main.jsp">
		<button>���</button>
	</a>
</div>
<div>
	<table>
		<tr>
			<td>���̼��� Ű</td>
			<td>����ο�</td>
			<td>�����Ȳ</td>
			<td>�뿩���</td>
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
			for(SoftwareKeyVO swKeyItem : subResults) {
			%>
			<tr>
				<td><%= swKeyItem.getLicKey() %></td>
				<td><%= swKeyItem.getAllowCnt() %></td>
				<td>
					<button onclick="fn_statusView(<%= result.getSwSeq() %>, '<%= swKeyItem.getLicKey() %>')">
						�����Ȳ
					</button>
				</td>
				<td>
					<button onclick="fn_histView(<%= result.getSwSeq() %>, '<%= swKeyItem.getLicKey() %>')">
						�뿩���
					</button>
				</td>
			</tr>
			<%
			}
		}
	%>
	</table>
</div>
<div class="modal fade" id="modal" role="dialog"></div>
</body>
</html>