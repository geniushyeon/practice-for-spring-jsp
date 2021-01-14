<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serialize</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

</head>
<body>
	<div id="serialize">
		<form name="form_serialize" method="POST" id="form_serialize">
			<label>아이디</label>
			<input type="text" name="memberId" value="a001"/><br/>
			<label>이름</label>
			<input type="text" name="memberName" value="지니어스현"/><br/>
			<label>연락처</label>
			<input type="text" name="phoneNumber" value="010-1234-1234"/><br/>
			<input type="submit" value="전송"/>
		
		</form>
	</div>
	
	<script>
		/* $('#form_serialize')[0].onsubmit = function(){} // js */
		$('#form_serialize').submit(function(){
			let data = $(this).serialize()
			console.log(data)
			return false // submit 기능 중지 
		}) // jq
	
	
	
	</script>
</body>
</html>