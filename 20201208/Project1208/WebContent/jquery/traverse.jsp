<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Traverse</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="traverse">
		<h1>Traverse</h1>
		<fieldset>
			<legend>traverse</legend>
			<ul id="ul">
				<li>traverse는 '.'을 찍어서 표현한다.</li>
				<li>명령어는 filter와 traverse가 매우 유사하거나 상충되기 때문에 개인적 취향에 따라 사용 빈도수가
					달라질 수 있다.</li>
				<li>밥먹으러가고싶다~!</li>
				<li>점심시간</li>
			</ul>
		</fieldset>

		<!-- .parent() 연습 -->
		<div id="div1">
			<input type="button" value="x" class="btn1" />
		</div>

		<div id="div2">
			<input type="button" value="x" class="btn2" />

		</div>
	</div>
	<script>
	$("#ul>li").first().css("color", "#f00");
	$("#ul>li").filter(":odd").css("color", "#00f");
	$("#ul>li").slice(1,3).css("font-family", "D2Coding");
	
	$("#div1").css({
		"width" : "100px",
		"height" : "100px"
	});
	
	
	$("#div2").css({
		"width" : "100px",
		"height" : "100px"
	});
	
	$("#div1>.btn1").css({
		"width": "40px",
		"height": "40px"
		
	});
	
	$("#div2>.btn2").css({
		"width": "30px",
		"height": "30px"
		
	});
	
	// btn1, btn2에 이벤트 처리 
	var btn1 = $(".btn1")[0]; // 클래스는 배열로 반환 

	btn1.onclick = function() {
		var parent = $(btn1).parent(); // btn1을 포함하고 있는 부모 태그 
		$(parent).css("background-color", "tomato");
		alert("멋쟁이 토마토!");
	}
	
	var btn2 = $(".btn2")[0];
	btn2.onclick = function() {
		var parent = $(btn2).parent().css("background-color", "beige");
		// $(this).parent().css("background-color", "beige");
		
	}
	</script>

</body>
</html>