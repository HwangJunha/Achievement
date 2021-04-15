<%@page import="dto.Challenge"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Challenge> list = (List)request.getAttribute("challengeList"); %>
<% String category = (String)request.getAttribute("ch_category"); %>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/navigation.jsp" %>
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
#chTitle{
	font-size:30px; 
	font-weight:bold;
}

.wrap {
	/* 내부 정렬 */
	
	/* 외부 정렬 */
	width: 900px;
	margin: 0 auto;
	
}
.wrap > div{
	/* 인라인블록 요소로 설정하기 */
	display: inline-block;
	height: 100px;
	padding: 10px;
	margin: 20px;
	width:400px;
}

.imgarr{
	text-align:center;
}
.imgarr > a{
	/* 글자색상 */
	color: #8C8C8C;
	/* 글자 꾸밈선 없애기(underline) */
	text-decoration: none;
	/* 글자 스타일 지정 */
	margin: 0 5px;
}


</style>
<script type="text/javascript">
$( document ).ready( function() {
	//background
	$('#challenge').css({"background":"#EC9A29"})
	//CSS 조정
	$('nav').css({"margin":"40px auto"})
	
	//header 조정
	$('header div').eq(1).css({"padding":"30px 20px"})
	$('header div').eq(2).css({"padding":"30px 20px"})
	
	//navigation 조정
	$('#nav_menu').addClass('fa-3x')
	$('.ndropdown').children().children().children().children().css({"width":"120px"})
	$('.ndropdown').children().css({"padding":"0 40px"})
	
})
</script>

<div class="container">
<div id="tableHeader">
	<div class="left" style="font-size:30px; font-weight:bold;">챌린지 목록 <a href="/user/challenge/write"><i class="fas fa-plus"></i></a></div>
	<div><span>&nbsp</span></div>	
	<form action="/user/challenge/list" method="get">
	<div class="right">제목:&nbsp;<input type="text" id="title" name="title" />
			<button id="btnTitle"><i class="fas fa-search"></i></button>
			
	</div>
	</form>
	<div><span>&nbsp</span></div>
	<div><hr></div>
</div>

<form>
	<div>
		<div id=chTitle class="text-center"><i class="far fa-thumbs-up"></i>&nbsp;&nbsp;<%if(category!=null) {%>
			<%=category %>
		<%} %>
		챌린지</div>
		
		<!-- <div class="right">
		<select name="list" >
	    	<option value="lately">최근순</option>
	    	<option value="like">좋아요</option>
	    	<option value="personnnel">참여인원</option>
	  	</select>
  		</div> -->
	</div>
</form>
<div class="wrap">
	<%for(int i=0; i<list.size(); i++){ %>
		<div class="imgarr"><a href="/user/challenge/view?chNo=<%=list.get(i).getChNo()%>">
		
		<%if(list.get(i).getChStoredName().contains("저장")){ %>
			<img src="/resources/img/challenge.png"  height="150"/>
		<%}else{ %>
			<img src="/upload/<%=list.get(i).getChStoredName()%>" height="150" />
		<%} %>
		<p><%=list.get(i).getChTitle() %></p>
		</a></div>
	<%} %>
</div>

</div>
<%if(session.getAttribute("ch_user_title")==null) {%> <%--일반적인 페이징 --%> 
<%@ include file="/WEB-INF/views/layout/paging.jsp" %>
<%}else{ %> <%-- title이 존재 했을시 페이징--%>
<%@ include file="/WEB-INF/views/userChallenge/userChallengePaging.jsp" %>
<%} %>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>