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
function fn_statusView(swSeq,licKey) {
	$("#modal").load("modal/swKeyHistListNowModal.jsp?swSeq="+swSeq+"&licKey="+licKey,function(){
		$("#modal").modal();
	});	
}

function fn_histView(swSeq,licKey,srchUserNm) {
	var url = "modal/swKeyHistListAllModal.jsp?swSeq="+swSeq+"&licKey="+licKey;
	if(srchUserNm) url += "&srchUserNm="+encodeURIComponent(srchUserNm);
	
	$("#modal").load(url,function(){
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
<div class="form-horizontal fs-16 pb-3">
	<div class="form-group">
	  <label for="swNm" class="col-sm-1 control-label">SW명</label>
	  <div class="col-sm-5">
	    <p class="form-control-static"><%= result.getSwNm() %></p>
	  </div>
	  <label for="mnfNm" class="col-sm-1 control-label">수량</label>
	  <div class="col-sm-5">
	    <p class="form-control-static"><%= result.getSwEa() %></p>
	  </div>
	</div>
	<div class="form-group text-right">
		<a href="licUpdate.jsp?swSeq=<%= result.getSwSeq() %>" class="btn btn-primary btn-lg btn-blue mr-2">수정</a>
		<a href="licList.jsp" class="btn btn-default btn-lg">목록</a>
	</div>
</div>
<div class="pb-3 pt-3">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>라이선스 키</th>
				<th>허용인원</th>
				<th>사용현황</th>
				<th>대여기록</th>
			</tr>
		</thead>
		<tbody>
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
						<button class="btn btn-default" 
						onclick="fn_statusView(<%= result.getSwSeq() %>, '<%= swKeyItem.getLicKey() %>')">
							사용현황
						</button>
					</td>
					<td>
						<button class="btn btn-default" 
						onclick="fn_histView(<%= result.getSwSeq() %>, '<%= swKeyItem.getLicKey() %>')">
							대여기록
						</button>
					</td>
				</tr>
				<%
				}
			}
		%>
		</tbody>
	</table>
</div>
<div class="modal fade" id="modal" role="dialog"></div>
</body>
</html>