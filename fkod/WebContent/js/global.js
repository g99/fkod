var Global = {

   init : function() {
      var wrapper = document.createElement("div");
      wrapper.id = "wrapper";
      document.body.appendChild(wrapper);
      
      $("<div id='header'></div>").appendTo($("#wrapper"));
      $("<div id='outbox'></div>").appendTo($("#wrapper"));
         $("<div id='box'></div>").appendTo($("#outbox"));
      $("<div id='footer'></div>").appendTo($("#wrapper"));
   }
};
/*=======================================================================================================*/
/*=======================================================================================================*/
/*=======================================================================================================*/
var Member = {
		login : function(project) {
			$.ajax(project + "/member/Member.do?page=login",{
				data : {
					id : $(".form-2 input:text[name=login]").val(),
					pw : $(".form-2 input:password[name=password]").val()
				},
				dataType : "json",
				success : function(data) {
					//로그인 결과가 성공이면
					if(data.result === "success"){
						$("#frm_toggle").empty().load(project + "/global/Main.do?page=header #frm_logined");
						// 관리자 아이디로 확인되면
						if(data.admin === "yes") {
							$("#outbox").append(
								'<table id="admin_nav"><tr><td><a href="#" id="admin_home">홈</a></td></tr>'+
								'<tr><td><a href="#" id="admin_member">회원관리</a></td></tr>'+
								'<tr><td><a href="#" id="admin_movie">영화관리</a></td></tr>'+
								'<tr><td><a href="#" id="admin_statistics">통계보기</a></td></tr>'+
								'<tr><td><a href="#" id="admin_board">게시판관리</a></td></tr></table>');
							$("#admin_nav").css({
											"text-align": "center",
											"height": "450px",
											"background": "rgba(105, 4, 4, 0.41)",
											"position": "absolute",
											"right": "20px",
											"top": "40px"
							});
							$("#admin_nav a").css({
												"border":"none",
												"color":"white",
												"font-weight":"900"
												});
						}
					} else{
					//로그인 결과가 실패면
						alert("아이디 패스워드를 다시한번 확인해주세요");
					}
				},
				error : function() {
					
				}
			});
		},
		logout : function(project) {
			$.ajax(project + "/member/Member.do?page=logout",{
				dataType : "json",
				success : function(data) {
					$("#frm_toggle").empty().load(project + "/global/Main.do?page=header #frm_login");
					$("#box").load(project + "/global/Main.do?page=default");
					$("#admin_nav").remove();
				},
				error : function() {
				}
			});
		},
		
		/* 회원가입 html */
		memberJoin : function(project) {
			$('#big_wrap').html('<link rel="stylesheet" href="../css/member.css" />'
			+'<html id="main_Html"><div id="mainDiv" class="wrap"><div id="subDiv"><h3 class="inline">&nbsp;&nbsp;본인 인증</h3>'
			+'<h5 class="inline">&nbsp;&nbsp;&nbsp;안전한 서비스 이용을 위해 본인확인을 진행하고 있습니다.</h5>'
			+'<br><br><br><h4>&nbsp;&nbsp;&nbsp;본인인증시 제공되는 정보는 해당 사이트에서 직접 수령하며,인증 이외의 용도로 이용 또는 저장하지 않습니다.</h4><br><br>'
			+'<div id="imgDiv"><img src="../images/lock.png" alt="" /><br><br><img id="join" src="../images/join.PNG" alt="" /></div>'
			+'<br><br><br><br><br><br><br><br><p id ="p_f">&nbsp;&nbsp;&nbsp;입력하신 소중한 개인정보는 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않으며,자사의 보안시스템을 통해 외부위협으로부터 보호하고 있습니다.</p></div></html>'
			);
			
			$("#join").click(function(){
			Member.webEmpty();
			Member.provision(project);
			
			});
			
		},
		
		
		/* 약관 html 로드 */
		provision : function(project) {
			$('#big_wrap').load(project + '/member/Member.do?page=provision' )
		},
		
		
		
		/* 박스 비우기 */
		webEmpty : function() {
			$('').appendTo($('#big_wrap').empty());
		},
		
		
		
		/* 마이페이지 상세화면 */
		detail : function() {
			$.getJSON('${context}/member.do?page=detail&userid=${member.id}', function(data){
			var table =	'<div id ="photo"><img src="${context}/images/${member.profile}" alt="" /><div id = "inphoto"><input type="file" /></div></div>'
			+'<div><table id="tab_mypage"><tr><th>항목</th><th id = "thone">내용</th></tr>'
			+'<tr><td>아이디</td><td>${member.userid}</td></tr><tr><td>비밀번호</td><td>${member.password}</td></tr><tr><td>이름</td><td>${member.name}</td></tr>'
			+'<tr><td>생년</td><td>${member.birth}</td></tr><tr><td>전화번호</td><td>${member.phone}</td></tr><tr><td>이메일</td><td>${member.email}</td></tr>'
			+'<tr><td>성별</td><td>${member.gender}</td></tr><tr><td>주소</td><td>${member.addr}</td></tr><tr><td>등록일</td><td>${member.regdate}</td></tr><tr><td>프로필사진</td><td>${member.profile}</td></tr>'
			+'<tr><td></td><td><input type="button" value="확인"/><input type="button" id="change" value="정보수정"/><button id ="remove">회원탈퇴</button></td></tr></table></div>';
			Member.style();
			$('#box').html(table);
			
			$('#change').click(function() {
				Member.updateForm();
			});
			
			$('#remove').click(function() {
				Member.remove('${member.userid}')
			});
		});
	},
	/* 내 정보 수정 */
	updateForm : function() {
		$.getJSON('${context}/member.do?page=detail&userid=${member.id}',function(data){
			$('<form action="${context}/member.do?page=detail" id="frm"></form>').appendTo($('#box').empty());
			var table = 
			'<div id ="photo"><img src="${context}/images/${member.profile}" alt="" /><div id = "inphoto"><input type="file" /></div></div>'
			+'<div><table id="tab_mypage"><tr><th>항목</th><th id = "thone">내용</th></tr>'
			+'<tr><td>아이디</td><td>${member.userid}</td></tr><tr><td>비밀번호</td><td><input type="password" id="password" placeholder="${member.password}"/></td></tr><tr><td>이름</td><td>${member.name}</td></tr>'
			+'<tr><td>생년</td><td>${member.birth}</td></tr><tr><td>전화번호</td><td><input type="text" id = "phone" placeholder="${member.phone}"/></td></tr><tr><td>이메일</td><td><input type="text" id="email" placeholder="${member.email}"/></td></tr>'
			+'<tr><td>성별</td><td>${member.gender}</td></tr><tr><td>주소</td><td><input type="text" id="addr" placeholder="${member.addr}"/></td></tr><tr><td>등록일</td><td>${member.regdate}</td></tr><tr><td>프로필사진</td><td>${member.profile}</td></tr>'
			+'<tr><td></td><td><input type="button" id="confirm" value="확인"/><input type="button" value="정보수정"/></td></tr></table></div>';
			$('#frm').html(table);
			Member.style(); 
			
			$('#confirm').click(function() {
				$('#frm').submit(function(e) {
					alert('서브밋으로 들어옴');
					$.ajax('${context}/member.do',{
					type :'get',
					data : {
						password : $('#password').val(), /*scanner.next(); */
						phone : $('#phone').val(),
						email : $('#email').val(),
						addr : $('#addr').val(),
						page : 'update'
					},
					dataType : 'json',
					success : function(data) {
						location.href = "${context}/member.do?page=mypage&userid="+data.userid;
					},
					error : function(xhr, status, msg) {
						alert('에러발생 사태:' +status+ ', 내용:'+msg);
						//error는 파라미터 개수와 위치로 그 역할을 결정하기 때문에
						//xhr은 자리를 지키고 있어야, status와 msg 가 작동한다.
					}
					});
					e.preventDefault();  /* 기본 폼태그의 서브밋을 막아라. 자스의 서브밋을 실행해라 */
				});
				$('#frm').submit();
			});		
		});
	},
	
	update : function() {
		$.ajax('',{
			
			data:{},
			dataType: '',
			
			success: function(data) {
				
			},
			error : function() {
				
			}
			
		});
	},
	
	style : function() {
		$('td').add('tr').css('border', '1px solid black').css('text-align', 'center');
		$('th').css('border', '1px solid black').css('text-align', 'center');
		$('#photo').css('float', 'left').css('height', '280px').css('border', '1px solid').css('margin-right', '30px');
		$('#inphoto').css('margin-top','225px').css('margin-left','30px');
		$('#thone').css('width', '250px');
		$('#tab_mypage').css('float', 'left').css('border-collapse','collapse');
		$('input').css('float', 'right');
	},
	
	remove : function(userid) {
		$.ajax('${context}/member.do',{
			data : {
				userid : userid,
				page : 'remove'
			},
			dataType : 'json',
			success : function(data) {
				alert('회원탈퇴 되었습니다.');
				location.href = "${context}/member.do?page=logout";
			},
			error : function(xhr, status, msg) {
				alert('에러발생 사태:' +status+ ', 내용:'+msg);
			}
		});
	}
		
	};




