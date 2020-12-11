<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 서버에서 처리할 내용을 UI에서 분리
	String temp = request.getParameter("number");
	String message = ""; // 결과 메시지 
	int number = 0;
	if (temp != null && !temp.equals("")) {
		number = Integer.parseInt(temp);
		if (number % 2 == 0) {
			message = number + "는 짝수입니다.";
		} else {
			message = number + "는 홀수입니다.";
		}
	}
	// 2. 처리된 내용을 화면에 출력하는 로직 추가 
	out.print(message);
	
%>