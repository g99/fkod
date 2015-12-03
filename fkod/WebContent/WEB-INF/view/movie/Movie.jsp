<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="movie_wrap"  ></div>



<script>

$(function() {
	$('#movie_wrap').css('margin-left', '100px').css('border-collapse', 'collapse');
	movie.ranking();
	/* movie.movieName(); */
	
});
	$(function() {
		$('#movie_wrap').submit();
	});
	var movie = {
		movieInfo : function() {
				$.getJSON('${context}/movie/Movie.do?page=movie_info',function(data) {
					var movieInfo = "";
					$.each(data, function() {
						movieInfo = '<h1>무비페이지</h1>'
							+'<div id="movie_info"><div id="movie_poster"><img id="movie_float" src="../images/ma01.jpg;" alt="" width="250" height="350" /></div>'
							+'<h2>${movie.filmName}</h2>'
							+'<table id="movie_tab" style= "border : 1px solid black"><tr><th style="color: grey; font-size: 18px">예매율</th><td>10.5%</td></tr><tr><th>감독</th>'
							+'<td>리들리 스콧</td><tr><th>배우</th><td>맷 데이먼,제시카 차스테인,제프 다니엘스,케이트 마라,크리스틴 위그</td></tr>'
							+'<tr><th>장르</th><td>액션,어드벤쳐,SF</td></tr><tr><th>기본</th><td>12세이상,142분,미국</td></tr><tr><th>개봉</th>'
							+'<td>2015.10.08 <a href="../ticket/ticket.html"><input type="button" value="바로 예매" class="movie_font_20 movie_bold movie_bg_color_green movie_txt_color_white "></a></td></tr></table>'
							+'<div class="movie_margin_auto"></div><br /><div class="movie_infonavi movie_font_20"><ul><li><a href="#movie_story">영화스토리</a></li>'
							+'<li><a href="#movie_tra">트레일러</a></li><li><a href="#movie_cut">스틸컷</a></li><li><a href="#movie_review">리뷰</a></li></ul></div></div>';
					});
					
						$(movieInfo).appendTo($('#movie_wrap'));
						$('#movie_info').css('border', '1px solid black').css('width', '1300px').css('height', '500px').css('margin','20px');
						$('#movie_poster').css('float', 'left').css('border', '1px solid black').css('width', '250px').css('height', '350px').css('margin', 'auto').css('margin-right','30px');
						$('#movie_float').css('float', 'left');
						$('#movie_tab').css('border', '1px solid black').css('width', '400px').css('height', '300px').css('border-collapse', 'collapse');	
				});
				
		},
		movieName : function(data) {
 			$.getJSON('${context}/movie/Movie.do?page=movie_name&filmNumber='+data.filmNumber, 
			/* $.getJSON('${context}/movie/Movie.do?page=movie_name&filmNumber='+'a001', */
					
					function(data) {
						
						var movieInfom = '<h1>무비페이지</h1>'
							+'<div id="movie_info"><div id="movie_poster"><img id="movie_float" src="../images/'+data.filmNumber+'.jpg;" alt="" width="250" height="350" /></div>'
							+'<h2>'+data.filmName+'</h2>'
							+'<table id="movie_tab" style= "border : 1px solid black"><tr><th style="color: grey; font-size: 18px">예매율</th><td>10.5%</td></tr><tr><th>감독</th>'
							+'<td>'+data.director+'</td><tr><th>배우</th><td>'+data.actor+'</td></tr>'
							+'<tr><th>장르</th><td>'+data.genre+'</td></tr><tr><th>기본</th><td>'+data.rate+', '+data.runtime+'분 '+'</td></tr><tr><th>개봉</th>'
							+'<td>'+data.releaseDate+' <a href="../ticket/ticket.html"><input type="button" value="바로 예매" class="movie_font_20 movie_bold movie_bg_color_green movie_txt_color_white "></a></td></tr></table>'
							+'<div class="movie_margin_auto"></div><br /><div class="movie_infonavi movie_font_20"><ul><li><a href="#movie_story">영화스토리</a></li>'
							+'<li><a href="#movie_tra">트레일러</a></li><li><a href="#movie_cut">스틸컷</a></li><li><a href="#movie_review">리뷰</a></li></ul></div></div>'
							+'<div id="movie_story" class="movie_story_lay movie_margin_b20"><h2>영화 스토리</h2><div class="movie_story movie_margin_a10"><pre class="movie_font_15 ">'
							+'<strong>포기란 없다!</strong><strong>반드시 지구로 돌아갈 것이다!</strong>NASA 아레스3탐사대는 화성을 탐사하던 중 모래폭풍을 만나고 팀원 마크 와트니가 사망했다고 판단,그를 남기고 떠난다. '
							+'극적으로 생존한 마크 와트니는 남은 식량과 기발한 재치로 화성에서 살아남을 방법을 찾으며 자신이 살아있음을 알리려 노력한다. <strong>마침내,자신이 살아있다는 사실을 지구에 알리게 된 마크 와트니</strong>'
							+'NASA는 총력을 기울여 마크 와트니를 구출하기 위해 노력하고,아레스 3 탐사대 또한 그를 구출하기 위해 그들만의 방법을 찾게 되는데…… <strong>전세계가 바라는 마크 와트니의 지구 귀환!그는 과연 살아 돌아올 수 있을 것인가?</strong></pre></div></div>'
							+'<div id="movie_tra" class="movie_tra_lay movie_margin_b20 "><h2>트레일러</h2><div class="movie_tra margin_l20 movie_float"><iframe width="350" height="200" src="https://www.youtube.com/embed/hAWgzLTa3gI" frameborder="0" allowfullscreen></iframe></div>'
							+'<div class="movie_tra margin_l20 movie_float"><iframe width="350" height="200" src="https://www.youtube.com/embed/90cqM3_Bfvs" frameborder="0" allowfullscreen class="margin_r30"></iframe></div>'
							+'<div class="movie_tra margin_l20 movie_float"><iframe width="350" height="200" src="https://www.youtube.com/embed/3nGdsjkBZfo" frameborder="0" allowfullscreen></iframe><br></div>'
							+'<div class="movie_tra_name movie_float movie_margin_r35"><strong>(1차 예고편)</strong></div><div class="movie_tra_name movie_float movie_margin_r30"><strong>(2차 예고편)</strong></div>'
							+'<div class="movie_tra_name movie_float"><strong>(3차 예고편)</strong></div></div><div id="movie_cut" class="movie_cut_lay movie_margin_b20">'
							+'<h2>스틸컷<a href="#"><input type="button" value="스틸컷 더보기" id="cutmore" class="movie_bold movie_bg_color_green movie_txt_color_white "></a></h2>'
							+'<div class="movie_cut movie_margin_l30  movie_float"><a href="../images/ma02.jpg"><img src="../images/ma02.jpg;" alt="" width="290" height="161" /></a></div>'
							+'<div class="movie_cut movie_margin_l20 movie_float"><a href="../images/ma03.jpg"><img src="../images/ma03.jpg;" alt="" width="290" height="161" /></a></div>'
							+'<div class="movie_cut movie_margin_l20 movie_float"><a href="../images/ma04.jpg"><img src="../images/ma04.jpg;" alt="" width="290" height="161" /></a></div>'
							+'<div class="movie_cut movie_margin_l20 movie_float"><a href="../images/ma05.jpg"><img src="../images/ma05.jpg;" alt="" width="290" height="161" /></a></div></div>'
							+'<div id="movie_review" class="movie_review_lay"><h2>리뷰</h2></div><br /><br /><div class="movie_infonavi movie_font_20"><ul><li><a href="#movie_info">영화상세</a></li>'
							+'<li><a href="#movie_story">영화스토리</a></li><li><a href="#movie_tra">트레일러</a></li><li><a href="#movie_cut">스틸컷</a></li></ul></div>';
							
						$('#movie_wrap').empty().html(movieInfom);
						$('#movie_info').css('border', '1px solid black').css('width', '1300px').css('height', '500px').css('margin','20px');
						$('#movie_poster').css('float', 'left').css('border', '1px solid black').css('width', '250px').css('height', '350px').css('margin', 'auto').css('margin-right','30px');
						$('#movie_float').css('float', 'left');
						$('#movie_tab').css('border', '1px solid black').css('width', '400px').css('height', '300px').css('border-collapse', 'collapse');
						$('#cutmore').click(function() {
							movie.cutmore(data);
						})
					});
							
		},
		cutmore : function(data) {
			$.getJSON('${context}/movie/Movie.do?page=movie_Cut&filmNumber='+data.filmNumber, function(data) {
				var movieCut ='<div><h1>영화상세<a href="#"><input type="button" value="영화정보" id="movie_home" class="cut_bold cut_bg_color_orange cut_txt_color_white "></a></h1></div>'
					+'<div id="cut_info" class="cut_info cut_margin_b20"><div class="cut_poster cut_margin_r30"><img class="float" src="../images/'+data.filmNumber+'.jpg;" alt="" width="250" height="350" /></div>'
					+'<h2>'+data.filmName+'</h2><table style="border: solid 1px white; width: 400; height: 300px"><tr><th style="color: grey; font-size: 18px">예매율</th>'
					+'<td>10.5%</td></tr><tr><th>감독</th><td>'+data.director+'</td><tr><th>배우</th><td>'+data.actor+'</td></tr>'
					+'<tr><th>장르</th><td>'+data.genre+'</td></tr><tr><th>기본</th><td>'+data.rate+', '+data.runtime+'분 '+'</td></tr>'
					+'<tr><th>개봉</th><td>'+data.releaseDate+'<a href="../ticket/ticket.html"><input type="button" value="바로 예매" class="cut_font_20 cut_bold cut_bg_color_green cut_txt_color_white "></a></td></tr></table></div>'
					+'<div class="cut_allcut_lay"><div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/ma02.jpg"><img src="../images/ma02.jpg;" alt="" width="290" height="161" /></a></div><div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/ma03.jpg"><img src="../images/ma03.jpg;" alt="" width="290" height="161" /></a></div><div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/ma04.jpg"><img src="../images/ma04.jpg;" alt="" width="290" height="161" /></a></div><div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/ma05.jpg"><img src="../images/ma05.jpg;" alt="" width="290" height="161" /></a></div><div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/ma06.jpg"><img src="../images/ma06.jpg;" alt="" width="290" height="161" /></a></div><div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/ma07.jpg"><img src="../images/ma07.jpg;" alt="" width="290" height="161" /></a></div><div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/ma08.jpg"><img src="../images/ma08.jpg;" alt="" width="290" height="161" /></a></div><div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/ma09.jpg"><img src="../images/ma09.jpg;" alt="" width="290" height="161" /></a></div><div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/ma10.jpg"><img src="../images/ma10.jpg;" alt="" width="290" height="161" /></a></div><div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/ma11.jpg"><img src="../images/ma11.jpg;" alt="" width="290" height="161" /></a></div><div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/ma12.jpg"><img src="../images/ma12.jpg;" alt="" width="290" height="161" /></a></div><div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/ma13.jpg"><img src="../images/ma13.jpg;" alt="" width="290" height="161" /></a></div></div>';
				$('#movie_wrap').empty().html(movieCut);
				$('#movie_home').click(function() {
					$('#movie_wrap').empty();
					submit(this.filmNumber);
					movie.movieName();
				});
			})
			
		},
		
		ranking : function() {
			var arr = [];
			$.getJSON('${context}/movie/Movie.do?page=movie_Chart&filmNumber', function(data) {
				var rank = '<div id="test"><h2>무비차트</h2></div>';
				$.each(data, function(index, value) {
					rank += '<div class="chart_rank" id="chart_rank'+index+'"><div class="chart_ranking chart_font_17 chart_bold">'+'NO.'+(index+1)+'</div><a href="#" id='+this.filmNumber+'>'
							+'<img src="../images/'+this.filmNumber+'.jpg" alt="" width="250" height="350"></a><div class="chart_desc chart_bold">'+this.filmName+'</div></div>';
					arr.push(this.filmNumber);
				})
								
			$('#movie_wrap').empty().append(rank);
			$.each(data, function(i, val) {
				$('#'+arr[i]).click(function() {
					alert('chart랭크 클릭이벤트들어옴' + arr[i]);
						$.ajax('${context}/movie/Movie.do', {
							data : 	{
								filmNumber :arr[i],
								page : 'movie_name'
							},
							dataType : 'json',
							success : function(data) {
								alert('ajax 성공 들어옴')
								$('#movie_wrap').empty();
							 	movie.movieName(data);
							},
							error : function(xhr, status, msg) {
								alert('에러발생 : '+ status+', 내용 : '+msg );
							}
						});
					
			});

			});
			});

		}
	
	};

</script>