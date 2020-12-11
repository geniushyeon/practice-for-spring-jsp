<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accordion</title>
<link rel='stylesheet' type='text/css'
	href='http://code.jquery.com/ui/1.12.1/themes/pepper-grinder/jquery-ui.css' />
<script src='http://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
</head>
<body>

	<div id="accordion">
		<h2>Java</h2>
		<div>
			<ul>
				<li>어쩌구저쩌구</li>

			</ul>
		</div>
		<h2>Spring</h2>
		<img
			src="https://i.pinimg.com/originals/68/94/93/6894931eb3e93f6d6ef2dd000d8acdc6.jpg"
			id="image">
		<h2>Oracle</h2>
	</div>

	<script>
		$("#accordion").accordion();
	</script>
</body>
</html>