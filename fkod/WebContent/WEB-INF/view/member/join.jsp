<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/member.css" />
<div class="join_wrap" >
		
		<div class = "form_Main">
		<h3 class="inline">정보입력</h3>
		<h5 class="inline"> &nbsp;&nbsp;&nbsp; 회원가입에 필요한 고객님의 정보를 입력해주세요</h5> <br><br>
		
		 
		
		<form id="form_Join">  
		* 아이디 : <input name ="id" type="text" size="8"> <input type="button" value="중복확인" onclick="alert('체킹문구')"> 영문이나 숫자 혹은 그 조합 8~12자리 <br><br>
		* 비밀번호 : <input type="password" name="password" size="7" > 영문혹은 숫자 혹은 그 조합 10자리 이상 <br><br>
		* 비밀번호 확인 : <input type="password" name="password" size="7"> <br><br>
		* 이름 : <input type="text" name="name" placeholder="실명을 입력하세요." size="11"> <br><br>
		* 생년월일 : &nbsp;&nbsp;<input type="text" name="birth" size="6"> 년
		<input type="text" name="birth" size="4"> 월
		<input type="text" name="birth" size="4"> 일
		<br><br>
		주소 : <input type="text" name="addr" size="4" value="" readonly> -
		<input type="text" name="addr" size="4" value="" readonly> <input type="image" src="../images/add_search.PNG" /> <br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="addr" size="20" placeholder="상세주소를 입력해주세요." autocomplete="on"> <br><br>
		* 성별 : <input type="radio" name="성별" value="남" checked> 남
		 		<input type="radio" name="성별" value="여"> 여 <br><br>
		* 이메일 : <input type="email" name="email" autocomplete="on"> <br><br>
		* 휴대폰 : <input type="text" name="phone" size = "3" />-
		<input type="text" name="phone" size = "3" />-
		<input type="text" name="phone" size = "3" />


		<br><br><br><br><br>
		<input id="join" type="image" src="../images/suc.PNG" onclick=Join.join() alt=""/>
		<input id="cancel" type="image" src="../images/cancel.PNG" alt="cancel" />
		</form>
		</div>
	</div>
	
	<!-- { data부분에 들어감
					id : $('#id').val(),
					password : $('#password').val(),
					name : $('#name').val(),
					birth : $('#birth').val(),
					addr : $('#addr').val(),
					gender : $("input:radio[name=gender]:checked").val(),
					email : $('#email').val(),
					phone : $("#phone").val(),
					page : 'join'
				} -->
	
	<script>
	$(function() {
	
	});
	
	var Join={
		join : function() {
			alert('조인펑션진입')
			$('#form_Join').submit(function() {
			alert('조인서브밋 진입')
			$.ajax('${context}/member/Member.do',{
				data : '',
				type: 'post',
				dataType : "json",
				page:"join_member",
				success : function(data) {
					alert('성공함');
					$('#temp').remove();
					var header = document.createElement('div');
					header.id = 'header';
					document.body.appendChild(header);
					
					var outbox = document.createElement('div');
					outbox.id = 'outbox';
					document.body.appendChild(outbox);
					
					var footer = document.createElement('div');
					footer.id = 'footer';
					document.body.appendChild(footer);
					
					$("<div id ='box'></div>").appendTo($('#outbox').empty());
					$('#box').append('<h1>환영합니다.'+data.name+'</h1><br/>')
					.append('<a href="${context}/main.do">홈으로</a>');
				},
				error : function(xhr, status, msg) {
					alert("상태: " +status+", 내용:" +msg)
				}
			})
		})
		$('#form_Join').submit();		
		},
		
		checkbox : function(addr) {
			var arr = [];
			addr.each(function() {
				arr.push($(this).val());
			});
			return arr;
		}
	};
	
	
	</script>