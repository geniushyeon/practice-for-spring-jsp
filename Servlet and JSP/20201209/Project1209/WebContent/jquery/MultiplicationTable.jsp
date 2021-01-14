<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 파라미터 dan을 전달받아 해당 구구단을 출력하는 코드 
	String temp = request.getParameter("dan");
	if (temp!=null && !temp.equals("")) {
		int dan = Integer.parseInt(temp);
		
		for(int i=1; i<10; i++) {
			out.print(dan + "*" + i + "=" + (dan*i) + "<br/>"); // \n으로는 인식 못함 
		}
	}

%>