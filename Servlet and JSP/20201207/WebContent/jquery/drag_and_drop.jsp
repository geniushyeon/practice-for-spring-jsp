<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>drag</title>
<title>tabs</title>
<link rel='stylesheet' type='text/css'
   href='http://code.jquery.com/ui/1.12.1/themes/blitzer/jquery-ui.css'/>
<script src='http://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>

<style>
	#drag_and_drop > div {
		width: 150px;
		height: 150px;
		bakcground: #00f;
		opacity: 0.5; /* 투명도 조절 */
	}
	
	#droppable {
		width: 300px;
		height: 300px;
	
	}
	
	.dropped {
		background-color: #aaa;
	
	} /* 드롭된 이후에 적용될 클래스 */
	
	

</style>

</head>
<body>
<div id="drag_and_drop">
	<div id="draggable">let's drag!</div>
	<div id="droppable">let's drop!</div>

</div>
<script>
	$("#draggable").draggable();
	$("#droppable").droppable({
		drop : function() {
			$(this).addClass('dropped'); //$(this).attr('class', 'dropped');
			$(this).html("well done!");
			
		},
	
		out : function() {
			$(this).html("?????");
			$(this).removeAttr('class')
			
		}
		
		
	});

</script>
</body>
</html>