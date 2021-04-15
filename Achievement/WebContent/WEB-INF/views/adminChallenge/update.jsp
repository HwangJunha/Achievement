<%@page import="java.util.Map"%>
<%@page import="dto.Challenge"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/aHeader.jsp" %>
<%@ include file="/WEB-INF/views/layout/aNavigation.jsp" %>
<%
List<String> cycle = (List<String>)request.getAttribute("cycle");
List<String> category = (List<String>)request.getAttribute("category");
String name = (String)request.getAttribute("name");
Challenge updateChallenge = (Challenge)request.getAttribute("updateChallenge"); //update 객체
Map<String, String> result= (Map<String, String>)request.getAttribute("result");
%>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript"
src ="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
function submitContents(elClickedObj){
	//에디터의 내용을 #content에 반영한다
	oEditors.getById["ch_way"].exec("UPDATE_CONTENTS_FIELD",[]);
	
	try{
		//<form>태그의 submit수행
		elClickedObj.form.submit();
	}catch(e){
		
	}
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	
	//background
	$('#challenge').css({"background":"#EC9A29"})
	//CSS 조정
	$('nav').css({"margin":"40px auto"})
		
	
	//작성버튼 동작
	$("#btnUpdate").click(function() {
		
		//스마트 에디터의 내용을 <textarea>에 적용하는 함수를 호출한다
		submitContents($("#btnUpdate"))
		//<form> submit
		$("form").submit();
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	
	//이미지 미리보기
	$('#file').change(function(){
	    setImageFromFile(this, '#preview');
	});
	
});

//미리 보기
function setImageFromFile(input, expression) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(expression).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

</script>

<style type="text/css">
#ch_way {
	width: 88%;
}
</style>

<div class="container">

<h3>챌린지 등록</h3>
<hr>

<div>
<form action="/admin/challenge/update" method="post" enctype="multipart/form-data">
<input type="hidden" name = "ch_no" value="<%=updateChallenge.getChNo() %>"/>
<input type="hidden" name = "ch_stored_name" value="<%=updateChallenge.getChStoredName() %>"/>
<input type="hidden" name = "ch_origin_name" value="<%=updateChallenge.getChOriginName() %>"/>
<table class="table table-responsive text-center">
		
		<tr><td colspan="2"><label for="file"><%--더미 데이터와 구분하기 위하여 --%>
		<%if(updateChallenge.getChStoredName().contains("저장")){ %> 
			<img src="/resources/img/challenge.png" id="preview" width="400" height="250"/>
		<%}else{ %>
			<img src="/upload/<%=updateChallenge.getChStoredName() %>" id="preview" width="400" height="250"/>
		<%} %>
		</label>
			<input type="file" accept="image/*" id="file" name="file" accept="image/*" style="width:100%; display: none;"/>
		</td></tr>
		
		<tr><td>제목</td><td><input type="text" name="ch_title" style="width:100%" value="<%=updateChallenge.getChTitle()%>"/></td></tr>
		<tr><td>카테고리</td><td>
		<select style="width:100%" id="ch_category" name="ch_category">
			<%for(int i=0; i<category.size(); i++){ %>
				<%--현재값과 일치헀을때 --%>
				<%if(category.get(i).equals(result.get("category"))){ %> 
					<option selected value="<%=category.get(i)%>"><%=category.get(i)%></option>
				<%}else{ %>
					<option value="<%=category.get(i)%>"><%=category.get(i)%></option>	
				<%} %>
			<%} %>
		</select>
		</td></tr>
		<tr><td>내용</td><td><input type="text" name="ch_content" style="width:100%"  value="<%=updateChallenge.getChContent()%>"/></td></tr>
		<tr><td>참가비</td><td><input type="number" name="ch_money" style="width:100%"value="<%=updateChallenge.getChMoney()%>"/></td></tr>
		<tr><td>개설자</td><td class="text-left"><%=name %></td></tr>
		<tr><td>시작날짜</td><td><input type="date" name="ch_start_date" style="width:100%" value="<%=updateChallenge.getChStartDate()%>"/></td></tr>
		<tr><td>마감날짜</td><td><input type="date" name="ch_end_date" style="width:100%" value="<%=updateChallenge.getChEndDate()%>"/></td></tr>
		<tr><td >인증빈도</td><td>
		<select style="width:100%" id="ch_cycle" name="ch_cycle">
			<%for(int i=0; i<cycle.size(); i++){ %>
				<%if(cycle.get(i).equals(result.get("title"))){ %> 
					<option selected value="<%=cycle.get(i)%>"><%=cycle.get(i)%></option>
				<%}else{ %>
					<option value="<%=cycle.get(i)%>"><%=cycle.get(i)%></option>
				<%} %>
			<%} %>
		</select>
		</td></tr>
		<tr><td >인증 가능 시작 시간</td><td><input type="time" name="ch_start_time" style="width:100%" value="<%=updateChallenge.getChStartTime()%>"/></td></tr>
		<tr><td >인증 가능 끝나는 시간</td><td><input type="time" name="ch_end_time" style="width:100%" value="<%=updateChallenge.getChEndTime()%>"/></td></tr>
		<tr><td >인증 방법</td><td colspan="2"><textarea id="ch_way" name="ch_way" ><%=updateChallenge.getChWay() %></textarea></td></tr>
	</table>
</form>
</div>

<div class="text-center">	
	<button type="button" id="btnUpdate" class="btn btn-info">수정</button>
	<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>
</div>

<!-- .container -->
</div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ch_way", //에디터가 적용될<textarea>의 ID를 입력
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})

</script>


<%@ include file="/WEB-INF/views/layout/footer.jsp"%>