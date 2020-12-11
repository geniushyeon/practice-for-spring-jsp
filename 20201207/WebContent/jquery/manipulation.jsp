<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</head>
<body>
	<div id='main'>
		<div id='target'>TARGET</div>

		<div id='btn_zone'>
			<input type="button" value='wrap' id='btnWrap' onclick='abc(this)' /> 
			<input type="button" value='append' id='btnAppend' /> 
			<input type="button" value='prepend' id='btnPrepend' />
		</div>
	</div>
	<script>
		// 버튼 3개에 각각 click event 처리
		function abc(button) {
			var wrap = "<label><input type='checkbox'/>확인</label>";
			$('#main>#target').wrap(wrap);
		}

		var btnAppend = document.getElementById('btnAppend');
		btnAppend.onclick = function() {
			alert("btnAppend");
			console.log(this.value);
		}

		var btnPrepend = document.getElementById('btnPrepend');
		btnPrepend.onclick = function() {
			alert("btnPrepend");
			console.log(btnPrepend.value);

		}
	</script>
</body>
</html>