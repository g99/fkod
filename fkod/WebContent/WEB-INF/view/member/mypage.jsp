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
		 Method.updateForm();
	   });
	 $('#remove').click( function() {
	     Method.remove("${user.id}");
	   });
	
});

var Method = {
		updateForm : function() {
			$.getJSON('${context}/member.do?page=update&userid=${member.userid}',function (data){
		  $('<form action="${context}/member.do?page=detail" id="frm"></form>').appendTo($( '#box').empty());
		     var table =
	     	'<div id ="photo"><img src="${context}/images/${member.profile}" alt="" /><div id = "inphoto"><input type="file" /></div></div>'
	     	+'<div><table id="tab_mypage"><tr><th>항목</th><th id = "thone">내용</th></tr>'
	    	 +'<tr><td>아이디</td><td>${member.userid}</td></tr><tr><td>비밀번호</td><td><input type="password" id="password" placeholder="${member.password}"/></td></tr><tr><td>이름</td><td>${member.name}</td></tr>'
	    	 +'<tr><td>생년</td><td>${member.birth}</td></tr><tr><td>전화번호</td><td><input type="text" id = "phone" placeholder="${member.phone}"/></td></tr><tr><td>이메일</td><td><input type="text" id="email" placeholder="${member.email}"/></td></tr>'
	   	 	 +'<tr><td>성별</td><td>${member.gender}</td></tr><tr><td>주소</td><td><input type="text" id="addr" placeholder="${member.addr}"/></td></tr><tr><td>등록일</td><td>${member.regdate}</td></tr><tr><td>프로필사진</td><td>${member.profile}</td></tr>'
	  	 	  +'<tr><td></td><td><input type="button" id="confirm" value="확인"/><input type="button" value="정보수정"/></td></tr></table></div>';
	  		   $('#frm').html(table);

		},
		
		remove : function() {
			
		}
}
	
     



</script>