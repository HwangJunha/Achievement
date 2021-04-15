<%@page import="dto.Challenge"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Challenge> list = (List)request.getAttribute("challengeList"); %>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%@ include file="/WEB-INF/views/layout/aHeader.jsp" %>
<%@ include file="/WEB-INF/views/layout/aNavigation.jsp" %>
<style type="text/css">
.tableHeader{
	/* header정의 코드 */
 	text-align: center;
 	width: 900px;
 	margin: 0 auto;
 	padding: 15px;

}
#btnTitle{
	font-size:19px;
}

</style>
<script type="text/javascript">
$( document ).ready( function() {
	//background
	$('#challenge').css({"background":"#EC9A29"})
	//CSS 조정
	$('nav').css({"margin":"40px auto"})
	
})
</script>

<div class="container">
<div id="tableHeader">
	<div class="left" style="font-size:30px; font-weight:bold;">챌린지 목록 <a href="/admin/challenge/write"><i class="fas fa-plus"></i></a></div>
	<div><span>&nbsp</span></div>	
	<form action="/admin/challenge/list" method="get">
	<div class="right">제목:&nbsp;<input type="text" id="title" name="title" />
			<button id="btnTitle"><i class="fas fa-search"></i></button>
			
	</div>
	</form>
	<div><span>&nbsp</span></div>
	<div><hr></div>
</div>


<table class="table table-striped table-hover table-condensed text-center">
<tr>
	<th style="width: 10%; text-align:center;">챌린지번호</th>
	<th style="width: 45%; text-align:center;">제목</th>
	<th style="width: 20%; text-align:center;">시작날짜</th>
	<th style="width: 10%; text-align:center;">끝나는 날짜</th>
	<th style="width: 10%; text-align:center;">참가비</th>
	<th style="width: 5%; text-align:center;">좋아요</th>
</tr>
<%	for(int i=0; i<list.size(); i++) { %>
<tr>
	<td><%=list.get(i).getChNo() %></td>
	<td>
		<a href="/admin/challenge/view?chNo=<%=list.get(i).getChNo() %>">
		<%=list.get(i).getChTitle() %>
		</a>
	</td>
	<td><%=list.get(i).getChStartDate() %></td>
	<td><%=list.get(i).getChEndDate() %></td>
	<td><%=list.get(i).getChMoney() %>원</td>
	<td><%=list.get(i).getChLikes() %></td>
	
</tr>
<%	} %>
</table>


</div>
<%if(session.getAttribute("ch_admin_title")==null) {%> <%--일반적인 페이징 --%> 
<%@ include file="/WEB-INF/views/layout/paging.jsp" %>
<%}else{ %> <%-- title이 존재 했을시 페이징--%>
<%@ include file="/WEB-INF/views/adminChallenge/adminChallengePaging.jsp" %>
<%} %>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>