/*=======================================================================================================*/
/*=======================================================================================================*/
/*=======================================================================================================*/
	var Admin = {
			 	home : function(project) {
					$("#box").load(project + "/admin/Admin.do");
					document.location.hash =1; 
				},
				member : function(project) {
					 $.getJSON(project + '/admin/Admin.do?page=member_list', function(data) {
						 document.location.hash =2; 
						 var arr = [];
						 var table = '<div id="member_list"><h1>회원목록</h1>'
								+'<table id="tab_member"><tr><th>아이디</th><th>비밀번호</th>'
								+'<th>이름</th><th>생년</th><th>성별</th>'
								+'<th>전화번호</th><th>주소</th><th>이메일</th><th>등록일</th></th>';
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
														"padding-top" : "50px",
														"padding-left" : "150px",
														"background":"white",
														"height":"1000px"
														});
								$("#tab_member").css("width","90%");
								$("#tab_member").add("#tab_member tr").add("#tab_member th").add("#tab_member td").css({
									"border" : "1px solid black",
									"border-collapse" : "collapse",
									"text-align" : "center",
								});
					});
				},
				movie : function(project) {
					 $.getJSON(project + '/admin/Admin.do?movie', function(data) {
						 var table = '<h1>영화관리</h1>'
						 +
						 +'';
					});
				}
	 };
