# 1. 외부 페이지 삽입
## 1.1. 동적 삽입
```jsp
<jsp: include page='F'/>
```
- 해당 위치에 `실행 결과`가 복사된다.
- page 속성에 파일명이나 변수를 사용할 수 있다.

## 1.2. 정적 삽입
```jsp
<%@ include file='F'%>
```
- 해당 위치에 `소스가 그대로` 복사된다.
- 파일명, 변수 사용 불가능

테스트<br/>
1. index.jsp에서 header와 footer 영역 제거
```jsp
<div id="index">
	<!-- header -->
	<section id="contents">
		<article class="content">
			<jsp:include page="<%=inc%>" />
			<!-- 동적 include -->
		</article>
		<aside class="aside">		
			<img src="http://placehold.it/150X100" />
			<div id="sub_menu">
	    		<jsp:include page="<%=sub%>" />
	    	</div>
		</aside>	
		</section>
		<!-- footer -->
	</div>
```
2. 같은 경로에 header.jsp와 footer.jsp 파일 생성 후 같은 변수 a 생성(어떻게 오류 나는지 보기)
- header.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="header">
	<nav id="nav">
		<ul>		
			<li><a href="index.jsp">Home</a></li>
			<li><a href="index.jsp?sub=./jquery/menu.jsp">menu</a></li>
			<li><a href="index.jsp?sub=./ajax/menu_ajax.jsp">ajax</a></li>
			<li><a href="index.jsp?sub=./mybatis/menu.jsp">mybatis</a></li>
					
			<li>방명록</li>
			<li>게시판</li>
			<li>회원관리</li>
		</ul>
	</nav>
</header>
<%
	int a = 10;
%>
```
- footer.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer id="footer">(주)융합S/W 개발</footer>
<%
	int a = 20;
%>
```
3. index.jsp의 header와 footer 영역에 정적 include
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<script src='./lib/jquery-3.5.1.min.js'></script>
<!-- 상대 경로 -->
</head>
<body>
	<%
	
	// inc
		String inc = "intro.jsp";
	if (request.getParameter("inc") != null) {
		inc = request.getParameter("inc");

	}
	
	// sub
	String sub = "./jquery/menu.jsp";
	if (request.getParameter("sub") != null) {
		sub = request.getParameter("sub");
	}
	
	%>

	<div id="index">
		<!-- header -->
		<%@ include file = "header.jsp" %>
		
		<section id="contents">
			<article class="content">
				<jsp:include page="<%=inc%>" />
				<!-- 동적 include -->
			</article>
			<aside class="aside">
			
				<img src="http://placehold.it/150X100" />
				<div id="sub_menu">
				<jsp:include page="<%=sub%>" />
			</div>
			</aside>
			
		</section>
		<!-- footer -->
		<%@ include file="footer.jsp" %> // 오류!
	</div>
```
header.jsp와 footer.jsp에 같은 변수 a가 선언되어 있고, 해당 변수는 지역형이기 때문에 같은 이름의 변수 선언 불가능.
- 둘 중 한 파일에서 변수 a를 제거하면 정상 작동

# 2. 로그인/로그아웃 구현하기(체험판)
## 2.1. DB에 member 테이블 만들고 테스트용 데이터 집어넣기
```sql
CREATE TABLE members(
	id VARCHAR2(20),
	password VARCHAR2(20),
	name VARCHAR2(20),
	email VARCHAR2(50),
	phonenumber VARCHAR2(20),
	zipcode VARCHAR2(5),
	address VARCHAR2(100)
);
INSERT INTO members VALUES('kim', '1111', '김재현', 'kim@java.co.kr', '010-1234-5678', '01234', '서울');
INSERT INTO members VALUES('lee', '2222', '이지현', 'lee@java.co.kr', '010-9876-5432', '12345', '대구');
INSERT INTO members VALUES('je', '3333', '제윤지', 'yoonji@java.co.kr', '010-3344-5566', '98765', '부산');
COMMIT;
```
결과
|id|password|name|email|phonenumber|zipcode|address|
|-|-|-|-|-|-|-|
|kim|1111|김재현|kim@java.co.kr|010-1234-5678|01234|서울|
|lee|2222|이지현|lee@java.co.kr|010-9876-5432|12345|대구|
|je|3333|제윤지|yoonji@java.co.kr|010-3344-5566|98765|부산|
## 2.2. signInOut.js
```javascript
/**
 * script for signin / signout
 * 
 */

var signInOut = function() {
	var btnSignIn = document.getElementById("btnSignIn");
	var btnSignOut = document.getElementById("btnSignOut");
	
	if(btnSignIn != null) {
		btnSignIn.onclick = function() {
			var form = document.signinForm;
			form.action = "./member/signin.jsp";
			form.submit();
		}
	}
	
	if(btnSignOut != null) {
		btnSignOut.onclick = function() {
			location.href = "./member/signout.jsp";
		}
	}
}
```
## 2.3. sign_in_out.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./javascript/signInOut.js"></script>
</head>
<body>
<div id="signin">
	<%
		if(session.getAttribute("id") == null) {
	%>

	<%-- before sign up --%>
	<form name="signinForm" method="POST" id="signinForm">
		<label for="memberId">아이디</label>
		<input type="text" id="id" name="id" value="kim"/>
		<br/>
		<label for="password">비밀번호</label>
		<input type="password" id="password" name="password" value="1111"/>
		<input type="button" id="btnSignIn" value="로그인"/> 
	</form>
	<br/>
	<a href="">아이디/비밀번호 찾기</a>
	
	<% } else { %>
	<%-- after sign up --%>
	<span>[<%= session.getAttribute("id") %>]님, 환영합니다.</span><br/>
	<input type="button" id="btnSignOut" value="로그아웃"/>
	<% } %>
</div>
<script>signInOut()</script> <!-- signInOut.js에서 만든 함수-->
</body>
</html>
```
## 2.4. index.jsp 페이지에 sign_in_out.jsp를 동적 include
```jsp
<div id="index">
		<!-- header -->
		<%@ include file = "header.jsp" %>
		
		<section id="contents">
			<article class="content">
				<jsp:include page="<%=inc%>" />
				<!-- 동적 include -->
			</article>
			<aside class="aside">
				<!-- 동적 include -->
				<jsp:include page="./member/sign_in_out.jsp"/>
				<div id="sub_menu">
				<jsp:include page="<%=sub%>" />
			</div>
			</aside>
		</section>
		<!-- footer -->
		<%@ include file="footer.jsp" %>
		<!-- header와 footer에 모두 변수 a가 선언되어 있으면 오류 -->
		<!-- 정적 삽입 시 변수 선언 주의 -->
	</div>
```
## 2.5. signin.jsp
```jsp
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
		// print로 쓰면 개행이 안되기 때문에 작동 X(println으로 쓸것)
	}

%>
```
## 2.6. signout.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("id");
	response.sendRedirect("../index.jsp");
%>
```
## 2.7. MemberDao.java
```java
package shop.jamielee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberDao() {
		conn = new Application().getConn();
	}
	
	@SuppressWarnings("finally")
	public boolean signin(String id, String password) {
		boolean b = true;
		try {
			String sql = "SELECT * FROM members WHERE id=? AND password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				b = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			return b;
		}
	}
}
```
## 2.8. Application.java
JDBC
```java
package shop.jamielee;

import java.sql.Connection;
import java.sql.DriverManager;

public class Application {
	Connection conn;

	public Application() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", 
					"system", "oracle"
					);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Connection getConn() {
		return conn;
	}
}
```