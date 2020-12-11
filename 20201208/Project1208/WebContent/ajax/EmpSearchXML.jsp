<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="shop.jamielee.EmpVo"%>
<%@page import="java.util.List"%>
<%@page import="shop.jamielee.EmpDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //xml에서 주석 쓰는 법
//!-- root element(root node) -->%>
<%
	String findString = request.getParameter("findString");
	EmpDao empDao = new EmpDao();
	List<EmpVo> list = empDao.search(findString);

%>
<emps> 
	<%for(EmpVo ev: list) { %>
	<emp>
		<id><%=ev.getEmployee_id() %></id>
		<name><%=ev.getFirst_name() %></name>
		<email><%=ev.getEmail() %></email>
		<phonenumber><%=ev.getPhone_number() %></phonenumber>
		<salary><%=ev.getSalary()%></salary>
	</emp>
	<%} %>
</emps>