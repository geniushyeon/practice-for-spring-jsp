<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>parameterValues</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" 
integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
crossorigin="anonymous"></script>
</head>
<body>
	<div id="parameter">
		<div id="result"></div>
		<h3>parameter values</h3>
		<form name="form_param" method="POST" id="form_param">
			<label for="mid">아이디</label>
			<input type="text" id="mid" name="mid" value="lee"/>
			<br/>
			<label>성별</label>
			<label><input type="radio" name="sex" value="F"/>여성</label>
			<label><input type="radio" name="sex" value="F"/>남성</label>
			<br/>
			<label>취미</label>
			<label><input type="checkbox" value="영화감상" name="hobby"/>영화감상</label>
			<label><input type="checkbox" value="음악감상" name="hobby"/>음악감상</label>
			<label><input type="checkbox" value="넷플릭스" name="hobby"/>넷플릭스</label>
			<br/>
			<select name="subject" size="5" multiple>
				<option value="html5">HTML5</option>
				<option value="css3">CSS3</option>
				<option value="javascript">javascript</option>
			
			</select>
			<br/>
			<input type="file" name="att-file" multiple/>
			<br/>
			<input type="submit" value="실행"/>
		</form>
	
	</div>
	
	<script>
	$("#form_param").on("submit", function() {
		var param = $("#form_param").serialize();
		$("#result").load("parameterValues_control.jsp", param);
		return false; //submit 기능 중지 
	})
	
	</script>
</body>
</html>