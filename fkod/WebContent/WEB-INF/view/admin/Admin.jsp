<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div style="background:white; height: 1000px">
<!-- <div class="list-group" id="main_left">
  <a href="#" class="list-group-item active">
    관리자 기능
  </a>
  <a href="#" class="list-group-item" id="admin_home">홈</a>
  <a href="#" class="list-group-item" id="mgmt_member">회원관리</a>
  <a href="#" class="list-group-item" id="mgmt_movie">영화관리</a>
  <a href="#" class="list-group-item" id="mgmt_stat">통계보기</a>
</div> -->
<div id="main_right">
	<h1>관리자 페이지 입니다</h1>
</div>
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

	$('#admin_member').click(function() {
		Admin.memberList();
	});
	$('#admin_movie').click(function() {
		Admin.movie();
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
								table +='<tr><td><a id="' +this.id+'" href="#">'+this.id+'</a></td><td>'+this.password+'</td>'
									+'<td>'+this.name+'</td><td>'+this.birth+'</td>'
									+'<td>'+this.gender+'</td><td>'+this.phone+'</td>'
									+'<td>'+this.addr+'</td><td>'+this.email+'</td>'
									+'<td>'+this.regdate+'</td></tr>'
							});
							table += '</table>';
							$(table).appendTo($('#main_right').empty());
							$("#"+this.id).click(function() {
								alert("환영");
							});
							
							$("#tab_member").add("#tab_member tr").add("#tab_member th").add("#tab_member td").css({
								"border" : "1px solid black",
								"border-collapse" : "collapse",
								"text-align" : "center",
							});
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
					 	 table
					 	 table
					 +'';
				});
			}
 }

 
</script>