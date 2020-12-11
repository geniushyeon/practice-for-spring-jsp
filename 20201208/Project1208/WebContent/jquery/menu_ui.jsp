<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu_ui</title>
<link rel='stylesheet' type='text/css'
	href='http://code.jquery.com/ui/1.12.1/themes/pepper-grinder/jquery-ui.css' />
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src='http://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>

<style>
	#menu {
		width: 150px;
	}

</style>
</head>
<body>
<div id="menu_ui">
	<ul id="menu">
		<li><a href="#" class="ui-state-disabled">강아지</a></li>
		<!-- ui-state-disabled : 메뉴 비활성화 -->
		<li><a href="#">고양이</a></li>
		<li>
			<a href="#">햄스터</a>
			<ul>
				<li><a href="#">드워프</a></li>
				<li><a href="#">윈터화이트</a></li>
				<li><a href="#">시리아</a></li>
			</ul>
		</li>
	</ul>
</div>
<script>
$("#menu").menu();

</script>
</body>
</html>