<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인하세요!</title>
<style>
html, body {
	margin: 0;
}

.todo-box {
	width: 320px;
	background-color: #22cc88;
	box-sizing: border-box;
	padding: 20px;
}
</style>
</head>
<body>
	<%
	String test = (String) session.getAttribute("userid");
	
	// 로그인되어있는 상태 
	if (test != null) {
		response.sendRedirect("index.jsp");
		return;
	}
	
	
	final String method = request.getMethod();
	if ("post".equals(method.toLowerCase())) {
		final Map<String, String> userMap = new HashMap<>();
		userMap.put("jhlee", "kh12kh34");
		userMap.put("jamie", "1234");
		
		String userId = request.getParameter("userid");
		String password = request.getParameter("password");
		
		String result = userMap.get(userId);
		
		if (result == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		if (result.equals(password)) {
			session.setAttribute("userid", userId);
			response.sendRedirect("index.jsp");
			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	%>

	
	<div class="todo-box">
		<form action="login.jsp" method="POST">
			<label for="userid">아이디:</label>
			<input id="userid" name="userid"
				type="text" /> <br /> 
				<label for="password">패스워드:</label> 
				<input id="password" name="password" type="password" /> 
				<input type="submit" value="로그인" />
		</form>
	</div>
</body>
</html>