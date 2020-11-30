<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 연습(CDN)</title>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script> -->
<script src='./lib/jquery-3.5.1.min.js'></script> <!-- 상대 경로 -->
</head>
<body>
<h1 id="header">a tag for jQuery test</h1>

<%
out.print("hi jQuery!");

%>
<ul>
	<li><a href="index.jsp?inc=./jquery/filter.jsp">Filter</a></li>
	<li><a href="index.jsp?inc=./jquery/traverse.jsp">Traverse</a></li>
</ul>


<script>
$('#header').css('color', '#00f')
</script>
</body>
</html>