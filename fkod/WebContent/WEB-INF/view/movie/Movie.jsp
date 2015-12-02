<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="movie_wrap" style="border-color: "></div>



<script>

$(function() {
	$('#movie_wrap').css('margin-left', '100px').css('border-collapse', 'collapse');
	
	movie.movieInfo();
});
	var movie = {
		movieInfo : function() {
				$.getJSON('${context}/movie/Movie.do?page=movie_info',function(data) {
					var movieInfo = '<h1>무비페이지</h1>'
						+'<div id="movie_info"><div id="movie_poster"><img id="movie_float" src="../images/ma01.jpg;" alt="" width="250" height="350" /></div>'
						+'<h2>'+this.film_name+'</h2><table id="movie_tab" style= "border : 1px solid black"><tr><th style="color: grey; font-size: 18px">예매율</th><td>10.5%</td></tr><tr><th>감독</th>'
						+'<td>리들리 스콧</td><tr><th>배우</th><td>맷 데이먼,제시카 차스테인,제프 다니엘스,케이트 마라,크리스틴 위그</td></tr>'
						+'<tr><th>장르</th><td>액션,어드벤쳐,SF</td></tr><tr><th>기본</th><td>12세이상,142분,미국</td></tr><tr><th>개봉</th>'
						+'<td>2015.10.08 <a href="../ticket/ticket.html"><input type="button" value="바로 예매" class="movie_font_20 movie_bold movie_bg_color_green movie_txt_color_white "></a></td></tr></table>'
						+'<div class="movie_margin_auto"></div><br /><div class="movie_infonavi movie_font_20"><ul><li><a href="#movie_story">영화스토리</a></li>'
						+'<li><a href="#movie_tra">트레일러</a></li><li><a href="#movie_cut">스틸컷</a></li><li><a href="#movie_review">리뷰</a></li></ul></div></div>';
						$(movieInfo).appendTo($('#movie_wrap'));
						$('#movie_info').css('border', '1px solid black').css('width', '1300px').css('height', '500px').css('margin','20px');
						$('#movie_poster').css('float', 'left').css('border', '1px solid black').css('width', '250px').css('height', '350px').css('margin', 'auto').css('margin-right','30px');
						$('#movie_float').css('float', 'left');
						$('#movie_tab').css('border', '1px solid black').css('width', '400px').css('height', '300px').css('border-collapse', 'collapse');	
				});
				
		}
	};

</script>