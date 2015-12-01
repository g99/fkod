<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/common.css" type="text/css" />
	<div class="ticket_wrap">
	<form action="seats.html">
		<!-- FLEX-CONTAINER -->
		<div class="ticket_flex-container">
			<div class="ticket_flex-item ticket_item1">
				<h4>영화</h4>
				<!-- CONTAINER -->
				<div id="ticket_container"> <!-- MENU -->
				<nav id="ticket_menu">
					<!-- INSET -->
					<dl class="ticket_inset">
						<!-- category -->
						<dt class="ticket_category">
							<!-- LINK -->
							<input id="ticket_resrate" class="ticket_radio" name="links"
								type="radio"> <label class="ticket_link"
								for="ticket_resrate">예매율</label>
							<!-- /// END LINK -->
							<!-- SUB -->
							<div class="ticket_sub">
								<!-- LIST category -->
								<div class="ticket_list-category">
									<dl>
										<dt>
											<a href="#">마션</a>
										</dt>
										<dt>
											<a href="#">인턴</a>
										</dt>
										<dt>
											<a href="#">탐정-더비기닝</a>
										</dt>
										<dt>
											<a href="#">팬</a>
										</dt>
										<dt>
											<a href="#">퐁네프의연인들</a>
										</dt>
										<dt>
											<a href="#">마션</a>
										</dt>
										<dt>
											<a href="#">인턴</a>
										</dt>
										<dt>
											<a href="#">탐정-더비기닝</a>
										</dt>
										<dt>
											<a href="#">팬</a>
										</dt>
										<dt>
											<a href="#">퐁네프의연인들</a>
										</dt>
										<dt>
											<a href="#">마션</a>
										</dt>
										<dt>
											<a href="#">인턴</a>
										</dt>
										<dt>
											<a href="#">탐정-더비기닝</a>
										</dt>
										<dt>
											<a href="#">팬</a>
										</dt>
										<dt>
											<a href="#">퐁네프의연인들</a>
										</dt>
										<dt>
											<a href="#">마션</a>
										</dt>
										<dt>
											<a href="#">인턴</a>
										</dt>
										<dt>
											<a href="#">탐정-더비기닝</a>
										</dt>
										<dt>
											<a href="#">팬</a>
										</dt>
										<dt>
											<a href="#">퐁네프의연인들</a>
										</dt>
									</dl>
								</div>
								<!-- /// END LIST category -->
							</div>
							<!-- /// END SUB -->
						</dt>
						<!-- /// END category -->
						<!-- category -->
						<dt class="ticket_category">
							<!-- LINK -->
							<input id="ticket_koreanorder" class="ticket_radio" name="links"
								type="radio"> <label class="ticket_link"
								for="ticket_koreanorder">가나다</label>
							<!-- /// END LINK -->
							<!-- SUB -->
							<div class="ticket_sub">
								<!-- LIST category -->
								<div class="ticket_list-category">
									<dl>
										<dt>
											<a href="#">마션</a>
										</dt>
										<dt>
											<a href="#">인턴</a>
										</dt>
										<dt>
											<a href="#">탐정-더비기닝</a>
										</dt>
										<dt>
											<a href="#">팬</a>
										</dt>
										<dt>
											<a href="#">퐁네프의연인들</a>
										</dt>
									</dl>
								</div>
								<!-- /// END LIST category -->
							</div>
							<!-- /// END SUB -->
						</dt>
						<!-- /// END category -->
					</dl>
					<!-- /// END INSET -->
				</nav>
				<!-- /// END MENU -->
				</div>
				<!-- /// END CONTAINER -->
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
				<div id="ticket_container">
				<nav id="ticket_menu">
					<dl class="ticket_inset">
						<dt class="ticket_category">
							<input id="ticket_normal" class="ticket_radio" name="links2"
								type="radio"> <label class="ticket_link"
								for="ticket_normal">일반</label>
							<div class="ticket_sub">
								<div class="ticket_list-category">
									<dl>
										<dt>
											<a href="#">강남</a>
										</dt>
										<dt>
											<a href="#">압구정</a>
										</dt>
										<dt>
											<a href="#">강변</a>
										</dt>
										<dt>
											<a href="#">목동</a>
										</dt>
										<dt>
											<a href="#">명동</a>
										</dt>
										<dt>
											<a href="#">대학로</a>
										</dt>
										<dt>
											<a href="#">강동</a>
										</dt>
										<dt>
											<a href="#">구로</a>
										</dt>
										<dt>
											<a href="#">강남</a>
										</dt>
										<dt>
											<a href="#">압구정</a>
										</dt>
										<dt>
											<a href="#">강변</a>
										</dt>
										<dt>
											<a href="#">목동</a>
										</dt>
										<dt>
											<a href="#">명동</a>
										</dt>
										<dt>
											<a href="#">대학로</a>
										</dt>
										<dt>
											<a href="#">강동</a>
										</dt>
										<dt>
											<a href="#">구로</a>
										</dt>
									</dl>
								</div>
							</div>
						</dt>
						<dt class="ticket_category">
							<input id="ticket_art" class="ticket_radio" name="links2"
								type="radio"> <label class="ticket_link"
								for="ticket_art">아트</label>
							<div class="ticket_sub">
								<div class="ticket_list-category">
									<dl>
										<dt>
											<a href="#">강남</a>
										</dt>
										<dt>
											<a href="#">압구정</a>
										</dt>
									</dl>
								</div>
							</div>
						</dt>
					</dl>
				</nav>
				</div>
			</div>
			<div class="ticket_flex-item ticket_item3">
				<h4>날짜</h4>
				<div class="ticket_date">
					<input type="date" name="bday" min="2015-11-05" max="2015-12-05"><br>
				</div>
			</div>
			<div class="ticket_flex-item ticket_item4">
				<h4>시간</h4>
				<div class="ticket_times">
					<div class="ticket_list-category">
						<label class="ticket_hall">6관</label>
						<dl>
							<dt>
								<a href="#">⊙08:00</a>
							</dt>
							<dt>
								<a href="#">10:30</a>
							</dt>
							<dt>
								<a href="#">13:00</a>
							</dt>
							<dt>
								<a href="#">15:30</a>
							</dt>
							<dt>
								<a href="#">18:00</a>
							</dt>
							<dt>
								<a href="#">20:30</a>
							</dt>
							<dt>
								<a href="#">23:00</a>
							</dt>
							<dt>
								<a href="#">★01:30</a>
							</dt>
						</dl>
					</div>
				</div>
				<input id="ticket_choiceseat" class="ticket_choiceseat" name="next" type="submit">
				<label class="ticket_choiceseatlabel" for="ticket_choiceseat">좌석선택</label>
			</div>
		</div>
		</form>
	</div>
