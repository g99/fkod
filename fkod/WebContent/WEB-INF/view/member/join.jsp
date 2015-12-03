<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/member.css" />
<html id = "join_html">
<div class="join_wrap" >
		
		<div class = "form_Main">
		<h3 class="inline">회원가입 정보입력</h3>
		<h5 class="inline"> &nbsp;&nbsp;&nbsp; 회원가입에 필요한 고객님의 정보를 입력해주세요</h5> <br><br>
		
		 
		
		<form id="form_Join">  
		* 아이디 : <input id ="id" name="id" type="text" size="8"> <input type="button" id="check" value="중복확인" > 영문이나 숫자 혹은 그 조합 8~12자리 <br><br>
		* 비밀번호 : <input type="password" id="password" size="7" > 영문혹은 숫자 혹은 그 조합 10자리 이상 <br><br>
		* 비밀번호 확인 : <input type="password" id="" size="7"> <br><br>
		* 이름 : <input type="text" id="name" placeholder="ex)이성한" size="11"> <br><br>
		* 생년월일 : &nbsp;&nbsp;<input type="text" id="birth" size="7" placeholder="ex)930205">
		<br><br>
		주소 : <input type="text" id="addr" size="20" placeholder="상세주소를 입력해주세요." autocomplete="on"> <br><br>
		* 성별 : <input type="radio" name="gender" value="남" checked> 남
		 		<input type="radio" name="gender" value="여"> 여 <br><br>
		* 이메일 : <input type="email" id="email" autocomplete="on"> <br><br>
		* 휴대폰 : <input type="text" id="phone" size = "13" autocomplete="on" placeholder="ex)01031394508" />  


		<br><br><br><br><br>
		<input id="join" type="image" src="../images/suc.PNG" alt=""/>
		<input id="cancel" type="image" src="../images/cancel.PNG" />
		</form>
		</div>
	</div>
</html>
	
	
	<script>
	$(function() {
		$('#join').click(function() {
			Join.join();
		});
		
		$('#check').click(function() {
			Join.check();
		});
	});
	
	var Join={
			
		join : function() {
			$('#form_Join').submit(function(e) {
				e.preventDefault();
			$.ajax('${context}/member/Member.do',{
				data : {
					id : $('#id').val(),
					password : $('#password').val(),
					name : $('#name').val(),
					birth : $('#birth').val(),
					addr : $('#addr').val(),
					gender : $("input:radio[name=gender]:checked").val(),
					email : $('#email').val(),
					phone : $("#phone").val(),
					page : 'join_member'
				},
				dataType : "json",
				success : function(data) {
					if (data.result === "success") {
						alert(data.name+'님 회원가입을 진행하시겠습니까?');
						$("<div id='join_Result' style='height:100%; width:100%; background:white;'> </div>").appendTo($('#big_wrap').empty());
						$("#join_Result").html('<div id ="join_Suc" style="padding-top : 50px; padding-left : 50px;	width: 900px;height: 100%;	margin: auto;background: rgba(232, 183, 183, 0.14);"><h1>환영합니다 '+data.name+'님, <br/> 회원가입을 축하드립니다.</h1><br/><a href="#메인 홈 주소">메인으로가기</a></div>');
					} else {
						alert(data.result+'되었습니다.');
					}
					
				},
				error : function(xhr, status, msg) {
					alert("상태: " +status+", 내용:" +msg);
				}
			})
			
		});
		},
		
		/* 서브밋을 사용하지 않고 에이작스를 바로 사용해도, 가능하다. */
		check : function() {
				$.ajax('${context}/member/Member.do',{
					data : {
						id : $('#id').val(),
						page :'check_Overlap'
					},
					dataType : "json",
					success : function(data) {
						if (data.result === "usable") {
							alert(data.id+" 는 사용할 수 있습니다.");							
						} else {
							alert(data.id+" 는 이미 존재하는 아이디입니다.");
						}
						
					},
					error : function(xhr, status, msg) {
						alert("상태: " +status+", 내용:" +msg);
					}
				})
			},
		
		
		
		
		cancel : function() {
			$('#big_wrap').load('메인주소');
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