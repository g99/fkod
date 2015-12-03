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
});	
/*  $('#btn_admin_table').click(function() {
    $('#btn_admin_table').submit();
  }); */
 
</script>