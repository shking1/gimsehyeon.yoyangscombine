<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ page import='gimsehyeon.yoyangscombine.domain.User' %>
<%
	User user = (User)session.getAttribute("user");
%>
<!-- include:lib -->
<%@ include file='../include/lib.jsp' %>
<!-- /include:lib -->
<style>
#profile_img{
	width:200px;
	height:220px;
	border:2px solid black;
	margin-left:20px;
}

#btn-brother{
	font-size:3pt;
}

</style>
<script>
$(() => {
	let isPwCheck = false;
	
	//비밀번호 수정(모달창)
	$(function(){
		$("#passwordConfirm-success").hide();
		$("#passwordConfirm-danger").hide();
		$("#passwordConfirm-lastPwErr").hide();
		$("input").keyup(function(){
			let lastPw = $("#last_pw").val();
			let pwd1 = $("#new_pw").val();
			let pwd2 = $("#check_pw").val();
			let userPwd = `${user.getPassword()}`;
			
			if(lastPw != "" || pwd1 != "" || pwd2 != "") {
				if(lastPw == userPwd && pwd1 == pwd2 && pwd1 != "" && pwd2 != "") {
					$("#passwordConfirm-success").show();
					$("#passwordConfirm-danger").hide();
					$("#passwordConfirm-lastPwErr").hide();
					isPwCheck = true;
				} else if(lastPw != userPwd) {
					$("#passwordConfirm-success").hide();
					$("#passwordConfirm-danger").hide();
					$("#passwordConfirm-lastPwErr").show();
					isPwCheck = false;
				} else if(pwd1 != pwd2) {
					$("#passwordConfirm-success").hide();
					$("#passwordConfirm-danger").show();
					$("#passwordConfirm-lastPwErr").hide();
					isPwCheck = false;
				} else {
					$("#passwordConfirm-success").hide();
					$("#passwordConfirm-danger").hide();
					$("#passwordConfirm-lastPwErr").hide();
					isPwCheck = false;
				}
			}
			
			if(isPwCheck) $("#fixPwProc").removeAttr("disabled");
			else $("#fixPwProc").attr("disabled", "disabled");
		});
	});
	
	$("#fixPwProc").click(function(){
		let user = {
			userId: `${user.getUserId()}`,
			password: $("#new_pw").val()
		}
		
		$.ajax({
			type : "POST",
			url : "../user/fixPasswordProc",
			data : user,
			success : function(data){
				
	        }
		});
	});
	
	$("#fixUserProc").click(function(){
		let user = {
			userId: `${user.getUserId()}`,
			userName: $("#input-name").val()
		}
		
		$.ajax({
			type : "POST",
			url : "../user/fixUserProc",
			data : user,
			success : function(data){
				
	        }
		});
	});
});
</script>
<div class='container'>
<!-- include:header -->
<jsp:include page='../include/header.jsp'/>
<!-- /include:header -->
<h2 style='margin-bottom:50px'>MYPAGE > 회원정보수정</h2>
<div class='row'>
	<div class='col-md-4'>
		<div id='profile_img'>프로필 이미지 200x220<input type = 'file' name='profile_photo' style='margin-top:160px;'></div>
		<br>
	</div>
	<div class='col-md-5'>
		<div class='form-group row'>
			<label class='col-2 col-form-label'> 
				<svg width='1.5em' height='1.5em' viewBox='0 0 16 16' class='bi bi-person' fill='currentColor' xmlns='http://www.w3.org/2000/svg'>
					<path fill-rule='evenodd' d='M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z' />
				</svg>
			</label>
			<div class='col-8'>
				<div style='width: 80px; float:left;'><input id='input-name' name='userName' type ='text' value='${user.getUserName()}' placeholder='보호자 이름'></div>
				<div><h5>보호자님</h5></div><br>
			</div>
		</div>
		<div class='form-group row'>
			<label class='col-2 col-form-label'> 
				<svg width='1.5em' height='1.5em' viewBox='0 0 16 16' class='bi bi-calendar2-check' fill='currentColor' xmlns='http://www.w3.org/2000/svg'>
					<path fill-rule='evenodd' d='M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z'/>
					<path d='M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z'/>
					<path fill-rule='evenodd' d='M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0z'/>
				</svg>
			</label>
			<div class='col-10'>
			   <h5>${user.getJoinDate()} 가입</h5><br>   
			</div>
		</div>
		<div class='form-group row'>
			<label class='col-2 col-form-label'> 
				<svg width='1.5em' height='1.5em' viewBox='0 0 16 16' class='bi bi-envelope' fill='currentColor' xmlns='http://www.w3.org/2000/svg'>
					<path fill-rule='evenodd' d='M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383l-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z'/>
				</svg>
			</label>
			<div class='col-10'>
				<h5>${user.getUserId()}</h5>
			</div>
		</div>
		<div class='container'>
			<div class='modal fade' id='pw_fix' tabindex='-1'>
				<div class='modal-dialog'>
					<div class='modal-content'>
						<div class='modal-header'>
						<h5 class='modal-title'>비밀번호 수정</h5>
							<button type='button' class='close' data-dismiss='modal'>
								<span>&times;</span>
							</button>   
						</div>
						<div class='modal-body'>
							<form>
								<div class='form-gruop'>
									<label for='last_pw' class='col-form-label'>기존 비밀번호를 입력하세요. </label>
									<input type='password' class='form-control' id='last_pw' name='lastPw' placeholder='기존 비밀번호' />
								</div>
								<div class='form-gruop'>
									<label for='new_pw' class='col-form-label'>새로운 비밀번호를 입력하세요. </label>
									<input type='password' class='form-control' id='new_pw' name='password' placeholder='새로운 비밀번호'/>
								</div>
								<div class='form-gruop'>
									<label for='check_pw' class='col-form-label'>비밀번호를 다시 한번 입력하세요.</label>
									<input type='password' class='form-control' id='check_pw' placeholder='새 비밀번호 확인'/>
								</div>
								<div class='alert alert-success' id='passwordConfirm-success'>비밀번호 변경이 가능합니다.</div>
								<div class='alert alert-danger' id='passwordConfirm-danger'>새로운 비밀번호가 확인란과 일치하지 않습니다. 다시 확인하세요.</div>
								<div class='alert alert-danger' id='passwordConfirm-lastPwErr'>기존 비밀번호가 틀립니다.</div>
							</form>
						</div>
					   
						<div id='real_mod' class='modal fade' tabindex='-1'>
							<div class='modal-dialog'>
								<div class='modal-content'>
									<div class='modal-header'>
										<h5 class='modal-title'>수정 성공</h5>
										<button type='button' class='close' data-dismiss='modal'>
											<span>&times;</span>
										</button>
									</div>
									<div class='modal-body'>
										<p>비밀번호가 변경되었습니다.</p>
									</div>
									<div class='modal-footer'>
										<button type='button' class='btn btn-secondary' data-dismiss='modal' onClick='window.location.reload()'>확인</button>
									</div>
								</div>
							</div>
						</div>
						<div class='modal-footer'>
							<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
							<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#real_mod' id='fixPwProc' disabled='disabled'>수정</button>
						</div>
					</div>
				</div>
			</div>
		   
			<div id='mod_del' class='modal fade' tabindex='-1'>
				<div class='modal-dialog'>
					<div class='modal-content'>
						<div class='modal-header'>
							<h5 class='modal-title'>수정취소</h5>
							<button type='button' class='close' data-dismiss='modal'>
								<span>&times;</span>
							</button>
						</div>
						<div class='modal-body'>
							<p>수정을 취소 하시겠습니까?</p>
						</div>
						<div id='realdel' class='modal fade' tabindex='-1'>
							<div class='modal-dialog'>
								<div class='modal-content'>
									<div class='modal-header'>
										<h5 class='modal-title'>수정 취소</h5>
										<button type='button' class='close' data-dismiss='modal'>
											<span>&times;</span>
										</button>
									</div>
									<div class='modal-body'>
										<p>이전페이지로 돌아갑니다.</p>
									</div>
									<div class='modal-footer'>
									   <button type='button' class='btn btn-secondary' data-dismiss='modal' OnClick="location.href ='../common/mypage'">확인</button>
									</div>
								</div>
							</div>
						</div>
						<div class='modal-footer'>
							<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
							<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#realdel'>확인</button>
						</div>
					</div>
				</div>
			</div>
					   
			<div id='user_mod' class='modal fade' tabindex='-1'>
				<div class='modal-dialog'>
					<div class='modal-content'>
						<div class='modal-header'>
							<h5 class='modal-title'>수정</h5>
							<button type='button' class='close' data-dismiss='modal'>
								<span>&times;</span>
							</button>
						</div>
						<div class='modal-body'>
							<p>수정을 완료하시겠습니까?</p>
						</div>
						<div id='reuser_mod' class='modal fade' tabindex='-1'>
							<div class='modal-dialog'>
								<div class='modal-content'>
									<div class='modal-header'>
										<h5 class='modal-title'>수정 성공</h5>
										<button type='button' class='close' data-dismiss='modal'>
											<span>&times;</span>
										</button>
									</div>
									<div class='modal-body'>
										<p>성공적으로 수정되었습니다.</p>
									</div>
									<div class='modal-footer'>
										<button type='button' class='btn btn-secondary' data-dismiss='modal' OnClick="location.href='../common/mypage'">확인</button>
									</div>
								</div>
							</div>
						</div>
						<div class='modal-footer'>
							<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
							<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#reuser_mod' id='fixUserProc'>확인</button>
						</div>
					</div>
				</div>
			</div>
			<div id ='buttons' class='container'>
				<div class='form-group row'>
					<button type='button' id='btn-brother' class='btn btn-secondary mt-3 ml-2' data-toggle='modal' data-target='#user_mod' style='width: 20%'>수정</button> 
					<button type='button' id='btn-brother' class='btn btn-secondary mt-3 ml-2' data-toggle='modal' data-target='#mod_del' style='width: 20%'>취소</button> 
					<button type='button' id='btn-brother' class='btn btn-secondary mt-3 ml-2' data-toggle='modal' data-target='#pw_fix' style='width: 40%'>비밀번호 수정</button>    
				</div>
			</div>    
		</div>
	</div>
</div>
<hr>
<!-- include:footer -->
<%@ include file='../include/footer.jsp' %>
<!-- include:footer -->
</div>