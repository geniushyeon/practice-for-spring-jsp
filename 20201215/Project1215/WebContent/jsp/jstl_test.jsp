<%@page import="shop.jamielee.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!-- prefix=접두사, uri=경로 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl test</title>
</head>
<body>
<div id="jstl_control">
	<h2>jstl(Java Standard Tag Library)</h2>
	
	<%
		String name = "geniushyeon";
		int score = 100;
		
		//전제 조건: setAttribute로 값 저장
		pageContext.setAttribute("page_name", name);
		pageContext.setAttribute("page_score", score);
		
		request.setAttribute("req_name", name);
		request.setAttribute("req_score", score);
		
	%>
	
	<h3>c:out - jstl을 사용한 출력문</h3>
	<li>Name: <c:out value="${pageScope.page_name }" default="이름을 입력하세요"/></li>
	<li>Score: <c:out value="${pageScope.page_score }" default="0점"/></li>
	<li>Name(req): <c:out value="${requestScope.req_name }" default="이름을 입력하세요"/></li>
	<li>Score(req): <c:out value="${requestScope.req_score }" default="0점"/></li>
	
	<h3>c:set | c:remove | c:out</h3>
	<c:set var="score" value="100"/>
	<li>Score 1: <c:out value="${score }"/></li>
	<c:remove var="score"/>
	<li>Score 2: <c:out value="${score }" default="변수가 삭제됨."/></li>
	
	<h3>c:if</h3>
	<li>
		<c:if test="${req_score>90 }">
			<font color="red">장학생</font>
		</c:if>
	</li>
	
	<h3>c:if를 사용하여 해결</h3>
	<div>
		kor, eng 변수에 임의의 값을 대입하여 request 영역에 저장한 후 두 변수의 합이 180 이상이면 '우등생' 출력 
		<%
			int kor = 95;
			int eng = 90;
			
			request.setAttribute("korScore", kor);
			request.setAttribute("engScore", eng);
		
		%>
		
		<li>
			<c:if test="${korScore + engScore >= 180 }">
				<font color="red">우등생</font>
			</c:if>
		</li>
	</div>
	<fieldset>
		<div>
			구매수량, 단가를 임의의 변수에 저장하여 scope에 담고, 구매금액(구매수량*단가)에 따라 사은품이 지급되도록 choose문을 기술하시오.<br/>
			- 1000원 이상: 화장지<br/>
			- 10000원 이상: 자전거<br/>
			- 100000원 이상: 아파트<br/>
		</div>
		<%
         int ea = 100; //구매수량
         int price = 500; //단가
         int amount = ea*price;
         
         request.setAttribute("amount", amount);
      %>
      <c:choose>
         <c:when test="${amount>=100000 }">아파트 당첨</c:when>
         <c:when test="${amount>=10000 }">자전거 당첨</c:when>
         <c:when test="${amount>=1000 }">화장지 </c:when>
         <c:otherwise>다음기회에</c:otherwise>
      </c:choose>
	</fieldset>
	
	<h3>c:forTokens</h3>
	<c:forTokens var="item" items="애플, 삼성, LG" delims=", ">
		<li><c:out value="${item }"/></li>
	</c:forTokens>
	
	<h3>c:forEach</h3>
	<fieldset>
		<legend>forEach를 사용하여 1부터 100까지의 홀수 출력</legend>
	<c:forEach var="i" begin="1" end="100" step="2">
		<c:out value="${i }"/>
	</c:forEach>
	</fieldset>
	<%
		List<MemberVo> list = new ArrayList<>();
		MemberVo memberVo = new MemberVo();
		memberVo.setId("Lee");
		memberVo.setPhonenumber("01012345678");
		list.add(memberVo);
		
		memberVo = new MemberVo();
		memberVo.setId("Yoon");
		memberVo.setPhonenumber("01011112222");
		list.add(memberVo);
		
		memberVo = new MemberVo();
		memberVo.setId("Song");
		memberVo.setPhonenumber("01099998888");
		list.add(memberVo);
		
		request.setAttribute("list", list);
	
	%>
	
	<c:forEach var="vo" items="${list }">
		<li><c:out value="${vo.id }: ${vo.phonenumber }"/></li>	
	
	</c:forEach>
	
	
</div>
</body>
</html>