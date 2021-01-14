<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./javascript/signInOut.js"></script>
</head>
<body>
<div id="signin">
	<%
	//	session.setAttribute("id", "lee");
	//	session.removeAttribute("id");
		if(session.getAttribute("id") == null) {
	%>

	<%-- before sign up --%>
	<form name="signinForm" method="POST" id="signinForm">
		<label for="memberId">아이디</label>
		<input type="text" id="id" name="id" value="kim"/>
		<br/>
		<label for="password">비밀번호</label>
		<input type="password" id="password" name="password" value="1111"/>
		<input type="button" id="btnSignIn" value="로그인"/> 
	</form>
	<br/>
	<a href="">아이디/비밀번호 찾기</a>
	
	<% } else { %>
	<%-- after sign up --%>
	<span>[<%= session.getAttribute("id") %>]님, 환영합니다.</span><br/>
	<input type="button" id="btnSignOut" value="로그아웃"/>
	<% } %>
</div>
<script>signInOut()</script>
</body>
</html>