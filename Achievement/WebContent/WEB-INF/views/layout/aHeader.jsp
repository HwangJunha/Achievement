<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<link rel="stylesheet" href="/resources/css/mainPage.css">
<script type="text/javascript" src="/resources/js/mainPage.js"></script>


</head>
<body>
<header>
	<div class="left">
		<a href = "/admin">
			<img src="/resources/img/AchievementWhite.png" width="250" height="100"
		alt="Achievement"  title="Achievement"> </a>
	</div>
	
	<div class="right">
	<ul class="hdropdown">
		<li>
			<a href="#" class="fa fa-user fa-3x"></a>
			<%if(session.getAttribute("login")==null || !(boolean)session.getAttribute("login")){ %>
			<!-- 비로그인 상태 -->
			<ul>
				<li><a href="/member/login">로그인</a></li>
			</ul>
			<%}else if((boolean)session.getAttribute("login")&& "M".equals((String)session.getAttribute("u_grade"))) {%>
				<ul>
					<li><a href="/member/logout">로그아웃</a></li>
				</ul>
			<%} %>
		</li>
	</ul>
	</div>
	<div class="center">
		<form action="#" method="get">
			<input type="text" id="search" name="search" />
				<button class="startBtn"><i class="fas fa-search"></i></button>
		</form>
	</div>
	
</header>