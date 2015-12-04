<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="div_admin_movie">
<table id="tab_admin_movie">
	<tr>
		<th>영화번호</th>
		<td id="movie_filmNumber">${movie.filmNumber}</td>
	</tr>
	<tr>
		<th>영화이름</th>
		<td id="movie_filmName">${movie.filmName}</td>
	</tr>
	<tr>
		<th>감독</th>
		<td id="movie_director">${movie.director}</td>
	</tr>
	<tr>
		<th>배우</th>
		<td id="movie_actor">${movie.actor}</td>
	</tr>
	<tr>
		<th>등급</th>
		<td id="movie_rate">${movie.rate}</td>
	</tr>
	<tr>
		<th>런타임</th>
		<td id="movie_runtime">${movie.runtime}</td>
	</tr>
	<tr>
		<th>가격</th>
		<td id="movie_price">${movie.price}</td>
	</tr>
	<tr>
		<th>장르</th>
		<td id="movie_genre">${movie.genre}</td>
	</tr>
	<tr>
		<th>개봉일</th>
		<td id="movie_releaseDate">${movie.releaseDate}</td>
	</tr>	
	<tr>
		<th>종료일</th>
		<td id="movie_endDate">${movie.endDate}</td>
	</tr>	<tr>
		<th>줄거리</th>
		<td id="movie_story">${movie.story}</td>
	</tr>	
	<tr>
		<th>스틸컷</th>
		<td id="movie_cut">${movie.cut}</td>
	</tr>
	<tr>
		<th>트레일러</th>
		<td id="movie_trailer">${movie.trailer}</td>
	</tr>
</table>
	<button id="delete_movie" style="float:left">삭제</button>
	<button id="update_movie" style="float:right; margin-right:10px;">등록</button>
	<button id="modify_movie" style="float:right; margin-right:10px;">수정</button>
</div>
<script src="${context}/js/global.js"></script>
<script type="text/javascript">

	$(function() {
		$("#update_movie").css("display","none");
		$("#delete_movie").click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				$.ajax("${context}/admin/Admin.do?page=delete",{
					data : {
						id : $("#member_id").text(),
					},
					dataType : "json",
					success : function(data) {
						$("#div_admin_movie").html(data.result);
						//부모창의 회원목록 버튼을 클릭하게함
						opener.document.getElementById("admin_member").click();
					},
					error : function() {
						
					}
				});	
			}
		});
		$("#modify_movie").click(function() {
			if(confirm("정말 수정하시겠습니까?")){
				var filmName = $("#movie_filmName").text();
				var story = $("#movie_story").text();
				$("#movie_story").html("<input type='text' id='input_story' value=" + story + ">");
				$("#update_movie").css("display","inline-block");
				$("#modify_movie").css("display","none");
				$("#delete_movie").css("display","none");
				//등록버튼을 누르면
				$("#update_member").click(function() {
					if(confirm("정말 등록하시겠습니까?")){
						console.log(filmName);
						$.ajax("${context}/admin/Admin.do?page=insert2",{
							data : {
								id : $("#movie_filmName").text(),
								story : $("movie_story").val(),
							},
							dataType : "json",
							success : function(data) {
								$("#div_admin_movie").html(data.result);
								//부모창의 회원목록 버튼을 클릭하게함
								opener.document.getElementById("admin_movie").click();
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