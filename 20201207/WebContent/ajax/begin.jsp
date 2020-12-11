<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>begin</title>
</head>
<body>
	<div id="begin">
		<fieldset>
			<legend>Ajax의 특징</legend>
			<ul>
				<li>별도의 외부 플러그인이나 라이브러리, API들이 필요없다.</li>
				<li>브라우저 내부에 있는 자바스크립트만으로 처리 가능하다.</li>
				<li>비동기 방식으로 서버와 통신하며, 브라우저의 새로고침 없이 특정 영역의 내용을 동적으로 변경할 수 있다.</li>
				<li>프로그램 방식을 Web 방식에서 App 방식으로 처리할 수 있다.</li>
			</ul>
		</fieldset>

		<h3>간단 테스트</h3>
		<%
		
		%>
		<form name="form" method="POST">
			<label>정수를 입력하세요</label> <input type="text" size="6" name="number" />
			<input type="submit" value="Check" />
		</form>
		<div id="result"></div>
	</div>

	<script>
	// Ajax를 통해 서버의 처리 결과를 result에 표시 
	var form = document.form;
	
	form.onsubmit = function() { // form 안에 submit 버튼이 클릭됐을 때
		var param = "?number=" + form.number.value;
		
		var request = new XMLHttpRequest();
		request.open("GET", "./ajax/OddEvenCheck.jsp" + param); //GET 타입으로 OddEvenCheck.jsp파일에 요청 정보를 생성

		request.onreadystatechange = function() {
			if (request.status == 200 && request.readyState == 4) {
				// request.status == 200: 정상 요청됨 
				// request.readyStatus == 4: 정상 응답 
				var r = document.getElementById("result");
				r.innerHTML = request.responseText; // 응답 결과를 r에 집어넣음 
			}
			
		}
	
	request.send(); // 요청 정보를 서버에 전송 
	
	return false; // submit 고유의 기능을 취소 
	}
</script>
</body>
</html>