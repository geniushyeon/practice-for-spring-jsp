<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>One</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<style>
#one > #result {
	border: 1px solid #44f;
	width: 300px;
	height: 120px;
	text-align: center;
	line-height: 120px;
}

#btnSend {
	width: 70px;
	height: 30px;

}

</style>
</head>
<body>
<div id="one">
	<div id="result">송금 버튼을 클릭하시면 송금됩니다.</div>
	<input type="button" value="송금" id="btnSend"/>
	
</div>

<script>

	// 단위 세션당 이벤트가 한번만 동작
	
	let count = 0;
	// 1번 방법 
	/* $("#btnSend").click(function(){
		$("#result").html(count +"회 송금됨.");
		$(this).attr("disabled", "disabled");
	}) */
	
	// 2번 방법 (찐 one)
	$("#btnSend").one("click", function(){
		count++;
		$("#result").html(count + "회 송금됨.");
		$(this).attr("disabled", "disabled");
	})
	
	// 3번 방법 
	/* $("#btnSend").click(function(){
		if (count == 1) {
			return false;
		}
		
		count++;
		$("#result").html(count +"회 송금됨.");
		
	}) */
</script>
</body>
</html>