# 1. JSP 액션 태그
## 1.1. <jsp: useBean>
`Bean`을 생성하고 사용하기 위한 환경을 정의
- Bean: 프로그램에서 사용될 여러 개의 정보를 모아 놓는 데이터 저장소 역할을 하는 클래스
## 1.2. <jsp: setProperty>
`Bean`에서 속성 값을 할당
- 실습
```jsp
<%@page import="shop.jamielee.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "memberDao" class=shop.jamielee.MemberDao/>
<jsp:useBean id = "memberVo" class=shop.jamielee.MemberVo/>
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
```
코드가 훨씬 간단해진다.

# 2. MVC Model 2 방식
- MVC는 `Model`, `View`, `Controller`로 각각의 역할을 나누어 작업하고자 하는 일을 분담시키는 것을 말한다.
## 2.1. Model
애플리케이션 로직을 담당하는 부분으로 데이터베이스와의 로직을 담당하는 부분
- Java Bean/서비스 클래스를 이용하여 담당하게 함
- 비즈니스 로직이 구현되어 있음
- `CRUD` 수행
## 2.2. View
Client에게 보여지는 부분
- Model에서 생성된 데이터를 Client에게 제공하는 역할
- JSP와 JSTL을 이용하여 구현
## 2.3. Controller
사용자의 요청을 받아서 요청에 해당하는 비즈니스 로직을 수행하도록 하고, 작업 결과에 따라 응답을 결정하는 역할을 함
- Model과 View 사이의 데이터 전달 역할
- Servlet
- 사용자 요청 받음 -> 분석 -> 자바 빈 생성 및 비즈니스 로직이 구현된 메소드 실행 -> 사용자의 요청을 jsp 페이지 혹은 특정 url로 이동시킴

## 2.4. 필요 요소
- View(JSP): 사용자가 요청하거나 요청한 정보를 응답받아 볼 수 있는 페이지
- Controller(Servlet): 사용자의 요청을 전달받아 응답처리를 위한 Service를 호출하고 결과를 View에 전송하는 클래스
- Service(Model): 여러 DAO를 호출하여 데이터 접근/갱신을 하고, 그렇게 읽은 데이터에 대한 비즈니스 로직을 수행하여 Controller에 그 결과를 전송하는 클래스
- DAO(Model): Data Access Object
  - 데이터베이스에 직접 접근하여 요청받은 결과를 반환하는 클래스
- DTO/VO(Model): Data Transfer Object/Value Object
  - 계층 간 데이터 교환을 위한 객체 클래스

# 20.12.15
- jsp:useBean, jsp:setProperty
- MVC model2 방식 이해
- MemberVo, MemberDao 제작
- jstl 라이브러리 설치 및 사용 예


# jstl 라이브러리
- [톰캣홈페이지 T](https://tomcat.apache.org/taglibs.html) -> Download

다운로드
`compat`,`impl`,`jstel`,`spec`