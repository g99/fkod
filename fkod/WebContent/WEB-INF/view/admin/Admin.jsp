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
var Admin = {
	 	home : function(project) {
			$("#box").load(project + "/admin/Admin.do");
		},
		member : function(project) {
			 $.getJSON(project + '/admin/Admin.do?page=member_list', function(data) {
				 var arr = [];
				 var table = '<div id="member_list"><h1>회원목록</h1>'
						+'<table id="tab_member"><tr><th>아이디</th><th>비밀번호</th>'
						+'<th>이름</th><th>생년</th><th>성별</th>'
						+'<th>전화번호</th><th>주소</th><th>이메일</th><th>등록일</th></tr>';
						$.each(data, function() {
							arr.push(this.id);
							table +='<tr><td><a id="' + this.id + '" href=#>'+this.id+'</a></td><td>'+this.password+'</td>'
								+'<td>'+this.name+'</td><td>'+this.birth+'</td>'
								+'<td>'+this.gender+'</td><td>'+this.phone+'</td>'
								+'<td>'+this.addr+'</td><td>'+this.email+'</td>'
								+'<td>'+this.regdate+'</td></tr>'
						});
						table += '</table></div>';
						$(table).appendTo($('#box').empty());
						// 아이디별로 버튼 달기
						$.each(data, function(index) {
							$("#"+this.id).click(function() {
								Bom.popup(project,arr[index]);
							});
						});
						
 						// css 부분
						$("#member_list").css({
							"padding-top" : "20px",
							"padding-left" : "20px",
							"padding-right" : "20px",
							"background":"white",
							"height":"1000px",
						});
						$("#tab_member").css("width","100%");
						$("#tab_member").add("#tab_member tr").add("#tab_member th").add("#tab_member td").css({
							"border" : "1px solid black",
							"border-collapse" : "collapse",
							"text-align" : "center",
						}); 
			});
		},
			movie : function(project) {
				 $.getJSON('${context}/admin/Admin.do?page=movie_list', function(data) {
					 var arr = [];
					 var table = '<div id="movie_list"><h1>영화목록</h1>'
					 	 	   + '<table id="tab_movie"><tr><th>영화번호</th><th>영화이름</th>'
					 	       + '<th>감독</th><th>배우</th><th>등급</th><th>런타임</th><th>가격</th>'
					 	       + '<th>장르</th><th>개봉일</th><th>종료일</th><th>줄거리</th>'
					 	       + '<th>스틸컷</th><th>트레일러</th></tr>';
						 $.each(data, function() {
							arr.push(this.filmName);
							table +='<tr><td>'+this.filmNumber+'</td><td><a id="' + this.filmName + '" href=#>'+this.filmName+'</a></td>'
								+'<td>'+this.director+'</td><td>'+this.actor+'</td>'
								+'<td>'+this.rate+'</td><td>'+this.runtime+'</td>'
								+'<td>'+this.price+'</td><td>'+this.genre+'</td>'
								+'<td>'+this.releaseDate+'</td><td>'+this.endDate+'</td>'
								+'<td>'+this.story+'</td><td>'+this.cut+'</td>'
								+'<td>'+this.trailer+'</td></tr>'
							});
							table += '</table>';
							$(table).appendTo($('#main_right').empty());
							// 아이디별로 버튼 달기
							$.each(data, function(index) {
								$("#"+this.filmName).click(function() {
									Bom2.popup(project,arr[index]);
								});
							});
							
							
							$("#movie_list").css({
								"padding-top" : "20px",
								"padding-left" : "20px",
								"padding-right" : "20px",
								"background":"white",
								"height":"1000px",
								});
							$("#tab_movie").css("width","100%");
							$("#tab_movie tr").css({"border" : "1px solid black", "border-collapse" : "collapse", "text-align" : "center"});
							$("#tab_movie th").css({"border" : "1px solid black", "border-collapse" : "collapse", "text-align" : "center"});
							$("#tab_movie td").css({"border" : "1px solid black", "border-collapse" : "collapse", "text-align" : "center"});
							

				});
			}
 }

 
</script>