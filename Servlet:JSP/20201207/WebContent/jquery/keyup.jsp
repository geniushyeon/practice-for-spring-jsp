<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>keyup</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<style>
#result {
	border: 2px solid #aaa;
	border-radius: 10px;
	padding: 15px;
	width: 350px;
	height: 100px;
	background-color: #eee;
	box-shadow: 2px 2px 4px #999;
	overflow: auto;
}
</style>
</head>
<body>
	<div id='keyup'>
		<label>생년월일</label> 
		<input type="text" id="birth" placeholder="YYYYMMDD" /> 
		<label>성별</label>
		<label>-</label> 
		<input type="text" id="sex" size="4" />
		<p />
		<div id="result"></div>

	</div>
	<script>
		$("#keyup>#birth").keyup(function(obj) {
			var string = obj.keyCode;
			$('#result').text(string);
			console.table(obj);
			
			// 입력된 문자열 길이 계산 -> 8자 이상이면 커서 이동 
			if($(this).val().length >= 8) {
				$('#sex').focus().select();
				// select(): 커서가 이동됐을 때 자동으로 sex 선택 
			}
			
		});
		// 홀수면 '남', 짝수면 '여'
		$("#keyup>#sex").keyup(function() {
			var gen = Number($(this).val());
			var string = '';
			if(gen%2 == 0) { //예외처리 필요 
				str = "여성입니다."
				
			}
			
			else {
				str = "남성입니다."
				
			}
			
			$("#result").html(str);
		})
	</script>

</body>
</html>