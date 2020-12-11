<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attribute</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<style>
	#target {
		border: 1px solid #aaa;
		width: 400px;
		height: 200px;
	}
	
	.a_type {
		background-color: #00f;
		color: #fff;
	}
	
	.a_type>h1 {
		color: #fff;
		font-family: D2Coding
	}
	
	.b_type {
		background-color: #f99;
		color: #ff0;
	}
	
	.b_type>h1 {
		color: #ff0;
		font-family: D2Coding;
	}
	
	
</style>
</head>
<body>

	<div id='attribute'>
		<div id='target' class='target'>
			<h1>Hello jQuery Attribute!</h1>

		</div>

		<div id='buttons'>
			<input type="button" value="A Type" id="btnAtype" /> 
			<input type="button" value="B Type" id="btnBtype" />
			<input type="button" value="Default" id="btnDefault" />
		</div>
	</div>

	<script>
	var target = $("#target"); // 전역 변수 
	
	$('#btnAtype')[0].onclick = function() {
		$(target).attr('class', 'a_type');
	
	}
	
	$('#btnBtype')[0].onclick = function() {
		$(target).attr('class', 'b_type');
	
	}

	$('#btnDefault')[0].onclick = function() {
		$(target).removeAttr('class', '');
		
	}
</script>
</body>
</html>