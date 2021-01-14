<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Effect</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
	
<style>

	#parent {
		height: 210px;
		
	}
	#target > #image {
		width: 50%;
		height: 50%;
	
	}

</style>
</head>
<body>
	<div id="effect">
	<div id="parent">
		<div id="target">
			<img src="https://i.pinimg.com/originals/68/94/93/6894931eb3e93f6d6ef2dd000d8acdc6.jpg" id="image">
		</div>
	</div>
		
		<div id="buttons">
			<input type="button" value="SHOW" id="btnShow"/>
			<input type="button" value="HIDE" id="btnHide"/>
			<input type="button" value="TOGGLE" id="btnToggle"/>
			<input type="button" value="SLIDE DOWN" id="btnSlideDown"/>
			<input type="button" value="SLIDE UP" id="btnSlideUp"/>
			<input type="button" value="SLIDE TOGGLE" id="btnSlideToggle"/>
			<input type="button" value="FADE IN" id="btnFadeIn"/>
			<input type="button" value="FADE OUT" id="btnFadeOut"/>
			<input type="button" value="ANIMATION" id="btnAnimation"/>
		
		</div>
	
	</div>
	
	<script>
	$("#btnShow").on("click", function(){
		$("#target>#image").show(2000)
	
	})
	
	$("#btnHide").on("click", function(){
		$("#target>#image").hide(2000)
	
	})
	
	$("#btnToggle").on("click", function(){
		$("#target>#image").toggle(1000)
	
	})
	
	$("#btnSlideDown").on("click", function(){
		$("#target>#image").slideDown(700)
		
	})
	
	$("#btnSlideUp").on("click", function(){
		$("#target>#image").slideUp(700)	
	
	})
	
	$("#btnSlideToggle").on("click", function(){
		$("#target>#image").slideToggle(2000)	
	
	
	})
	
	$("#btnFadeIn").on("click", function(){
		$("#target>#image").fadeIn(1500)	
	
	})
	
	$("#btnFadeOut").on("click", function(){
		$("#target>#image").fadeOut(2000)
	})
	
	
	// map구조 
	$("#btnAnimation").on("click", function(){
		$("#target>#image").animate({
			"width" : "toggle",
			"opacity" : "toggle"
		
		})
		
	})
	
	</script>
</body>
</html>