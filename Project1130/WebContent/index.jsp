<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

</head>
<body>

	<%
		String inc = "intro.jsp";
		if(request.getParameter("inc") != null) {
			inc = request.getParameter("inc");
			
		}
	
	%>
	<div id="index">
		<header id="header">This is a header</header>
		<section id="contents">
			<article class="content">
			<jsp:include page ="<%=inc %>"/> <!-- 동적 include -->
			</article>
			<aside class="aside">
				<img src="http://placehold.it/150X100" />
			</aside>

		</section>
		<footer id="footer">(주)융합S/W 개발</footer>
	</div>
	<script>
		// 모든 기본 태그의 마진, 패딩을 0으로 설정
		$("*").css("margin", "0");
		$("*").css("padding", "0");

		// 패딩 증가의 영향을 최소화하기 위한 조치
		$("*").css("box-sizing", "border-box");

		// index page의 너비와 중앙 배치 설정 
		$("#index").css("width", "800px");
		$("#index").css("margin", "auto");

		// header의 높이와 색 지정
		$("#header").css("background-color", "beige");
		$("#header").css("height", "100px");
		$("#header").css("text-align", "center");
		$("#header").css("margin-top", "5px");

		// contents는 최소 높이만 
		$("#contents").css("min-height", "250px");

		/* // footer 높이와 바탕색 지정
		$("#footer").css("height", "100px");
		$("#footer").css("background-color", "#ccc");
		$("#footer").css("text-align", "center");
		$("#footer").css("line-height", "100px"); */

		// json 
		$("#footer").css({
			"height" : "100px",
			"background-color" : "#ccc",
			"text-align" : "center",
			"line-height" : "100px"

		});

		$("#contents").css({
			"margin-top" : "3px",
			"margin-bottom" : "3px"

		});

		$(".content").css({
			"width" : "650px",
			"float" : "left"
		});

		$(".aside").css({
			"width" : "150px",
			"float" : "left"
		});
	</script>

</body>
</html>