/**
 * 
 */
$( document ).ready( function() {
	//toggle 구현
	
	$( '#nav_div' ).click( function() {
		console.log('Menu 클릭')
		if($('#nav_menu').hasClass('fa-bars')){
			console.log('추가')
			$('#nav_menu').removeClass('fa-bars')
			$('#nav_menu').addClass('fa-times')
			
			console.log($('.ndropdown').children().next())
			
			//hover 이벤트 제거
			$('.ndropdown').children().next().unbind('mouseenter mouseleave'); 
			$('.ndropdown').children().next().children().children().css({"height":"30px", "font-size":"16px", "line-height":"30px", "transition":"all 0.5s ease-out"})
			
			
			
		}else{
			console.log('삭제')
			$('#nav_menu').removeClass('fa-times')
			$('#nav_menu').addClass('fa-bars')
			
			$('.ndropdown').children().next().children().children().css({"height":"0px", "font-size":"0px", "line-height":"0px" ,"transition":"all 0.5s ease-out"})
			
			
			$('.ndropdown').children().next().hover(function(){
				$(this).children().children().css({"height":"30px", "font-size":"16px", "line-height":"30px", "transition":"all 0.5s ease-out"})
			},function(){
				$(this).children().children().css({"height":"0px", "font-size":"0px", "line-height":"0px", "transition":"all 0.5s ease-out"})
			});
		}
	}) //end toggle
	
	
	
	var fbest=$( '#mainBest' ).click( function() {
		$('#mainBest').css({"background":"#EC9A29"})
		$('#mainBest').nextAll().css({"background":"#5D5D5D"})
		//요청 URL
		$.ajax({
			type: "get"
			, url: "/best/ajax"
			,data:{
				
			}
			,dataType:"html"
			,success: function(res){
				$("#resultAjax").html(res)
			}
			,error: function(res){
				console.log("AJAX 실패")	
			}
		})
	})//end mainBest
	
	fbest.click()
	
	$('#floatingBest').click(function(){
		fbest.click()
	})
	
	var fpopularity=$( '#mainPopularity' ).click( function() {
		$('#mainPopularity').css({"background":"#EC9A29"})
		$('#mainPopularity').prevAll().css({"background":"#5D5D5D"})
		$('#mainPopularity').nextAll().css({"background":"#5D5D5D"})
		
		$.ajax({
			type: "get"
			, url: "/popularity/ajax"
			,data:{
				
			}
			,dataType:"html"
			,success: function(res){
				$("#resultAjax").html(res)
			}
			,error: function(res){
				console.log("AJAX 실패")	
			}
		})
		
		
		
	}) //end mainPopularity
	
	$('#floatingPopularity').click(function(){
		fpopularity.click()
	})
	
	var fnew=$( '#mainNew' ).click( function() {
		
		$('#mainNew').css({"background":"#EC9A29"})
		$('#mainNew').prevAll().css({"background":"#5D5D5D"})
		$('#mainNew').nextAll().css({"background":"#5D5D5D"})
		
		$.ajax({
			type: "get"
			, url: "/new/ajax"
			,data:{
				
			}
			,dataType:"html"
			,success: function(res){
				$("#resultAjax").html(res)
			}
			,error: function(res){
				console.log("AJAX 실패")	
			}
		})
		
	}) // end mainNew
	
	$('#floatingNew').click(function(){
		fnew.click()
	})
		
	
	var fch=$( '#mainChallenge' ).click( function() {
		console.log('best')
		
		$('#mainChallenge').css({"background":"#EC9A29"})
		$('#mainChallenge').prevAll().css({"background":"#5D5D5D"})
		$.ajax({
			type: "get"
			, url: "/challenge/ajax"
			,data:{
				
			}
			,dataType:"html"
			,success: function(res){
				$("#resultAjax").html(res)
			}
			,error: function(res){
				console.log("AJAX 실패")	
			}
		})
		
		
	})//end mainChallenge
	$('#floatingChallenge').click(function(){
		fch.click()
	})
	
	
})