<script type="text/javascript">
$(function() {
	//Global.init();
	$('#header').load('${context}/admin.do?page=header');
	$('#footer').load('${context}/admin.do?page=footer');
	
	$('#mgmt_member').click(function() {
		Admin.memberList();
	});
});
var Ticket = {
		movieList : function() {
			$.getJSON('${context}/admin.do?page=member_list', function(data) {
				var table = 
					'<table id="tab_member"><tr><th>아이디</th><th>이름</th><th>성별</th><th>생년원일</th><th>전화번호</th><th>이메일</th></tr>';
					$.each(data, function() {		// ajax의 for문
						table += '<tr><td>'+this.userid+'</td><td>'+this.name+'</td><td>'+this.gender+'</td><td>'+this.birth+'</td><td>'+this.phone+'</td><td>'+this.email+'</td></tr>';
					});
					table += '</table>';
					$(table).appendTo($('#main_right').empty());
			});
		},
		memberNotExist : function() {
			var table = '<h1 style="margin-top:10px">회원목록</h1>';
			table += '<table id="tab_member"><tr><th>아이디</th><th>이름</th><th>성별</th><th>생년원일</th><th>전화번호</th><th>이메일</th></tr>';
			table += '<tr><td colspan="6"><h2>회원목록이 없습니다.</h2></td></tr></table>';
			$(table).appendTo($('#main_right').empty());
		}
};
</script>