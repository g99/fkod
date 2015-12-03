<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script src="${context}/js/global.js"></script>
<script type="text/javascript">
	$(function() {
	Global.init();
	member.memberJoin();
	
});
	
	
	
var member = {
		
		/* 회원가입 html */
		memberJoin : function() {
			$('#box').html('<link rel="stylesheet" href="../css/member.css" />'
			+'<div id="mainDiv" class="wrap"><div id="subDiv"><h3 class="inline">&nbsp;&nbsp;본인 인증</h3>'
			+'<h5 class="inline">&nbsp;&nbsp;&nbsp;안전한 서비스 이용을 위해 본인확인을 진행하고 있습니다.</h5>'
			+'<br><br><br><h4>&nbsp;&nbsp;&nbsp;본인인증시 제공되는 정보는 해당 사이트에서 직접 수령하며,인증 이외의 용도로 이용 또는 저장하지 않습니다.</h4><br><br>'
			+'<div id="imgDiv"><img src="../images/lock.png" alt="" /><br><br><img id="join" src="../images/join.PNG" alt="" /></div>'
			+'<br><br><br><br><br><br><br><br><p id ="p_f">&nbsp;&nbsp;&nbsp;입력하신 소중한 개인정보는 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않으며,자사의 보안시스템을 통해 외부위협으로부터 보호하고 있습니다.</p></div>'
			);
			
			$("#join").click(function(){
			member.webEmpty();
			member.provision();
			
			});
			
		},
		
		
		/* 약관 html 로드 */
		provision : function() {
			$('#box').load('${context}/member/Member.do?page=provision' )
		},
		
		
		
		/* 박스 비우기 */
		webEmpty : function() {
			$('').appendTo($( '#box' ).empty());
		},
		
		
		
};


/* $(function() {
		Global.init();
		$('#header').load('${context}/global/header.do')
	}); */
	
	

</script>