/**
 * 
 */

function getID(id){ return document.getElementById(id)}

var member = function(){
	
	var btnInsert = getID('btnInsert');
	var btnFind   = getID('btnFind');
	var btnSelect = getID('btnSelect');
	var btnSave   = getID('btnSave');
	var btnFindZip = getID('btnFindZip');
	var btnPhoto  = getID('btnPhoto');
	var btnModify = getID('btnModify');
	var btnUpdate = getID('btnUpdate');
	var btnDelete = getID('btnDelete');
	
	if(btnDelete != null){
		btnDelete.onclick = function(){
			var frm = document.frm_member;
			var passwordZone = getID("passwordZone");
			var btnPassword = getID("btnPassword");
			
			passwordZone.style.display = "block";
			
			btnPassword.onclick = function() {
				passwordZone.style.display = "none";
				if(frm.password.value != ''){
					frm.mid.disabled = false;
					member.delete("delete_result.mem");
					
				}
				
			}
		}
	}
	
	
	if(btnUpdate != null){
		btnUpdate.onclick = function(){
			var frm = document.frm_member;
			
			var passwordZone = getID("passwordZone");
			var btnPassword = getID("btnPassword");
			
			passwordZone.style.display = "block";
			
			btnPassword.onclick = function() {
				passwordZone.style.display = "none";
				if(frm.password.value != ''){
					frm.mid.disabled = false;
					member.delete("modify_result.mem");
					
				}
			}
		}
	}
	
	if(btnModify != null){
		btnModify.onclick = function(){
			var frm = document.frm_member;
			frm.mid.disabled=false;
			member.select("modify.mem");
		}
	}
	
	
	
	// 이미지 파일 미리보기
	if(btnPhoto != null){
		btnPhoto.onchange = function(ev){
			var tag = ev.srcElement; // 이벤트 발생한 태그
			var url = tag.files[0]; // 선택된 파일명
			var reader = new FileReader();
			reader.readAsDataURL(url);
			reader.onload = function(e){
				var img = new Image();
				img.src = e.target.result;
				var photo = getID('photo');
				photo.src = img.src;
			}
		}
	}

	
	// 다음 우편번호 검색 API를 사용한 주소 찾기
	if(btnFindZip != null){
		btnFindZip.onclick = function(){
			var frm = document.frm_member;
			new daum.Postcode({
				oncomplete : function(data){
					frm.zipcode.value = data.zonecode;
					frm.address.value = data.address;
				}
			}).open();
		}
	}
	
	
	
	if(btnSave != null){
		btnSave.onclick = function(){
			var frm = document.frm_member;
			var checkFlag = true;
			
			if(checkFlag){
				member.update("insert_result.mem");
			}
		}
	}
	
	
	if(btnSelect != null){
		btnSelect.onclick = function(){
			var frm = document.frm_member;
			member.select("select.mem");
		}
	}
	
	
	if(btnFind != null){
		btnFind.onclick = function(){
			var frm = document.frm_member;
			frm.nowPage.value = 1;
			member.select();
		}
	}
	
	
	//$('#btnInsert').on('click', function(){ ... });
	if(btnInsert != null){
		btnInsert.onclick = function(){
			member.select("insert.mem");
		}
	}
}//end of member()

member.goPage = function(page){
	var frm = document.frm_member;
	frm.nowPage.value = page;
	member.select();
}

member.view = function(mid){
	var frm = document.frm_member;
	frm.mid.value = mid;
	member.select("view.mem");
}

member.select = function(url) {
	
	if (url == null) {
		url = "select.mem";
	}
	
	$param = $("#frm_member").serialize();
	
	$.ajax({
		url : url,
		data : $param,
		dataType : 'html',
		method : 'POST',
		success : function(data) {
			$("#result").html(data);
		}
		
	});
}

// 입력, 수정
member.update = function(url) {
	var formData = new FormData($("#frm_member")[0]);
	
	$.ajax({
		url : url,
		data : formData,
		dataType : 'html',
		method : 'POST',
		enctype : 'multipart/form-data',
		contentType : false,
		processData : false,
		success : function(data) {
			$("#result").html(data);
			
		}
	});
	
}