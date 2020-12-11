<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!-- include:lib -->
<%@ include file='../include/lib.jsp' %>
<!-- /include:lib -->
<title>회원가입</title>
<style>
#join_img {
   width: 150px;
   height: 80px;
   border: 1px solid black;
}

.form-family{
	margin: 100px auto;
	padding-top: 50px;
	width: 450px;
}

#agreement{
	text-align:left;
	width:300px;
}
</style>
<script>
var code = "";

/* 인증번호 이메일 전송 */
$("#emailBtn").click(function(){
	var email = $("#join-userMail").val();        // 입력한 이메일
	
	$.ajax({
		type:"GET",
		url:"createEmailCheck?email=" + email,
		success:function(data){
			code = data;
        }
	});
});

$(function(){
	$("#passwordConfirm-success").hide();
	$("#passwordConfirm-danger").hide();	
	$("input").keyup(function(){
		var pwd1 = $("#join-userPw").val();
		var pwd2 = $("#join-userPwConfirm").val();
		if(pwd1 != "" || pwd2 != "") {
			if(pwd1 == pwd2) {
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#submit").removeAttr("disabled");
			} else {
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#submit").attr("disabled", "disabled");
			}
		}
	});
});

</script>
<body>
<div class='container'>
	<div class='form-family'>
		<div class='row justify-content-center'>
			<div>
				<div id='join_img' OnClick="location.href ='..'" style='cursor:pointer;'>로고이미지 150x80</div>
				<br>
				<div>
					<h4>지금 바로 가입하세요!</h4>
				</div>
			</div>
		</div>
		<div class='row'>
			<div class='col-12'>
				<form method='post' id='login_form'>
					<div class='form-group row'>
						<div class='col-12'>
							<input type='text' class='form-control' placeholder='이름' id='join-userName' name='userName' required/>
						</div>
					</div>
					<div class='form-group row'>
						<div class='col-8'>
							<input type='text' class='form-control' placeholder='이메일' id='join-userMail' name='userId' required/>
						</div>
						<div class='col-4'><a type='button' class='btn btn-secondary' href='#' style='width: 100%' data-dismiss='modal' data-toggle='modal' data-target='#join-accreditModal' id='emailBtn'>인증</a></div>
					</div>
					<div class='form-group row'>
						<div class='col-8'>
							<input type='text' class='form-control' placeholder='인증번호' id='join-accreditNum' name='accreditNum'/>
						</div>
						<div class='col-4'><a type='button' class='btn btn-secondary' href='#' style='width: 100%' data-dismiss='modal' data-toggle='modal' data-target='#join-accreditConfirmModal' id='emailAuthBtn'>확인</a></div>
					</div>
					<div class='form-group row'>
						<div class='col-12'>
						   <input type='password' class='form-control' id='join-userPw' name='password'
							  placeholder='비밀번호' required/>
						</div>
					</div>
					<div class='form-group row'>
						<div class='col-12'>
							<input type='password' class='form-control' id='join-userPwConfirm' name='passwordConfirm'
								placeholder='비밀번호 확인' required/>
						</div>
					</div>
					<div class='alert alert-success' id='passwordConfirm-success'>비밀번호가 일치합니다.</div>
					<div class='alert alert-danger' id='passwordConfirm-danger'>비밀번호가 일치하지 않습니다.</div>
					<div class='form-group row'>
						<div class='col-3 offset-9' style='text-align:right'>
							 <label class='col-form-label' id='agreement'>약관에 동의</label>
							 <input type='checkbox' id='join-agree' name='agree' required/>
						</div>
<!-- 						<a type='button' class='col-12 btn btn-primary mt-3 ml-2' href='#'  -->
<!-- 							data-dismiss='modal' data-toggle='modal' data-target='#join-welcomeModal'>가입</a> -->
						<button type='submit' class='col-12 btn btn-primary mt-3 ml-2'>가입</button>
						<span></span>
					</div>
					<br><div style='text-align:center'>이미 계정이 있으시다면 <a href='login'>로그인</a></div>
				</form>
			</div>
		</div>
	</div>
	<div id='join-accreditModal' class='modal fade' tabindex='-1'>
		<div class='modal-dialog'>
			<div class='modal-content'>
				<div class='modal-header'>
					<h5 class='modal-title'>인증번호 전송</h5>
					<button type='button' class='close' data-dismiss='modal'>
						<span>&times;</span>
					</button>
				</div>
				<div class='modal-body'>
					<p id='modalMessage'>인증번호가 전송되었습니다.</p>
				</div>
				<div class='modal-footer'>
					<a href='#' class='btn btn-primary' data-dismiss='modal'>확인</a>
				</div>
			</div>
		</div>
	</div>

	<div id='join-accreditConfirmModal' class='modal fade' tabindex='-1'>
		<div class='modal-dialog'>
			<div class='modal-content'>
				<div class='modal-header'>
					<h5 class='modal-title'>인증번호 확인</h5>
					<button type='button' class='close' data-dismiss='modal'>
						<span>&times;</span>
					</button>
				</div>
				<div class='modal-body'>
					<p id='modalMessage'>인증번호가 확인되었습니다.</p>
				</div>
				<div class='modal-footer'>
					<a href='#' class='btn btn-primary' data-dismiss='modal'>확인</a>
				</div>
			</div>
		</div>
	</div>

	<div id='join-accreditErrorModal' class='modal fade' tabindex='-1'>
		<div class='modal-dialog'>
			<div class='modal-content'>
				<div class='modal-header'>
					<h5 class='modal-title'>인증번호 확인</h5>
					<button type='button' class='close' data-dismiss='modal'>
						<span>&times;</span>
					</button>
				</div>
				<div class='modal-body'>
					<p id='modalMessage'>인증번호가 일치하지 않습니다.</p>
				</div>
				<div class='modal-footer'>
					<a href='#' class='btn btn-primary' data-dismiss='modal'>확인</a>
				</div>
			</div>
		</div>
	</div>

	<div id='join-welcomeModal' class='modal fade' tabindex='-1'>
		<div class='modal-dialog'>
			<div class='modal-content'>
				<div class='modal-header'>
					<h5 class='modal-title'>가입 완료</h5>
					<button type='button' class='close' data-dismiss='modal'>
						<span>&times;</span>
					</button>
				</div>
				<div class='modal-body'>
					<p id='modalMessage'>반갑습니다 홍길동님!<br>요양스컴바인에 가입되었습니다.</p>
				</div>
				<div class='modal-footer'>
					<a href='..' class='btn btn-primary'>확인</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<!-- include: footer -->
<%@ include file='../include/footer.jsp' %>
<!-- include: footer -->