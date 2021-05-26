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
	if(confirm("정말 삭제하시겠습니까?\n(라이선스 키, 사용현황, 대여기록 등 하위 데이터도 모두 삭제됩니다.)")) {
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
	SW명: <%= result.getSwNm() %><br>
	제조사: <%= result.getMnfNm() %><br>
	버전: <%= result.getSwVer() %><br>
	수량: <%= result.getSwEa() %><br>
	등록자: <%= result.getRgstId() %><br>
	등록일: <%= result.getRgstDt() %><br>
	<a href="update.jsp?swSeq=<%= result.getSwSeq() %>">
		<button>수정</button>
	</a>
	
	<button onclick="fn_delete(<%= result.getSwSeq() %>)">삭제</button>
	
	<a href="main.jsp">
		<button>목록</button>
	</a>
</div>
<div>
	<table>
		<tr>
			<td>라이선스 키</td>
			<td>허용인원</td>
			<td>사용현황</td>
			<td>대여기록</td>
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
			for(SoftwareKeyVO swKeyItem : subResults) {
			%>
			<tr>
				<td><%= swKeyItem.getLicKey() %></td>
				<td><%= swKeyItem.getAllowCnt() %></td>
				<td>
					<button onclick="fn_statusView(<%= result.getSwSeq() %>, '<%= swKeyItem.getLicKey() %>')">
						사용현황
					</button>
				</td>
				<td>
					<button onclick="fn_histView(<%= result.getSwSeq() %>, '<%= swKeyItem.getLicKey() %>')">
						대여기록
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