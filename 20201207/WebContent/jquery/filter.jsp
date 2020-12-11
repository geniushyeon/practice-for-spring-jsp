<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filter연습</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

</head>
<body>
	<div id="filter">
		<fieldset>
			<legend>filter</legend>
			<ul>
				<li>선택된 요소 중 필요한 요소만을 걸러내는 방법</li>
				<li>접두문자 ':'을 사용</li>
				<li>필터와 필터를 연결하여 사용 가능</li>
			</ul>
			</fieldset>
			
			<ol>
				<li>어쩌구</li>
				<li>저쩌구</li>
				<li>웅앵웅</li>
			</ol>
			
			<div id="items">
				<div>방가방가</div>
				<div>하이루</div>
			</div>
	</div>
	<script>
		$("#filter>ol>li:first").css("color", "#f00");
		$("#filter>ol>li:odd").css("font-weight", "bolder");
		$("#items>div:odd").css("background-color", "#00f");
		$("#items>div:even").css("background-color", "#0f0");
		
	</script>
</body>
</html>