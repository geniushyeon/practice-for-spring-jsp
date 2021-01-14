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
		<footer id="footer">(주)융합S/W 개발</footer>
	</div>
	<script>
		// 모든 기본 태그의 마진, 패딩을 0으로 설정
		$('*').css({
			"margin" : "0",
			"padding" : "0"
		});

		// 패딩 증가의 영향을 최소화하기 위한 조치
		$("*").css("box-sizing", "border-box");
		$("a").css("text-decoration", 'none');
		
		// index page의 너비와 중앙 배치 설정 
		$("#index").css("width", "800px");
		$("#index").css("margin", "auto");

		// header의 높이와 색 지정
		$("#index>#header").css({
			"background-color" : "beige",
			"height" : "100px",
			"text-align" :  "center",
			"margin-top": "5px",
			"position" : 'relative'
		});
		
		// header>nav
		$('#header>#nav').css({
			'position' : 'absolute',
			'right' : '2px',
			'bottom' : '2px'
			
		})
		
		
		$('#header>#nav>ul').css({ 
			'list-style' : 'none',
			
		});
		
		$('#header>#nav>ul>li').css({ 
			'display' : 'inline-block',
			'padding' : '3px',
			'width' : '70px',
			'background-color' : 'orange',
			'text-align' : 'center'
		});
		
		$('#header>#nav>ul>li').first().css('border-radius', '8px 0 0 8px');
		$('#header>#nav>ul>li').last().css('border-radius', '0 8px 8px 0');

		// contents는 최소 높이만 
		$("#contents").css("min-height", "600px");

		// json 
		$("#footer").css({
			"height" : "100px",
			"background-color" : "#ccc",
			"text-align" : "center",
			"line-height" : "100px"

		});

		$("#index>#contents").css({
			"margin-top" : "3px",
			"margin-bottom" : "3px"

		});

		$("#index>#contents>.content").css({
			"width" : "650px",
			"display" : "inline-block",
			"vertical-align" : "top"
		});

		$("#index>#contents>.aside").css({
			"width" : "150px",
			"display" : "inline-block",
			"vertical-align" : "top",
			"margin-left" : "-6px"
		});
		
		$("#index>#contents>.aside>#sub_menu").css({
			'width' : '150px'
		})
		
		$("#index>#contents>.aside>#sub_menu>ol").css({
			'margin-left' : '15px',
			'margin-top' : '5px'
			
		})
		
	</script>
</body>
</html>