<%@ page import = "shop.jamielee.AutoComplete" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동완성</title>
<link rel='stylesheet' type='text/css'
	href='http://code.jquery.com/ui/1.12.1/themes/pepper-grinder/jquery-ui.css' />
<script src='http://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
</head>
<body>

<%
	AutoComplete autoComplete = new AutoComplete();
	String data = autoComplete.getData();
%>
<div id="autocomplete">
	<label>성명을 입력하세요</label>
	<input type="text" name="find_string" id="find_string"/>
	<input type="button" value="검색" id="button_find"/>
</div>

<script>
var data = <%= data %>

$("#find_string").autocomplete({
	source : data
});

</script>
</body>
</html>