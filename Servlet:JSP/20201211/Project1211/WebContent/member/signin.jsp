<%@page import="shop.jamielee.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// database에 존재 유무
	// MemberDao, MemberVo
	
	MemberDao memberDao = new MemberDao();
	boolean b = memberDao.signin(id, password);
	
	if(b) {
	session.setAttribute("id", id);
	response.sendRedirect("../index.jsp");
	
	} else {
		
	}

%>