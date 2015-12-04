<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div>
<table id="tab_mypage" style="background: white;" >
	<tr>
		<th>항목</th>
		<th id = "thone">내용</th>
	</tr>
	<tr>
		<td>아이디</td>
		<td>${user.id}</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>${user.password}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${user.name}</td>
	</tr>
	<tr>
		<td>생년</td>
		<td>${user.birth}</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>${user.phone}</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${user.email}</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>${user.gender}</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>${user.addr}</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${user.regdate}</td>
	</tr>
	<tr>
		<td></td>
		<td><input type="button" value="회원탈퇴" id = "remove"/><input type="button" value="정보수정" id= "update"/></td>
	</tr>
</table>
</div>


<script>
$('td').add('tr').css('border', '1px solid black').css('text-align', 'center');
$('th').css('border', '1px solid black').css('text-align', 'center');
$('#photo').css('float', 'left').css('height', '280px').css('border', '1px solid')
.css('margin-right', '30px');
$('#inphoto').css('margin-top','225px').css('margin-left','30px');
$('#thone').css('width', '250px');
$('#tab_mypage').css('float', 'left').css('border-collapse','collapse');
$('input').css('float', 'right')

$(function() {
	 $('#update').click( function() {
		 Mypage.updateForm();
	   });
	 $('#remove').click( function() {
		 Mypage.remove("${user.id}");
	   });
});

/* 이부분부터 코드 수정 시작 */
var Mypage = {
		updateForm : function() {
			$.getJSON('',function(data){
				$('<form action="${context}/member/Member.do?page=update" id="frm"></form>').appendTo($('#box').empty());
				var table = '<div><table id="tab_mypage" style="background: white;"><tr><th>항목</th><th id = "thone">내용</th></tr>'
				+'<tr><td>아이디</td><td>${user.id}</td></tr><tr><td>비밀번호</td><td><input type="password" id="password" placeholder="${user.password}"/></td></tr><tr><td>이름</td><td>${user.name}</td></tr>'
				+'<tr><td>생년</td><td>${user.birth}</td></tr><tr><td>전화번호</td><td><input type="text" id = "phone" placeholder="${user.phone}"/></td></tr><tr><td>이메일</td><td><input type="text" id="email" placeholder="${user.email}"/></td></tr>'
				+'<tr><td>성별</td><td>${user.gender}</td></tr><tr><td>주소</td><td><input type="text" id="addr" placeholder="${user.addr}"/></td></tr><tr><td>등록일</td><td>${user.regdate}</td></tr>'
				+'<tr><td></td><td><input type="button" id="confirm" value="확인"/><input type="button" value="정보수정"/></td></tr></table></div>';
				$('#frm').html(table);
				
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
	
     



</script>