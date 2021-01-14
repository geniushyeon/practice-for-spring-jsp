<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
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
	List<String> sb = new ArrayList<String>();
	
	
	// [{'id' : '%d', 'name' : '%s', 'email' : '%s', 'phone' : '%s', 'salary' : '%f'}, {}]
	String fmt = "{"
				+ "'id' : '%d', "
				+ "'name' : '%s', "
				+ "'email' : '%s', "
				+ "'phonenumber' : '%s', "
				+ "'salary': '%10.1f'"
				+ "}";
				
	for(EmpVo ev : list) {
		String str = String.format(fmt,
				ev.getEmployee_id(),
				ev.getFirst_name(),
				ev.getEmail(), 
				ev.getPhone_number(),
				ev.getSalary());
		
		str = str.replaceAll("'", "\"");
		sb.add(str); // 선택된 요소(sb)의 마지막에 새로운 요소나 컨텐츠 추가 
	}
	
	out.print(Arrays.toString(sb.toArray()));
%>

