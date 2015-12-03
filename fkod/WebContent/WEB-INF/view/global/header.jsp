<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<div>
	<div id="frm_toggle">
	<c:if test="${empty sessionScope.user}">
	   	<!-- 로그인 안한 상태 -->
		<div id="frm_login" class="form-2">
			<p class="float">
				<label for="login"><i class="icon-user">ID</i></label> <input type="text" name="login" placeholder="UserID">
			</p>
			<p class="float">
				<label for="password"><i class="icon-lock">PW</i></label> <input type="password" name="password" placeholder="Password" class="showpassword">
			</p>
			<p class="clearfix">
				<a id="join_btn" href="#회원가입 링크로 연결" class="log-twitter">회원 가입</a> 
				<input id="login_btn" type="submit" name="submit" value="로그인">
			</p>
		</div>
		</c:if>
		<c:if test="${not empty sessionScope.user}">
			<div id="frm_logined" class="form-2">
				<p>${user.name}님 반갑습니다.</p><p class="clearfix">
					<input id="logout_btn" type="submit" name="submit" value="로그아웃">
				</p>
			</div>
		</c:if>
		</div>

		<div id="home" class="brand" style="padding-left: 390px; padding-right: 390px;">MTB BOX</div>

		<div class="address-bar" style="padding-left: 400px; padding-right: 400px;">
		세상을 바꾸는 힘, Culture MTB(Movie Theater BOX)</div>
	</div>

	<!-- Navigation -->
    <nav class="navbar navbar-default" role="navigation" >
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="index.html">Business Casual</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style=" margin-left:33%;" >
                <ul class="nav navbar-nav">
                    <li>
                        <a id="movie_btn" href="#">영화</a> <!-- 네비바 해당 링크 존재 -->
                    </li>
                    <li>
                        <a id="ticket_btn" href="#" >예매</a>
                    </li>
                    <li>
                        <a id="theater_btn" href="#" >극장</a>
                    </li>
                    <li>
                        <a id="event_btn" href="#" >이벤트&컬쳐</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
    </nav>
    
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 메인 버튼 */
		$("#home").click(function() {
			$("#box").load("${context}/global/Main.do?page=default");
		});
		
		/* 네비게이션 버튼 */
		$("#movie_btn").click(function() {
			$("#box").load();
		});
		
		$("#ticket_btn").click(function() {
			$("#box").load();
		});
		
		$("#theater_btn").click(function() {
			$("#box").load();
		});
		
		$("#event_btn").click(function() {
			$("#box").load("${context}/global/Main.do?page=default");
		});
		
		/* 로그인 버튼 */
		$("#header").on("click","#join_btn",function() {
			//회원가입 버튼
		});
	
		$("#header").on("click","#login_btn",function() {
			Member.login();
		});
		
		$("#header").on("click","#logout_btn",function() {
			Member.logout();
		});
		
		/* 관리자 버튼 */
		$("#outbox").on("click","#admin_home",function() {
			Admin.home();
		});
		$("#outbox").on("click","#admin_member",function() {
			Admin.member();
		});
		$("#outbox").on("click","#admin_movie",function() {
			Admin.movie();
		});
	});
	var Member = {
		login : function() {
			$.ajax("${context}/member/Member.do?page=login",{
				data : {
					id : $(".form-2 input:text[name=login]").val(),
					pw : $(".form-2 input:password[name=password]").val()
				},
				dataType : "json",
				success : function(data) {
					//로그인 결과가 성공이면
					if(data.result === "success"){
						$("#frm_toggle").empty().load("${context}/global/Main.do?page=header #frm_logined");
						// 관리자 아이디로 확인되면
						if(data.admin === "yes") {
							$("#outbox").append(
								'<table id="admin_nav"><tr><td><a href="#" class="list-group-item" id="admin_home">홈</a></td></tr>'+
								'<tr><td><a href="#" class="list-group-item" id="admin_member">회원관리</a></td></tr>'+
								'<tr><td><a href="#" class="list-group-item" id="admin_movie">영화관리</a></td></tr>'+
								'<tr><td><a href="#" class="list-group-item" id="admin_statistics">통계보기</a></td></tr>'+
								'<tr><td>게시판관리</td></tr></table>');
							$("#admin_nav").css({
											"text-align": "center",
											"height": "450px",
											"background": "#fffaf6",
											"position": "absolute",
											"right": "20px",
											"top": "40px"
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
		logout : function() {
			$.ajax("${context}/member/Member.do?page=logout",{
				dataType : "json",
				success : function(data) {
					$("#frm_toggle").empty().load("${context}/global/Main.do?page=header #frm_login");
					$("#box").load("${context}/global/Main.do?page=default");
					$("#admin_nav").remove();
				},
				error : function() {
				}
			});
		}
	};
	 var Admin = {
			 	home : function() {
					$("#box").load("${context}/admin/Admin.do");
				},
				member : function() {
					 $.getJSON('${context}/admin/Admin.do?page=member_list', function(data) {
						 var table = '<div id="member_list"><h1>회원목록</h1>'
								+'<table id="tab_member"><tr><th>아이디</th><th>비밀번호</th>'
								+'<th>이름</th><th>생년</th><th>성별</th>'
								+'<th>전화번호</th><th>주소</th><th>이메일</th><th>등록일</th></th>';
								$.each(data, function() {
									table +='<tr><td>'+this.id+'</td><td>'+this.password+'</td>'
										+'<td>'+this.name+'</td><td>'+this.birth+'</td>'
										+'<td>'+this.gender+'</td><td>'+this.phone+'</td>'
										+'<td>'+this.addr+'</td><td>'+this.email+'</td>'
										+'<td>'+this.regdate+'</td></tr>'
								});
								table += '</table></div>';
								$(table).appendTo($('#box').empty());
								$("#member_list").css({
														"background":"white",
														"height":"1000px"
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
						 +
						 +'';
					});
				}
	 };
</script>

