<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<a href="test.do">Spring MVC Test</a>
	<a href="multiplication.do">구구단 출력하기</a>
	<a href="sum.do">두 수의 합</a>
	<a href="signup.mem">회원가입</a>
	<!-- <a href="member_info.mem">회원조회</a> -->
	<a href="#" onclick="member.select()">회원조회</a>
	<!-- member_info.mem?nowPage=100 -->

	<div id="result"></div>

	<h4 class="footer" style="text-align: center;">수 료 소 취</h4>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script src="./js/member.js"></script>

	<script>
		member()
	</script>
</body>
</html>