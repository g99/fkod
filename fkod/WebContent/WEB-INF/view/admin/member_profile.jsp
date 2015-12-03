<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="div_admin_member">
<table id="tab_admin_member">
	<tr>
		<th>아이디</th>
		<td id="member_id">${member.id}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td id="member_password">${member.password}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td id="member_name">${member.name}</td>
	</tr>
	<tr>
		<th>생년</th>
		<td id="member_birth">${member.birth}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td id="member_phone">${member.phone}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td id="member_email">${member.email}</td>
	</tr>
	<tr>
		<th>성별</th>
		<td id="member_gender">${member.gender}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td id="member_addr">${member.addr}</td>
	</tr>
	<tr>
		<th>등록일</th>
		<td id="member_regdate">${member.regdate}</td>
	</tr>
</table>
	<button id="delete_member" style="float:left">삭제</button>
	<button id="update_member" style="float:right; margin-right:10px;">등록</button>
	<button id="modify_member" style="float:right; margin-right:10px;">수정</button>
</div>
<script src="${context}/js/global.js"></script>
<script type="text/javascript">
	$(function() {
		$("#update_member").css("display","none");
		$("#delete_member").click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				$.ajax("${context}/admin/Admin.do?page=delete",{
					data : {
						id : $("#member_id").text(),
					},
					dataType : "json",
					success : function(data) {
						$("#div_admin_member").html(data.result);
						//부모창의 회원목록 버튼을 클릭하게함
						opener.document.getElementById("admin_member").click();
					},
					error : function() {
						
					}
				});	
			}
		});
		$("#modify_member").click(function() {
			if(confirm("정말 수정하시겠습니까?")){
				var id = $("#member_id").text();
				var password = $("#member_password").text();	
				var phone = $("#member_phone").text();	
				var email = $("#member_email").text();	
				var addr = $("#member_addr").text();
				$("#member_password").html("<input type='text' id='input_password' value=" + password + ">");
				$("#member_phone").html("<input type='text' id='input_phone' value=" + phone+ ">");
				$("#member_email").html("<input type='text' id='input_email' value=" + email + ">");
				$("#member_addr").html("<input type='text' id='input_addr' value=" + addr + ">");
				$("#update_member").css("display","inline-block");
				$("#modify_member").css("display","none");
				$("#delete_member").css("display","none");
				//등록버튼을 누르면
				$("#update_member").click(function() {
					if(confirm("정말 등록하시겠습니까?")){
						console.log(id + password + phone + email + addr);
						$.ajax("${context}/admin/Admin.do?page=insert",{
							data : {
								id : $("#member_id").text(),
								password : $("#input_password").val(),
								phone : $("#input_phone").val(),
								email : $("#input_email").val(),
								addr : $("#input_addr").val()
							},
							dataType : "json",
							success : function(data) {
								$("#div_admin_member").html(data.result);
								//부모창의 회원목록 버튼을 클릭하게함
								opener.document.getElementById("admin_member").click();
							},
							error : function() {
								
							}
						});				
					}
				});
			}
		});
		
	});
</script>