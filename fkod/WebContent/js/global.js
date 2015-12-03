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
		}
	};
	var Admin = {
			 	home : function(project) {
					$("#box").load(project + "/admin/Admin.do");
				},
				member : function(project) {
					 $.getJSON(project + '/admin/Admin.do?page=member_list', function(data) {
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