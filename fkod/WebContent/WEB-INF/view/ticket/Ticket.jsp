<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/common.css" type="text/css" />
	<div class="ticket_wrap">
	<form action="seats.html">
		<div class="ticket_flex-container">
			<div class="ticket_flex-item ticket_item1">
				<h4>영화</h4>
				<div id="ticket_container">
				<nav id="ticket_menu">
					<dl class="ticket_inset">
						<dt class="ticket_category">
							<input id="ticket_resrate" class="ticket_radio" name="links"
								type="radio"> <label class="ticket_link"
								for="ticket_resrate" id="rate_list">예매율</label>
							<div class="ticket_sub" id="movie_rate_list">
								
							</div>
						</dt>
						<dt class="ticket_category">
							<input id="ticket_koreanorder" class="ticket_radio" name="links"
								type="radio"> <label class="ticket_link"
								for="ticket_koreanorder" id="asc_list">가나다</label>
							<div class="ticket_sub" id="movie_asc_list">
								
							</div>
						</dt>
					</dl>
				</nav>
				</div>
			</div>
			<div class="ticket_flex-item ticket_item2">
				<h4>극장</h4>
				<div class="ticket_bookmark">
					<label class="ticket_subtitle">자주 가는 극장</label>
					<div class="ticket_list-category">
						<dl>
							<dt>
								<a href="#">강남점</a>
							</dt>
							<dt>
								<a href="#">압구정점</a>
							</dt>
							<dt>
								<a href="#">강변점</a>
							</dt>
						</dl>
					</div>
				</div>
				<div class="ticket_normal">
					<label class="ticket_subtitle">일반</label>
					<div id="theater_list">
					
					</div>
				</div>
			</div>
			<div class="ticket_flex-item ticket_item3">
				<h4>날짜</h4>
				<div class="ticket_normal">
					<label class="ticket_subtitle">12월</label>
					<div id="date_list">
					
					</div>
				</div>
			</div>
			<div class="ticket_flex-item ticket_item4">
				<h4>시간</h4>
				<div class="ticket_times" id="times_list">
					
				</div>
				<input id="ticket_choiceseat" class="ticket_choiceseat" name="next" type="submit">
				<label class="ticket_choiceseatlabel" for="ticket_choiceseat">좌석선택</label>
			</div>
		</div>
		</form>
	</div>
<script type="text/javascript">

