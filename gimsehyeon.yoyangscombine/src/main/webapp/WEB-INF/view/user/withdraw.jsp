<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ page import='gimsehyeon.yoyangscombine.domain.User' %>
<%
	User user = (User)session.getAttribute("user");
%>
<!-- include:lib -->
<%@ include file='../include/lib.jsp' %>
<!-- /include:lib -->	
<style>
#back {
	height: 90%;
	width: 80%;
	background-color: #dcdcdc;
}

#head {
	padding: 50 0 50 0%;
}

#profile_img {
	width: 200px;
	height: 220px;
	border: 2px solid black;
	margin-left: 20px;
}
#with_img{
	width:150px;
	height:80px;
	margin-left: 30px;
	margin-top:30px;
	border: 2px solid black;
}
</style>
<script>
$(() => {
	let isPwCheck = false;
	
	//비밀번호 확인
 	$(function(){
 		$("#passwordConfirm-success").hide();
 		$("#passwordConfirm-danger").hide();	
		$("input").keyup(function(){
			let pwd1 = $("#new_pw").val();
			let pwd2 = $("#check_pw").val();
			let userPwd = `${user.getPassword()}`;
			
			if(pwd1 != "" || pwd2 != "") {
				if(pwd1 == pwd2 && pwd1 == userPwd) {
					$("#passwordConfirm-success").show();
					$("#passwordConfirm-danger").hide();
					isPwCheck = true;
				} else {
					$("#passwordConfirm-success").hide();
					$("#passwordConfirm-danger").show();
					isPwCheck = false;
				}
			}
			
 			if(isPwCheck) $("#delUserConfirm").removeAttr("disabled");
 			else $("#delUserConfirm").attr("disabled", "disabled");
 		});
 	});
	
	$("#delUserProc").click(function(){
		let userId = `${user.getUserId()}`;
		
		$.ajax({
			type:"GET",
			url:"withdrawProc?userId=" + userId,
			success:function(data){
				
	        }
		});
	});
});
</script>
<br>
<div class='container' id='back'>
	<div class='container'>
		<div class='container' id='head'></div>
		<div class='row'>
			<div class='col-md-6' style='text-align: left; padding-left:7%'>
				<h4>${userName}님, 탈퇴하시겠습니까?</h4>
				<h5>
					요양스컴바인은 <br>언제나 좋은 요양원을<br> 찾고 기다리고 있습니다.
				</h5><br>
				<form>
					<div class='form-gruop'>
						<label for='with_pw' class='col-form-label'>비밀번호를 입력하세요.
						</label> <input type='password' class='form-control' id='new_pw' placeholder='비밀번호 입력' style='width:90%'/>
					</div><br>
					<div class='form-gruop'>
						<label for='check_pw' class='col-form-label'>비밀번호를 한번 더 입력하세요.
							</label> 
							<input type='password' class='form-control' id='check_pw' placeholder='비밀번호 확인' style='width:90%'/>
					</div>
					<div class='alert alert-success' id='passwordConfirm-success'>비밀번호가 일치합니다.</div>
					<div class='alert alert-danger' id='passwordConfirm-danger'>비밀번호를 확인하세요.</div>
				</form>
				<br>
				<br>
				<br>
				<div class='container'>
					<div id='with_del' class='modal fade' tabindex='-1'>
						<div class='modal-dialog'>
							<div class='modal-content'>
								<div class='modal-header'>
									<h5 class='modal-title'>탈퇴 취소</h5>
									<button type='button' class='close' data-dismiss='modal'>
										<span>&times;</span>
									</button>
								</div>
								<div class='modal-body'>
									<p>탈퇴를 취소 하시겠습니까?</p>
								</div>
								<div id='realdel' class='modal fade' tabindex='-1'>
									<div class='modal-dialog'>
										<div class='modal-content'>
											<div class='modal-header'>
												<h5 class='modal-title'>탈퇴 취소</h5>
												<button type='button' class='close' data-dismiss='modal'>
													<span>&times;</span>
												</button>
											</div>
											<div class='modal-body'>
												<p>취소 되었습니다.</p>
											</div>
											<div class='modal-footer'>
												<button type='button' class='btn btn-secondary'
													data-dismiss='modal' OnClick="location.href='..'" style='cursor:pointer;'>확인</button>
											</div>
										</div>
									</div>
								</div>
								<div class='modal-footer'>
									<button type='button' class='btn btn-secondary'
										data-dismiss='modal'>취소</button>
									<button type='button' class='btn btn-primary'
										data-toggle='modal' data-target='#realdel'>확인</button>
								</div>
							</div>
						</div>
					</div>

					<div id='user_del' class='modal fade' tabindex='-1'>
						<div class='modal-dialog'>
							<div class='modal-content'>
								<div class='modal-header'>
									<h5 class='modal-title'>회원 탈퇴</h5>
									<button type='button' class='close' data-dismiss='modal'>
										<span>&times;</span>
									</button>
								</div>
								<div class='modal-body'>
									<p>정말 탈퇴 하시겠습니까?</p>
								</div>
								<div id='reuser_del' class='modal fade' tabindex='-1'>
									<div class='modal-dialog'>
										<div class='modal-content'>
											<div class='modal-header'>
												<h5 class='modal-title'>탈퇴 성공</h5>
												<button type='button' class='close' data-dismiss='modal'>
													<span>&times;</span>
												</button>
											</div>
											<div class='modal-body'>
												<p>탈퇴하였습니다.</p>
											</div>
											<div class='modal-footer'>
												<button type='button' class='btn btn-secondary'
													data-dismiss='modal' OnClick="location.href='..'" style='cursor:pointer;'>확인</button>
											</div>
										</div>
									</div>
								</div>
								<div class='modal-footer'>
									<button type='button' class='btn btn-secondary'
										data-dismiss='modal'>취소</button>
									<button type='button' class='btn btn-primary'
										data-toggle='modal' data-target='#reuser_del' id='delUserProc'>탈퇴</button>
								</div>
							</div>
						</div>
					</div>
					<div id='buttons' class='container'>
						<div class='form-group row'>
							<a type='button' class='btn btn-secondary mt-3 ml-2'
								href='../common/mypage' style='width: 42%'>취소</a>
							<button type='button' class='btn btn-secondary mt-3 ml-2'
								data-toggle='modal' data-target='#user_del' style='width: 42%' id='delUserConfirm' disabled='disabled'>탈퇴</button>
						</div>
					</div>
				</div>	
			</div>
			<div class='col-md-5'>
				<div id='with_img' OnClick="location.href ='..'" style='cursor:pointer;'>로고 이미지 150x80</div>
			</div>
		</div>
	</div>
<!-- include:footer -->
<footer id='main-footer'>
<hr size='2' color='grey' align='left' style='width:85%;'>	
	<div id='footer-pre-div'>
	<pre>
INFO: 
(주)요양스컴바인 대표 김세현 서울시 00동 00로 00길 00-00 
고객문의: 대표번호 0000-0000 | 이메일 yoyangsCombined@yoyang.kr 2020ⓒ All rights reserved<br>
	
요양스컴바인에서 최적의 요양원을 검색하세요. 대한민국 대표 요양원 관리 사이트 요양스컴바인은 수백개의 요양원을 검색하여, 
고객님께서 본인에게 딱 맞는 곳을 찾아 지속적으로 돌봐드릴 수 있도록 도와드립니다. 
	</pre>
	</div>
</footer>
<!-- /include:footer -->
</div>