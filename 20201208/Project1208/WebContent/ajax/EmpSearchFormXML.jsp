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
	request.open("GET", "./ajax/EmpSearchXML.jsp?" + param); // GET 타입으로 EmpSearchXML.jsp 파일에 요청 정보를 생성 
	request.onreadystatechange = function() {
		if(request.status==200 && request.readyState == 4) {
			console.log(request.status + ", " + request.readyState);
			let xml = request.responseXML;
			let emps = xml.getElementsByTagName("emp");
			let result = "";
			
			 // javascript DOM 구조를 사용하여 Data에 Access
			for(var i=0; i<emps.length; i++) {
				var emp = emps.item(i);
				var id = emp.getElementsByTagName("id").item(0).firstChild.nodeValue;
				var name = emp.getElementsByTagName("name").item(0).firstChild.nodeValue;
				var email = emp.getElementsByTagName("email").item(0).firstChild.nodeValue;
				var phonenumber = emp.getElementsByTagName("phonenumber").item(0).firstChild.nodeValue;
				var salary = emp.getElementsByTagName("salary").item(0).firstChild.nodeValue;
				
				result += "<div class='emp'>"
					+ "<div>" + id + "</div>"
					+ "<div>" + name + "</div>"
					+ "<div>" + email + "</div>"
					+ "<div>" + phonenumber + "</div>"
					+ "<div>" + salary + "</div>"
					+ "</div>"
			}
			$("#items").html(result);
		}
	}
	
	request.send();
	
})

</script>
</body>
</html>