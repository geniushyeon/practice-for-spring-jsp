<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scope_check</title>
</head>
<body>
<div id="scope-check">
	<h3>Scope Area Message</h3>
	<ul>
		<li>application: <%=application.getAttribute("message") %></li><!-- 세미콜론 검지 -->
		<li>session: <%= session.getAttribute("message") %></li>
		<li>request: <%=request.getAttribute("message") %></li>
		<li>pageContext: <%=pageContext.getAttribute("message") %></li>
	</ul>
	
</div>
</body>
</html>