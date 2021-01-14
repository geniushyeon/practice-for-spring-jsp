<%@page import="shop.jamielee.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "memberDao" class="shop.jamielee.MemberDao"/>
<jsp:useBean id = "memberVo" class="shop.jamielee.MemberVo"/>
<!-- memberVo 객체가 가지고 있는 모든 setter를 사용하여 값을 대입 -->
<jsp:setProperty property="*" name="memberVo"/>
<%
	// database에 존재 유무
	
	boolean b = memberDao.signin(memberVo.getId(), memberVo.getPassword());
	
	if(b) {
	session.setAttribute("id", memberVo.getId());
	response.sendRedirect("../index.jsp");
	
	} else {
		// 로그인 실패 
		out.println("<script>alert('failed')");
		out.println("location.href='../index.jsp'</script>");
		// print로 쓰면 안됨(println으로 쓸것)
		
	}

%>