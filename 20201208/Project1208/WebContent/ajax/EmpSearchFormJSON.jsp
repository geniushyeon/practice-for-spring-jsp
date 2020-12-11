<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_search_form</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
 integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous">
</script>
<style>
#items > div {
	display: inline-block;
	width: 200px;
	height: 150px;
	border: 1px solid #ccc;
	padding: 5px;
	box-shadow: 2px 2px 3px #999;
	border-radius: 12px;
	margin-bottom: 5px;
	background-color: beige;
}

</style>
</head>
<body>
<div id="emp_search_form">
	<form name="form" method="POST" id="form">
		<h2>사원조회(JSON)</h2>
		<label>검색어를 입력하세요.</label>
		<input type="text" name="findString" placeholder="성명/이메일/연락처로 검색"/>
		<input type="button" value="검색" id="btnFind"/>
	</form>
	<hr/>
	<div id="items"></div>
</div>
<script>
$("#btnFind").on("click", function() {
	let param = $("#form").serialize(); // 직렬화
	let request = new XMLHttpRequest();
	request.open("GET", "./ajax/EmpSearchJSON.jsp?" + param); // GET 타입으로 EmpSearchJSON.jsp 파일에 요청 정보를 생성 
	request.onreadystatechange = function() {
		if(request.status==200 && request.readyState == 4) {
			console.log(request.status + ", " + request.readyState);
			let data = JSON.parse(request.responseText);
			let doc = "";
			for(var i=0; i<data.length; i++) {
				doc += "<div class='emp'>"
						+ "<div>" + data[i].id + "</div>"
						+ "<div>" + data[i].name + "</div>"
						+ "<div>" + data[i].email + "</div>"
						+ "<div>" + data[i].phonenumber + "</div>"
						+ "<div>" + data[i].salary + "</div>"
						+ "</div>"
				
			}
			
			$("#items").html(doc);
		}
	}
	
	request.send();
	
})

</script>
</body>
</html>