$(function() {
	var res_info = {
			movie : null,
			theater : null,
			date : null
	};
	/* 리스트 초기화 */
	
	var movie_asc_list = 
		'<div class="ticket_list-category"><dl><dt><a href="#">마션</a></dt><dt><input type="radio" name="movie" value="인턴"/> 인턴</dt><dt><a href="#">탐정-더비기닝</a></dt><dt><a href="#">팬</a></dt><dt><a href="#">퐁네프의연인들</a></dt></dl></div>';
	$(movie_asc_list).appendTo($('#movie_asc_list').empty());
	var theater_list = '<div class="ticket_list-category"><dl><dt><input type="radio" name="theater" value="강남"/> 강남</dt><dt><a href="#">압구정</a></dt><dt><a href="#">강변</a></dt><dt><a href="#">목동</a></dt><dt><a href="#">명동</a></dt><dt><a href="#">대학로</a></dt><dt><a href="#">강동</a></dt><dt><a href="#">구로</a></dt><dt><a href="#">강남</a></dt><dt><a href="#">압구정</a></dt><dt><a href="#">강변</a></dt><dt><a href="#">목동</a></dt><dt><a href="#">명동</a></dt><dt><a href="#">대학로</a></dt><dt><a href="#">강동</a></dt><dt><a href="#">구로</a></dt></dl></div>';
	$(theater_list).appendTo($('#theater_list').empty());
	var date_list = '<div class="ticket_list-category"><dl><dt><input type="radio" name="date" value="3"/> 3</dt><dt><a href="#">4</a></dt><dt><a href="#">5</a></dt><dt><a href="#">6</a></dt><dt><a href="#">7</a></dt><dt><a href="#">8</a></dt><dt><a href="#">9</a></dt><dt><a href="#">10</a></dt><dt><a href="#">11</a></dt><dt><a href="#">12</a></dt><dt><a href="#">13</a></dt><dt><a href="#">14</a></dt></dl></div>';
	$(date_list).appendTo($('#date_list').empty());
	var times_list = '';
	$(times_list).appendTo($('#times_list').empty());
	
	$('.ticket_sub').click(function() {
		var theater_list = '<div class="ticket_list-category"><dl><dt><input type="radio" name="theater" value="강남"/> 강남</dt></dl></div>';
		$(theater_list).appendTo($('#theater_list').empty());
		var date_list = '<div class="ticket_list-category"><dl><dt><a href="#">3</a></dt><dt><a href="#">4</a></dt><dt><a href="#">5</a></dt><dt><a href="#">6</a></dt><dt><a href="#">7</a></dt><dt><a href="#">8</a></dt></dl></div>';
		$(date_list).appendTo($('#date_list').empty());
		res_info.movie=$("input:radio[name=movie]:checked").val();
		alert(res_info.movie+", "+res_info.theater+", "+res_info.date);
		if (res_info.movie!=null&&res_info.theater!=null&&res_info.date!=null) {
			var times_list = '<div class="ticket_list-category"><label class="ticket_hall">6관</label><dl><dt><a href="#">⊙08:00</a></dt><dt><a href="#">10:30</a></dt><dt><a href="#">13:00</a></dt><dt><a href="#">15:30</a></dt><dt><a href="#">18:00</a></dt><dt><a href="#">20:30</a></dt><dt><a href="#">23:00</a></dt><dt><a href="#">★01:30</a></dt></dl></div>';
			$(times_list).appendTo($('#times_list').empty());
		}
	});
	$('#theater_list').click(function() {
		var movie_rate_list = 
			'<div class="ticket_list-category"><dl><dt><input type="radio" name="movie" value="마션"/> 마션</dt></dl></div>';
		$(movie_rate_list).appendTo($('#movie_rate_list').empty());
		var movie_asc_list = 
			'<div class="ticket_list-category"><dl><dt><input type="radio" name="movie" value="인턴"/> 인턴</dt></dl></div>';
		$(movie_asc_list).appendTo($('#movie_asc_list').empty());
		var date_list = '<div class="ticket_list-category"><dl><dt><input type="radio" name="date" value="7"/> 7</dt><dt><a href="#">8</a></dt></dl></div>';
		$(date_list).appendTo($('#date_list').empty());
		res_info.theater=$("input:radio[name=theater]:checked").val();
		alert(res_info.movie+", "+res_info.theater+", "+res_info.date);
		if (res_info.movie!=null&&res_info.theater!=null&&res_info.date!=null) {
			var times_list = '<div class="ticket_list-category"><label class="ticket_hall">6관</label><dl><dt><a href="#">⊙08:00</a></dt><dt><a href="#">10:30</a></dt><dt><a href="#">13:00</a></dt><dt><a href="#">15:30</a></dt><dt><a href="#">18:00</a></dt><dt><a href="#">20:30</a></dt><dt><a href="#">23:00</a></dt><dt><a href="#">★01:30</a></dt></dl></div>';
			$(times_list).appendTo($('#times_list').empty());
		}
	});
	$('#date_list').click(function() {
		var movie_rate_list = 
			'<div class="ticket_list-category"><dl><dt><input type="radio" name="movie" value="마션"/> 마션</dt><dt><a href="#">인턴</a></dt><dt><a href="#">탐정-더비기닝</a></dt><dt><a href="#">팬</a></dt><dt><a href="#">퐁네프의연인들</a></dt><dt><a href="#">마션</a></dt><dt><a href="#">인턴</a></dt><dt><a href="#">탐정-더비기닝</a></dt><dt><a href="#">팬</a></dt><dt><a href="#">퐁네프의연인들</a></dt><dt><a href="#">마션</a></dt><dt><a href="#">인턴</a></dt><dt><a href="#">탐정-더비기닝</a></dt></dl></div>';
		$(movie_rate_list).appendTo($('#movie_rate_list').empty());
		var movie_asc_list = 
			'<div class="ticket_list-category"><dl><dt><input type="radio" name="movie" value="탐정-더비기닝"/> 탐정-더비기닝</a></dt><dt><a href="#">팬</a></dt><dt><a href="#">퐁네프의연인들</a></dt></dl></div>';
		$(movie_asc_list).appendTo($('#movie_asc_list').empty());
		var theater_list = '<div class="ticket_list-category"><dl><dt><input type="radio" name="theater" value="압구정"/> 압구정</dt><dt><a href="#">강변</a></dt></dl></div>';
		$(theater_list).appendTo($('#theatesr_list').empty());
		res_info.date=$("input:radio[name=date]:checked").val();
		alert(res_info.movie+", "+res_info.theater+", "+res_info.date);
		if (res_info.movie!=null&&res_info.theater!=null&&res_info.date!=null) {
			var times_list = '<div class="ticket_list-category"><label class="ticket_hall">6관</label><dl><dt><a href="#">⊙08:00</a></dt><dt><a href="#">10:30</a></dt><dt><a href="#">13:00</a></dt><dt><a href="#">15:30</a></dt><dt><a href="#">18:00</a></dt><dt><a href="#">20:30</a></dt><dt><a href="#">23:00</a></dt><dt><a href="#">★01:30</a></dt></dl></div>';
			$(times_list).appendTo($('#times_list').empty());
		}
	});
	var Ticket = {
			movieList : function() {
				$.getJSON('${context}/ticket/Ticket.do?page=temp', function(data) {
					var movie_rate_list = 
						'<div class="ticket_list-category"><dl>';
						$.each(data, function() {
							movie_rate_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
						});
						movie_rate_list += '</dl></div>';
						$(movie_rate_list).appendTo($('#movie_rate_list').empty());
				});
			}
	};
	Ticket.movieList();
});

</script>