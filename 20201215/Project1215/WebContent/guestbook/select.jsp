<%@page import="shop.jamielee.guestbook.GuestbookVo"%>
<%@page import="shop.jamielee.guestbook.GuestbookDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/guestbook.css" type="text/css">
<title>방명록</title>
</head>
<body>
<jsp:useBean id="memberDao" class="shop.jamielee.guestbook.GuestbookDao"></jsp:useBean>
	<div id="guestbook">
		<h2>방명록</h2>
		<!-- 검색바 -->
		<form name="form_guestbook" id="form_guestbook" method="POST">
			<input type="search" name="findStr" size="30" placeholder="작성자나 내용으로 검색" value="${param.findStr }"/> 
			<input type="submit" value="검색" id="btnFind" />
		</form>
		<%
			String findStr = "";
			if(request.getParameter("findStr") != null) {
				findStr = request.getParameter("findStr");
			}
			List<GuestbookVo> list = memberDao.select(findStr);
			
			request.setAttribute("list", list);
			
		%>
		<!-- 방명록 list -->
		<div id="list">
		<c:forEach var="memberVo" items="${list }">  
			<div id="item">
				<label>작성자</label>
				<output class="mid">${memberVo.id }</output>
				<label>작성일자</label>
				<output class="mdate">${memberVo.mdate }</output>
				<br />
				<textarea rows="5" cols="80">${memberVo.document }</textarea>
				<br />
				<div class="btns">
					<input type="button" value="수정" id="btnUpdate" /> 
					<input	type="button" value="삭제" id="btnDelete" />
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>