/*=======================================================================================================*/
/*=======================================================================================================*/
/*=======================================================================================================*/
	 var Bom = {
		popup : function(project,id) {
			var url = project + "/admin/Admin.do?";
			var name = "팝업";
			var style = "toolbar=no, status=no, directories=no, scrollbars=yes, location=no, resizable=no, border=0, menubar=no";
			var param = "page=member_profile&id="+id;
			var width = 400;
			var height = 500;
			var xpos = (screen.availWidth - width) / 2;
			var ypos = (screen.availHeight - height) / 2;
			style = style + ",top=" + ypos + ",left=" + xpos + ",width=" + width + ",height=" + height;
			url = url + param;
			window.open(url,"",style);
			}
		};
 /*=======================================================================================================*/
 /*=======================================================================================================*/
 /*=======================================================================================================*/
	 var Movie = {
				ranking : function(project) {
					var arr = [];
					$.getJSON(project + '/movie/Movie.do?page=movie_Chart', function(data) {
						var rank = '<div id="test"><h2>무비차트</h2></div>';
						$.each(data, function(index, value) {
							rank += '<div class="chart_rank" id="chart_rank'+index+'"><div class="chart_ranking chart_font_17 chart_bold">'+'NO.'+(index+1)+'</div><a href="#" id='+this.filmNumber+'>'
									+'<img src="../images/'+this.filmNumber+'.jpg" alt="" width="250" height="350"></a><div class="chart_desc chart_bold">'+this.filmName+'</div></div>';
							arr.push(this.filmNumber);
						});
										
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

				},
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
				
			}
		};