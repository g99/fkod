<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- 메인 파일의 배경은 비지니스-캐쥬얼.css에 url('../images/bg.jpg')로 존재함 -->


    <title>무비 시어터 박스 - Culture MTB</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/business-casual.css" rel="stylesheet">
	
    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	
	<!-- 로그인 폼 CSS -->
	<link rel="stylesheet" href="../css/member.css" />
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



	<div>

		<form class="form-2" action="{context}/member.do?page=">
			<h1>
				<span class="log-in">로그인</span> or <span class="sign-up">회원 가입</span>
			</h1>
			<p class="float">
				<label for="login"><i class="icon-user"></i>ID</label> <input
					type="text" name="login" placeholder="UserID">
			</p>
			<p class="float">
				<label for="password"><i class="icon-lock"></i>Password</label> 
				<input type="password" name="password" placeholder="Password"
					class="showpassword">
			</p>
			<p class="clearfix">
				<a href="#회원가입 링크로 연결" class="log-twitter">회원 가입</a> 
				<input type="submit" name="submit" value="로그인">
			</p>
		</form>



		<div class="brand" style="padding-left: 390px;">MTB BOX</div>

		<div class="address-bar" style="padding-left: 400px;">
		세상을 바꾸는 힘, Culture MTB(Movie Theater BOX)</div>
	</div>

	<!-- Navigation -->
    <nav class="navbar navbar-default" role="navigation" style="padding-left: 30px; margin-top: 50px;">
        <div class="container">
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
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.html">영화</a> <!-- 네비바 해당 링크 존재 -->
                    </li>
                    <li>
                        <a href="about.html">예매</a>
                    </li>
                    <li>
                        <a href="blog.html">극장</a>
                    </li>
                    <li>
                        <a href="contact.html">이벤트&컬쳐</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    
    
    
   	<script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

