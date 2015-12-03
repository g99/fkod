<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	* {padding:0; margin:0;}
	.tabs li {
		list-style:none;
		display:inline;
	}
	.tabs a {
		padding:5px 10px;
		display:inline-block;
		background:#666;
		color:#fff;
		text-decoration:none;
	}
	.tabs a.active {
		background:#fff;
		color:#000;
	}
</style>

<link rel="stylesheet" href="../css/common.css" type="text/css" />
	<div class="ticket_wrap">
		<div class="ticket_flex-container">
			<div class="ticket_flex-item ticket_item1">
				<h4>영화</h4>
				<div id="ticket_container">
				<nav id="ticket_menu">
					<ul class='tabs'>
					    <li><a href='#tab1'>예매율</a></li>
					    <li><a href='#tab2'>가나다</a></li>
					</ul>
					<form action="" id="movie_list">
					  <div id='tab1' class="ticket_sub">
					  
					  </div>
					  <div id='tab2' class="ticket_sub">
					  
					  </div>
					 </form>
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
	</div>
<script src="${context}/js/tab.js"></script>
<script type="text/javascript">
$(function() {
	tabs.make();
	Ticket.initList();
	
	$('.ticket_sub').click(function() {Ticket.ticket_sub();});
	$('#theater_list').click(function() {Ticket.theater_list();});
	$('#date_list').click(function() {Ticket.date_list();});
	
});
var Ticket = {
		movie : null,
		theater : null,
		date : null,
		time : null,
		
		ticket_sub : function() {
			alert(this.movie+", "+this.theater+", "+this.date);
			$.ajax('${context}/ticket/Ticket.do',{
				type : 'get',
				data : {
					movie : $("input:radio[name=movie]:checked").val(),
					theater : $("input:radio[name=theater]:checked").val(),
					date : $("input:radio[name=date]:checked").val(),
					page : "movieSelect"
				},
				async : true,
				dataType : 'json',
				success : function(data) {
					if (Ticket.movie===null) {
						alert("기존"+Ticket.movie+"현재선택"+$("input:radio[name=movie]:checked").val());
						var theater_list = 
							'<div class="ticket_list-category"><dl>';
							$.each(data, function(index,val) {
								if (index===0) {
								$.each(val, function() {
									theater_list += '<dt><input type="radio" name="theater" value="'+this+'"/>'+this+'</dt>';
								});
								}
							});
							theater_list += '</dl></div>';
							$(theater_list).appendTo($('#theater_list').empty());
					}
					if (Ticket.date===null) {
						var date_list = 
							'<div class="ticket_list-category"><dl>';
							$.each(data, function(index,val) {
								if (index===1) {
								$.each(val, function() {
									date_list += '<dt><input type="radio" name="date" value="'+this+'"/>'+this+'</dt>';
								});
								}
							});
							date_list += '</dl></div>';
							$(date_list).appendTo($('#date_list').empty());
					}
					if (Ticket.movie!=null&&Ticket.theater!=null&&Ticket.date!=null) {
						var times_list = 
							'<div class="ticket_list-category"><dl>';
							$.each(data, function(index,val) {
								if (index===2) {
								$.each(val, function() {
									times_list += '<dt><input type="radio" name="date" value="'+this+'"/>'+this+'</dt>';
								});
								}
							});
							times_list += '</dl></div>';
							$(times_list).appendTo($('#times_list').empty());
					}
				},
				error : function(xhr, status, msg) {
					alert('에러발생상테 : '+status+',내용:'+msg);
				}
			});
			this.movie=$("input:radio[name=movie]:checked").val();
			alert(this.movie+", "+this.theater+", "+this.date);
		},
	theater_list: function() {
		alert(this.movie+", "+this.theater+", "+this.date);
		$.ajax('${context}/ticket/Ticket.do',{
			type : 'get',
			data : {
				movie : $("input:radio[name=movie]:checked").val(),
				theater : $("input:radio[name=theater]:checked").val(),
				date : $("input:radio[name=date]:checked").val(),
				page : "theaterSelect"
			},
			async : true,
			dataType : 'json',
			success : function(data) {
				if (Ticket.movie===null) {
					var movie_rate_list = 
						'<div class="ticket_list-category"><dl>';
						$.each(data, function(index,val) {
							if (index===0) {
							$.each(val, function() {
							movie_rate_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
							});
							}
						});
						movie_rate_list += '</dl></div>';
						$(movie_rate_list).appendTo($('#tab1').empty());
					var movie_asc_list = 
						'<div class="ticket_list-category"><dl>';
						$.each(data, function(index,val) {
							if (index===1) {
							$.each(val, function() {
								movie_asc_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
							});
							}
						});
						movie_asc_list += '</dl></div>';
						$(movie_asc_list).appendTo($('#tab2').empty());
				}
				if (Ticket.date===null) {
				var date_list = 
					'<div class="ticket_list-category"><dl>';
					$.each(data, function(index,val) {
						if (index===2) {
						$.each(val, function() {
							date_list += '<dt><input type="radio" name="date" value="'+this+'"/>'+this+'</dt>';
						});
						}
					});
					date_list += '</dl></div>';
					$(date_list).appendTo($('#date_list').empty());
				}
				if (Ticket.movie!=null&&Ticket.theater!=null&&Ticket.date!=null) {
					var times_list = 
						'<div class="ticket_list-category"><dl>';
						$.each(data, function(index,val) {
							if (index===3) {
							$.each(val, function() {
								times_list += '<dt><input type="radio" name="date" value="'+this+'"/>'+this+'</dt>';
							});
							}
						});
						times_list += '</dl></div>';
						$(times_list).appendTo($('#times_list').empty());
				}
			},
			error : function(xhr, status, msg) {
				alert('에러발생상테 : '+status+',내용:'+msg);
			}
		});
		this.theater=$("input:radio[name=theater]:checked").val();
		alert(this.movie+", "+this.theater+", "+this.date);
	},
	date_list : function() {
		
		alert(this.movie+", "+this.theater+", "+this.date);
		$.ajax('${context}/ticket/Ticket.do',{
			type : 'get',
			data : {
				movie : $("input:radio[name=movie]:checked").val(),
				theater : $("input:radio[name=theater]:checked").val(),
				date : $("input:radio[name=date]:checked").val(),
				page : "dateSelect"
			},
			async : true,
			dataType : 'json',
			success : function(data) {
				if (Ticket.movie===null) {
					var movie_rate_list = 
						'<div class="ticket_list-category"><dl>';
						$.each(data, function(index,val) {
							if (index===0) {
							$.each(val, function() {
							movie_rate_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
							});
							}
						});
						movie_rate_list += '</dl></div>';
						$(movie_rate_list).appendTo($('#tab1').empty());
					var movie_asc_list = 
						'<div class="ticket_list-category"><dl>';
						$.each(data, function(index,val) {
							if (index===1) {
							$.each(val, function() {
								movie_asc_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
							});
							}
						});
						movie_asc_list += '</dl></div>';
						$(movie_asc_list).appendTo($('#tab2').empty());
				}
				if (Ticket.theater===null) {
				var theater_list = 
					'<div class="ticket_list-category"><dl>';
					$.each(data, function(index,val) {
						if (index===2) {
						$.each(val, function() {
							theater_list += '<dt><input type="radio" name="theater" value="'+this+'"/>'+this+'</dt>';
						});
						}
					});
					theater_list += '</dl></div>';
					$(theater_list).appendTo($('#theater_list').empty());
				}
				if (Ticket.movie!=null&&Ticket.theater!=null&&Ticket.date!=null) {
					var times_list = 
						'<div class="ticket_list-category"><dl>';
						$.each(data, function(index,val) {
							if (index===3) {
							$.each(val, function() {
								times_list += '<dt><input type="radio" name="date" value="'+this+'"/>'+this+'</dt>';
							});
							}
						});
						times_list += '</dl></div>';
						$(times_list).appendTo($('#times_list').empty());
				}
			},
			error : function(xhr, status, msg) {
				alert('에러발생상테 : '+status+',내용:'+msg);
			}
		});
		this.date=$("input:radio[name=date]:checked").val();
		alert(this.movie+", "+this.theater+", "+this.date);
	},
	
	initList : function() {
		$.getJSON('${context}/ticket/Ticket.do?page=initList', function(data) {
			var movie_rate_list = 
				'<div class="ticket_list-category"><dl>';
				$.each(data, function(index,val) {
					if (index===0) {
					$.each(val, function() {
					movie_rate_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
					});
					}
				});
				movie_rate_list += '</dl></div>';
				$(movie_rate_list).appendTo($('#tab1').empty());
			var movie_asc_list = 
				'<div class="ticket_list-category"><dl>';
				$.each(data, function(index,val) {
					if (index===1) {
					$.each(val, function() {
						movie_asc_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
					});
					}
				});
				movie_asc_list += '</dl></div>';
				$(movie_asc_list).appendTo($('#tab2').empty());
			var theater_list = 
				'<div class="ticket_list-category"><dl>';
				$.each(data, function(index,val) {
					if (index===2) {
					$.each(val, function() {
						theater_list += '<dt><input type="radio" name="theater" value="'+this+'"/>'+this+'</dt>';
					});
					}
				});
				theater_list += '</dl></div>';
				$(theater_list).appendTo($('#theater_list').empty());
				
			var date_list = 
				'<div class="ticket_list-category"><dl>';
				$.each(data, function(index,val) {
					if (index===3) {
					$.each(val, function() {
						date_list += '<dt><input type="radio" name="date" value="'+this+'"/>'+this+'</dt>';
					});
					}
				});
				date_list += '</dl></div>';
				$(date_list).appendTo($('#date_list').empty());
			var times_list = '';
			$(times_list).appendTo($('#times_list').empty());
		});
	}
};

</script>