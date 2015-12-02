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
                        <a href="#" >극장</a>
                    </li>
                    <li>
                        <a href="#" >이벤트&컬쳐</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
    </nav>
    
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#home").click(function() {
			$("#box").load("${context}/global/Main.do?page=default");
		});
		$("#movie_btn").click(function() {
			$("#box").load("${context}/global/Main.do?page=header");
		});
		
		$("#ticket_btn").click(function() {
			$("#box").load("${context}/global/Main.do?page=default");
		});
		
		$("#join_btn").click(function() {
			$("#box").load();
		});
	
		$("#login_btn").click(function() {
			Member.login();
		});
		$("#logout_btn").click(function() {
			Member.logout();
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
					$("#frm_toggle").empty().load("${context}/global/Main.do?page=header #frm_logined", function() {
						$("#logout_btn").click(function() {
							//새로고침 하지 않은 경우에 로그아웃
							Member.logout();
						});
					});
					if(data.admin === "yes") {
						$("#wrapper").append(
								'<table id="admin_nav"><tr><td><a href="#" class="list-group-item" id="admin_home">홈</a></td></tr>'+
								'<tr><td><a href="#" class="list-group-item" id="admin_member">회원관리</a></td></tr><tr><td><a href="#" class="list-group-item" id="admin_movie">영화관리</a></td></tr><tr><td><a href="#" class="list-group-item" id="admin_statistics">통계보기</a></td></tr><tr><td>게시판관리</td></tr></table>');
						$("#admin_nav").css({
							"text-align": "center",
							"height": "450px",
							"background": "#fffaf6",
							"position": "absolute",
							"right": "20px",
							"top": "300px"
						});
						$("#admin_home").click(function() {
							$("#box").load("${context}/admin/Admin.do?page=member");
						});
						$("#admin_home").click(function() {
							$("#box").load("${context}/admin/Admin.do");
						});
						$("#admin_home").click(function() {
							$("#box").load("${context}/admin/Admin.do");
						});
					}
				},
				error : function() {
					
				}
			});
		},
		logout : function() {
			alert("로그아웃 클릭");
			$.ajax("${context}/member/Member.do?page=logout",{
				dataType : "json",
				success : function(data) {
					$("#frm_toggle").empty().load("${context}/global/Main.do?page=header #frm_login", function() {
						$("#login_btn").click(function() {
							Member.login();
						});
					});
					$("#box").load("${context}/global/Main.do?page=default");
					$("#admin_nav").remove();
				},
				error : function() {
				}
			});
		}
	};
</script>

