<%@page import="java.util.Optional"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지옥의 세팅전</title>
</head>
<body>
	<%-- 
	<%
	final Date date = new Date();
	final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss(E)");
	%> --%>
	<%!private static String printDate() {
		final Date date = new Date();
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss(E)");
		sdf.format(date);
		return sdf.format(date);
	}%>

	<%!
	private long factorial(long n) {
		long result = 1;
		while (n >= 1) {
			result *= n--;
		}
		return result;
	}%>

	<%
		String nValue = request.getParameter("n");
		String n = Optional.ofNullable(nValue).orElse("1");
		long result = factorial(Long.valueOf(n));
	%>
	<h1>._.</h1>
	<p>
		현재 시간:
		<%=printDate()%><!-- 값을 평가할 때는 = 들어감 -->
		결과: <%= result %>
</body>
</html>