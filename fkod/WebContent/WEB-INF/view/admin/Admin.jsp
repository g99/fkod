<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="list-group" id="main_left">
  <a href="#" class="list-group-item active">
    관리자 기능
  </a>
  <a href="#" class="list-group-item" id="admin_home">홈</a>
  <a href="#" class="list-group-item" id="mgmt_member">회원관리</a>
  <a href="#" class="list-group-item" id="mgmt_movie">영화관리</a>
  <a href="#" class="list-group-item" id="mgmt_stat">통계보기</a>
</div>
<div id="main_right">
	<h1>관리자 페이지 입니다</h1>
</div>
<script>
$(function() {
	$("#main_left").css({
		"float" : "left",
		"margin-top" : "1%",
		"margin-bottom" : "5%",
		"margin-left" : "1%",
		"width" : "12%",
		"text-align" : "center",
	});
	$("#main_right").css({
		"float" : "left",
	    "margin-left" : "3%",
		"width" : "50%"
	});
	$('#mgmt_member').click(function() {
		Admin.memberList();
	});
	$('#mgmt_movie').click(function() {
		Admin.movie();
	});
	$('#btn_login').click(function() {
		$.ajax({
			url : "${context}/member.do",
			data : {
				userid : $("#userid").val(),
				password : $("#password").val(),
				page : "login"
			}, 
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success : function(data) {
				if (data.result === "success") {
					$('<div id="login_result"></div>').appendTo($('#frm_login').empty());
					$("#login_result").html(
							'<div>환영합니다'+data.name+'님</div><button id="close">창닫기</button>'
					);
					$("#close").click(function() {
						window.opener.top.location.href = "${context}/main.do?page=auth&userid=" + data.userid;
						window.close();
					});
				}else {
					alert("로그인 실패");
				}
				
			},
			error : function() {
				alert("ajax 실패");
			}
		});
});	
/*  $('#btn_admin_table').click(function() {
    $('#btn_admin_table').submit();
  }); */
 var Admin = {
			memberList : function() {
				 $.getJSON('${context}/admin/Admin.do?page=member_list', function(data) {
					 var table = '<h1>회원목록</h1>'
							+'<table id="tab_member"><tr><th>아이디</th><th>비밀번호</th>'
							+'<th>이름</th><th>생년</th><th>성별</th>'
							+'<th>전화번호</th><th>주소</th><th>이메일</th><th>등록일</th></th>';
							$.each(data, function() {
								table +='<tr><td>'+this.id+'</td><td>'+this.password+'</td>'
									+'<td>'+this.name+'</td><td>'+this.birth+'</td>'
									+'<td>'+this.gender+'</td><td>'+this.phone+'</td>'
									+'<td>'+this.addr+'</td><td>'+this.email+'</td>'
									+'<td>'+this.regdate+'</td></tr>'
							});
							table += '</table>';
							$("#tab_member").css({
								"border" : "1px solid black",
								"border-collapse" : "collapse",
								"text-align" : "center",
							});
							$(table).appendTo($('#main_right').empty());
				});
			},
			memberNotExist : function() {
				var table ='<h1>회원목록'
					teble ='</h1><table id="tab_member"><tr><th>아이디</th><tr><th>비밀번호</th>';
					table += '<th>이름</th><th>생년</th><th>성별</th><th>전화번호</th><th>주소</th></tr>';
					table += '<th>이메일</th><th>등록일</th></tr>';
					table += '<tr><td colspan="6"><h2>회원목록이 없습니다.</h2></td></tr></table>';
					$(table).appendTo($('#main_right').empty());
			},
			movie : function() {
				 $.getJSON('${context}/admin/Admin.do?movie', function(data) {
					 var table = '<h1>영화관리</h1>'
					 +
					 +'';
				});
			}
						

 }

 
</script>