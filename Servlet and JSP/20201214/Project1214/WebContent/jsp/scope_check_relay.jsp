<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scope_check_relay</title>
</head>
<body>
<%
	request.setAttribute("message", "오늘 회식 코로나로 취소됨...");
	RequestDispatcher dispatcher = request.getRequestDispatcher("scope_check.jsp");
	dispatcher.forward(request, response);
%>
</body>
</html>