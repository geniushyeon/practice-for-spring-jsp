<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	
	if(request.getMethod().equals("GET")) {
		String mid = request.getParameter("mid"); //name으로 가져옴 
		String sex = request.getParameter("sex");
		
		// 체크된 값이 여러 개일 때는 반환 값이 배열 
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		String[] attFile = request.getParameterValues("att-file");
		
		out.println("<li>아이디: " + mid + "</li>");
		out.println("<li>성별: " + sex + "</li>");
		out.println("<li>취미: " + Arrays.toString(hobby) + "</li>");
		out.println("<li>과목: " + Arrays.toString(subject) + "</li>");
		out.println("<li>첨부파일: " + Arrays.toString(attFile) + "</li>");
		out.print("<hr>");
	}
	
		Enumeration<String> enumeration = request.getParameterNames();
		
		while(enumeration.hasMoreElements()) {
			String name = enumeration.nextElement();
			out.print("<li>" + name);
		}
		out.print("<br/>");
		out.print("<hr>");
		
		Map<String, String[]> map = request.getParameterMap();
		Set<String> keySet = map.keySet();
		Iterator<String> iterator = keySet.iterator();
		
		while(iterator.hasNext()) {
			String key = iterator.next();
			String[] values = map.get(key);
			
			out.print("<li>" + key + ": " + Arrays.toString(values));
			
		}
		out.print("<hr>");
	
	%>
</body>
</html>