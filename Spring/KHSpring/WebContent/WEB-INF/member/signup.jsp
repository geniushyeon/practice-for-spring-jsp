<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<div id="member" class="signup">
	<h2>회원가입</h2>
	<form name="frm_member" id="frm_member" method="POST" action="signup_complete.mem">
		<label>아이디</label>
		<input type="text" name="mid" value="a001"/><br/>
		<label>비밀번호</label>
		<input type="password" name="password" value=""/><br/>
		<label>연락처</label>
		<input type="text" name="phonenumber"/><br/>
		
		<input type="submit" value="가입하기" id="btnSignup"/>
	
	</form>

</div>
</body>
</html>