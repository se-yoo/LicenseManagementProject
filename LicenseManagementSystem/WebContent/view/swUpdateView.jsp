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
<div class="pb-3 fs-16">
	<form action="func/swUpdate.jsp" method="POST" class="form-horizontal">
		<input type="hidden" name="swSeq" value="<%= result.getSwSeq() %>">
		<div class="form-group">
		  <label for="swNm" class="col-sm-1 control-label">SW��</label>
		  <div class="col-sm-5">
		    <input type="text" class="form-control" id="swNm" name="swNm" value="<%= result.getSwNm() %>" required>
		  </div>
		  <label for="mnfNm" class="col-sm-1 control-label">������</label>
		  <div class="col-sm-5">
		    <input type="text" class="form-control" id="mnfNm" name="mnfNm" value="<%= result.getMnfNm() %>" required>
		  </div>
		</div>
		<div class="form-group">
		  <label for="swVer" class="col-sm-1 control-label">����</label>
		  <div class="col-sm-5">
		    <input type="text" class="form-control" id="swVer" name="swVer" value="<%= result.getSwVer() %>" required>
		  </div>
		  <label for="swEa" class="col-sm-1 control-label">����</label>
		  <div class="col-sm-5">
		    <input type="text" class="form-control" id="swEa" name="swEa" value="<%= result.getSwEa() %>" required>
		  </div>
		</div>
		<div class="form-group text-right">
		    <button type="submit" class="btn btn-primary btn-lg btn-blue mr-2">����</button>
		    <a href="retrieve.jsp?swSeq=<%= result.getSwSeq() %>" class="btn btn-default btn-lg mr-4">���</a>
	  	</div>
	</form>
</div>
<div class="pb-3 pt-3">
	<div class="form-group text-right">
		<button id="create-btn" class="btn btn-primary btn-blue mr-2">���</button>
		<button id="update-btn" class="btn btn-primary btn-blue mr-2">����</button>
		<button id="delete-btn" class="btn btn-default mr-4">����</button>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th></th>
				<th>���̼��� Ű</th>
				<th>����ο�</th>
			</tr>
		</thead>
		<tbody>
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
		</tbody>
	</table>
</div>
<div class="modal fade" id="modal" role="dialog"></div>
</body>
</html>