<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sortable</title>
<title>Insert title here</title>
<link rel='stylesheet' type='text/css'
   href='http://code.jquery.com/ui/1.12.1/themes/blitzer/jquery-ui.css'/>
<script src='http://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
	
<style>
	#sortItems {
		list-style: none;
	
	}
	
	#sortItems > li {
		width: 150px;
		height: 30px;
		border: 1px solid gray;
		text-align: center;
		line-height: 30px;
		background-color: olive;
	
	}
	
	#sortItems > li:hover {
		cursor: pointer;
	
	
	}
	
	

</style>
</head>
<body>
<div id="sortable">
	<ul id="sortItems">
		<li>HTML5</li>
		<li>CSS3</li>
		<li>Javascript</li>
		<li>Java</li>
		<li>JDBC</li>
		<li>jQuery</li>
		<li>AJAX</li>
		<li>MyBatis</li>
		<li>jsp</li>
		<li>Spring Boot</li>
		<li>Final Project</li>
	
	</ul>

</div>

<script>
$("#sortItems").sortable();

</script>
</body>
</html>