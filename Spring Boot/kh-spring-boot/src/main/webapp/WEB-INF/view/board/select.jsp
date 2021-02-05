<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="board">
	<h2>mybatis test</h2>
	<c:forEach var="vo" items="${list }">
		<div>${vo.id }</div>
		<div>${vo.subject }</div>
	</c:forEach>
</div>
</body>
</html>