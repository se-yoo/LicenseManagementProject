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
			alert("수정할 항목을 선택해주세요.");
		}
	});
	
	$("#delete-btn").click(function(){
		if(confirm("정말 삭제하시겠습니까?\n(사용현황, 대여기록 등 하위 데이터도 모두 삭제됩니다.)")) {
			var selectIdx = $("input[name=licKey]:checked").val();
			
			if(selectIdx!=undefined) {
				var swSeq = "<%= result.getSwSeq() %>";
				var rowId = "#key-list-row-"+selectIdx;
				
				location.href="func/swKeyDelete.jsp?swSeq="+swSeq+"&licKey="+$(rowId+" .licKey").text();
			} else {
				alert("삭제할 항목을 선택해주세요.");
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
		SW명: <input type="text" name="swNm" value="<%= result.getSwNm() %>" required><br>
		제조사: <input type="text" name="mnfNm" value="<%= result.getMnfNm() %>" required><br>
		버전: <input type="text" name="swVer" value="<%= result.getSwVer() %>" required><br>
		수량: <input type="number" name="swEa" value="<%= result.getSwEa() %>" ><br>
		<input type="submit" value="수정">
	</form>
	<a href="retrieve.jsp?swSeq=<%= result.getSwSeq() %>">
		<button>취소</button>
	</a>
</div>
<div>
	<button id="create-btn">등록</button>
	<button id="update-btn">수정</button>
	<button id="delete-btn">삭제</button>
	<table>
		<tr>
			<td></td>
			<td>라이선스 키</td>
			<td>허용인원</td>
		</tr>
	<%
		if(subResults.size()==0){
			%>
			<tr>
				<td colspan="4">등록된 라이선스 키가 없습니다.</td>
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