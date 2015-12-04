<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form action=""></form>
<script src="${context}/js/global.js"></script>
<script type="text/javascript">
$().ready(function() {
		/* Global.init();
		$('#header').load('${context}/main.do?page=header');
		Member.detail();
		$('#footer').load('${context}/main.do?page=footer'); */
	});
	
	var Member = {
			/* detail : function() {
				$.getJSON('${context}/member.do?page=detail&userid=${member.userid}', function(data){
					var table = "<table id = 'tab_mypage'><tr><th>항목</th><th>내용</th></tr>"
					+"<tr><td>아이디</td><td>${member.userid}</td></tr><tr><td>비밀번호</td><td><input type='password' placeholder='${member.password}'/></td></tr>"
					+"<tr><td>이름</td><td>${member.name}</td></tr><tr><td>생년</td><td>${member.birth}</td></tr><tr><td>전화번호</td><td><input type='text' placeholder='${member.phone}'/></td></tr>"
					+"<tr><td>이메일</td><td><input type='text' placeholder='${member.email}' /></td></tr><tr><td>성별</td><td>${member.gender}</td></tr><tr><td>주소</td><td>"
					+"<input type='text' placeholder='${member.addr}'/></td></tr><tr><td>등록일</td><td>${member.regdate}</td></tr><tr><td>프로필사진</td><td><input type='text' placeholder='${member.profile}'/></td></tr><tr><td></td><td></td></tr>"
					+"</table>";
					$('#box').html(table);
				}); */
				detail : function() {
					$.getJSON('${context}/member.do?page=detail&userid=${member.userid}', function(data){
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
			
			updateForm : function() {
				$.getJSON('${context}/member.do?page=detail&userid=${member.userid}',function(data){
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

</script>
<!-- 
주요속성
data : 서버에 전송할 데이터, key/value 형식의 객체
dataType : 서버가 리턴하는 데이터타입(xml, json, script, html)
type : 서버로 전송하는 데이터 타입 (post, get)
url : 데이터를 전송할 url
success : ajax 통신이 성공했을 때 호출될 이벤트 핸들러
error : ajax 통신이 실패했을 때 호출될 이벤트 핸들러
 -->