<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<style>

* {
	box-sizing: border-box;	
}
#member {
	width: 1000px;
	margin: 0 auto;
}
h2 {
	text-align: center;
}

#search_zone {
	float: right;
	
}

#info_zone {
	display: inline-block;
}

.card_zone {
	display: inline-block;
	margin-right: 10px;
	width: 300px;
	border: 1px solid #aaa;
	padding: 7px;
}

.detail_info_zone {
	margin-bottom: 5px;
}

#paging_zone {
	border-top: 1px solid #aaa;
	padding-top: 10px;
	text-align: center;
}

#paging_zone > input[type=button] {
	border-radius: 14px;
	border: 1px solid #aaa;
}

#select_zone {
	text-align: center;
	padding-bottom: 10px;
}
</style>
<body>
<div id=member>
	<h2>회원관리</h2>
	<div>
		<form name="frm_member" id="frm_member" method="POST" action="insertR.mem">
			<input type="button" value="입력" id="btnInsert"/>
			<div id="search_zone">
				<input type="text" id="search_box" name="findStr" value="${param.findStr }"/>
				<input type="button" value="검색" id="btnFind"/>
				<input type="text" name="nowPage" value="${(empty param.nowPage)? 1 : param.nowPage }"/>
				<input type="text" name="mid"/>
 			</div>
		</form>
	</div> 
	<hr/>
	<div id="select_zone">
		<div class="card_zone">
			<img alt="" src="http://placehold.it/80x130">
			<div id="info_zone">
				<div class="detail_info_zone">
					<label>아이디</label>
					<input type="text" disabled/>
				</div>
				<div class="detail_info_zone">
					<label>성명</label>
					<input type="text" disabled/>
				</div>
				<div class="detail_info_zone">
					<label>연락처</label>
					<input type="text" disabled/>
				</div>
				<div class="detail_info_zone">
					<label>이메일</label>
					<input type="email" disabled/>
				</div>
			</div>
		</div>
		<div class="card_zone">
		<c:forEach var="v" items="${list }">
			<img alt="" src="http://placehold.it/80x130">
			<div id="info_zone" onclick="view(${v.mid})">
				<div class="detail_info_zone">
					<label>아이디</label>
					<span>${v.mid }</span>
				</div>
				<div class="detail_info_zone">
					<label>성명</label>
					<span>${v.name }</span>
				</div>
				<div class="detail_info_zone">
					<label>연락처</label>
					<span>${v.phonenumber }</span>
				</div>
				<div class="detail_info_zone">
					<label>이메일</label>
					<span>${v.email }</span>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	
	<div id="paging_zone">
	<c:if test="${page.startPage > 1 }">
		<input type="button" value="처음" id="btnFirst"/>
		<input type="button" value="이전" id="btnPrev"/>
	</c:if>	
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
	
		<input type="button" value="1"/>
	</c:forEach>
	
	<c:if test="${page.endPage < page.totalPage }">
		<input type="button" value="다음" id="btnNext"/>
		<input type="button" value="맨끝" id="btnLast"/>
	</c:if>
	</div>
</div>
</body>
</html>