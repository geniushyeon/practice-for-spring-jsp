<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(insert)</title>
<link rel='stylesheet' type='text/css' href='./css/member.css'>
<script src='./js/member.js'></script>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm_member' method='post' class='view'>
		<label>아이디</label>
		<input type='text' name='mid' disabled size='10' value='${memberVo.mid }'/><br/>
		
		<label>성명</label>
		<input type='text' name='name' disabled size='12' value='${memberVo.name }'/><br/>
		
		<label>이메일</label>
		<input type='email' name='email' disabled size='35'  value='${memberVo.email }'/><br/>
		
		<label>연락처</label>
		<input type='text' name='phonenumber' disabled size='15'  value='${memberVo.phonenumber }'/><br/>
		
		<label>우편번호</label>
		<input type='text' name='zipcode' disabled size='6'  value='${memberVo.zipcode }'/><br/>
		
		<label>주소</label>
		<input type='text' name='address' disabled size='60'  value='${memberVo.address }'/> <br/>
		
		<label></label>
		
			<c:choose>
				<c:when test="${empty vo.photo }">
					<img src='http://placehold.it/200X140' width='200px' height='140px' />
				</c:when>
				<c:otherwise>
					<a href='./upload/${memberVo.photo }' download = '${memberVo.photo }'>
						<img src='./upload/${memberVo.photo }' width='200px' height='140px'/>
					</a>
				</c:otherwise>				
			</c:choose>		
			
		<hr/>
		
		<div class='btns'>
			<input type='button' value='수정' id='btnModify' />
			<input type='button' value='삭제' id='btnDelete' />
			<input type='button' value='목록으로' id='btnSelect' />
		</div>
		
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='delFile' value='${memberVo.photo }' />
		
		<div id="passwordZone">
			<div>
				<input type="password" name="password"/>
				<input type="button" value="입력" id="btnPassword"/>
			</div>
		</div>
		
	</form>

</div>
<script>member()</script>
</body>
</html>
