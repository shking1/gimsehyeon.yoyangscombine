<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
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
//아이디 중복 확인
$(() => {
	let isIdCheck = false;
	let isAuthCheck = false;
	let isPwCheck = false;
	
	$("#idCheck").click(function(){
		let email = $("#join-userMail").val();
		
		$.ajax({
			url : "userChk?userId=" + email,
			type : "get",
			success : function(data) {
				if(data != 0) {
					$("#idChkMsg").text("사용 불가");
					$("#idChkMsg").attr("style", "color:#f00");
					
					isIdCheck = false;
					
					$("#submit").attr("disabled", "disabled");
				} else {
					$("#idChkMsg").text("사용 가능");
					$("#idChkMsg").attr("style", "color:#00f");
					
					isIdCheck = true;
					
					if(isIdCheck && isAuthCheck && isPwCheck) $("#submit").removeAttr("disabled");
					else $("#submit").attr("disabled", "disabled");
				}
			}
		});  // ajax 끝
	});
	
	let code = "";
	
	/* 인증번호 이메일 전송 */
	$("#emailBtn").click(function(){
		let email = $("#join-userMail").val();	// 입력한 이메일
		
		$.ajax({
			type:"GET",
			url:"createEmailCheck?userId=" + email,
			success:function(data){
				code = data;
	        }
		});
	});
	
	/* 인증번호 비교 */
	$("#emailAuthBtn").click(function(){
		var inputCode = $("#join-accreditNum").val();        // 입력코드    
		var checkResult = $("#mail_check_input_box_warn");    // 비교 결과
	    
		if(inputCode == code){                            // 일치할 경우
			checkResult.html("인증번호가 일치합니다.");
			
			isAuthCheck = true;
			
			if(isIdCheck && isAuthCheck && isPwCheck) $("#submit").removeAttr("disabled");
			else $("#submit").attr("disabled", "disabled");
		} else {                                            // 일치하지 않을 경우
			checkResult.html("인증번호를 다시 확인해주세요.");
			
			isAuthCheck = false;
			
			$("#submit").attr("disabled", "disabled");
		}
	});
	
	//비밀번호 확인
	$(function(){
		$("#passwordConfirm-success").hide();
		$("#passwordConfirm-danger").hide();	
		$("input").keyup(function(){
			let pwd1 = $("#join-userPw").val();
			let pwd2 = $("#join-userPwConfirm").val();
			if(pwd1 != "" || pwd2 != "") {
				if(pwd1 == pwd2) {
					$("#passwordConfirm-success").show();
					$("#passwordConfirm-danger").hide();
					isPwCheck = true;
				} else {
					$("#passwordConfirm-success").hide();
					$("#passwordConfirm-danger").show();
					isPwCheck = false;
				}
			}
			
			if(isIdCheck && isAuthCheck && isPwCheck) $("#submit").removeAttr("disabled");
			else $("#submit").attr("disabled", "disabled");
		});
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
						<div class='col-6'>
							<input type='text' class='form-control' placeholder='이메일' id='join-userMail' name='userId' required/>
						</div>
						<div class='col-3'><button type='button' class='btn btn-secondary idCheck' style='width: 100%' id='idCheck'>중복확인</button></div>
						<div class='col-3'><a type='button' class='btn btn-secondary' href='#' style='width: 100%' data-dismiss='modal' data-toggle='modal' data-target='#join-accreditModal' id='emailBtn'>인증</a></div>
						<p id='result'>
							<span id='idChkMsg'>아이디를 확인해 주십시오.</span>
						</p>
					</div>
					<div class='form-group row'>
						<div class='col-8'>
							<input type='text' class='form-control' placeholder='인증번호' id='join-accreditNum' name='accreditNum'/>
						</div>
						<div class='col-4'><a type='button' class='btn btn-secondary' style='width: 100%' id='emailAuthBtn'>확인</a></div>
					</div>
					<span id='mail_check_input_box_warn'></span>
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
						<button type='submit' class='col-12 btn btn-primary mt-3 ml-2' disabled='disabled' id='submit'>가입</button>
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