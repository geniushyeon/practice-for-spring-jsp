<%@page import="shop.jamielee.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// database에 존재 유무
	
	MemberDao memberDao = new MemberDao();
	boolean b = memberDao.signin(id, password);
	
	if(b) {
	session.setAttribute("id", id);
	response.sendRedirect("../index.jsp");
	
	} else {
		// 로그인 실패 
		out.println("<script>alert('failed')");
		out.println("location.href='../index.jsp'</script>");
		// print로 쓰면 안됨(println으로 쓸것)
		
	}

%>