<%@page import="shop.jamielee.EmpDao"%>
<%@page import="shop.jamielee.EmpVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 사용자의 요청 정보를 DAO에 전달한 후 그 결과를 다시 사용자에게 반환 

	// request: 사용자의 요청 정보가 들어 있는 객체 
	String findString = request.getParameter("findString"); 

	EmpDao empDao = new EmpDao();
	List<EmpVo> list = empDao.search(findString);
	StringBuilder sb = new StringBuilder();
	
	String fmt = "<div class='emp'>"
				+ "<div>사번: %d</div>"
				+ "<div>성명: %s</div>"
				+ "<div>이메일: %s</div>"
				+ "<div>연락처: %s</div>"
				+ "<div>급여: %10.1f</div>"
				+ "</div>";
				
	for(EmpVo ev : list) {
		String str = String.format(fmt,
				ev.getEmployee_id(),
				ev.getFirst_name(),
				ev.getEmail(), 
				ev.getPhone_number(),
				ev.getSalary());
		
		sb.append(str); // 선택된 요소(sb)의 마지막에 새로운 요소나 컨텐츠 추가 
	}
	
	out.print(sb.toString());
%>

