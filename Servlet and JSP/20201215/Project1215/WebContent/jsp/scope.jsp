<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scope</title>
</head>
<body>
<div id="scope">
	<h3>application | session | request | pageContext</h3>
	<%
		String message = "오늘 전체 회식입니다~ 메뉴는 소등갈비...";
		application.setAttribute("message", message); // 잘 안 씀
		session.setAttribute("message", message); // 로그인/로그아웃 - 개인별로 만들어짐, 페이지가 바뀌더라도 사라지지 않음 
		request.setAttribute("message", message); // <form>
		pageContext.setAttribute("message", message); // 잘 안 씀
		
		//session 영역의 유지시간 설정(5초)
		session.setMaxInactiveInterval(5);
	
	%>
	
	<a href="scope_check.jsp">scope message check</a>
	<form method="POST" action="scope_check_relay.jsp">
		<input type="submit"/>
	</form>
</div>
</body>
</html>