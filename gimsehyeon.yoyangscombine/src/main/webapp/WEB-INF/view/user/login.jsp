<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form' %>
<!-- include:lib -->
<%@ include file='../include/lib.jsp' %>
<!-- /include:lib -->
<title>로그인</title>
<div class='container'>
	<div class='row'>
		<div class='col-md-5' id='login-border'>
			<div id='login_img' OnClick="location.href ='..'" style='cursor:pointer;'>로고이미지 150x80</div>
			<br>
			<div class='ml-2'>
				세계 최고의 요양원을 찾아 드리는 <br> 요양원계의 헤르메스... 그건 바로
				<h4><a href='..'>요양스 컴바인</a></h4>
			</div>
		</div>
		<div class='col-md-5' id='login-border'>
			<form method='post' id='login_form'>
				<div class='form-group row'>
					<label class='col-2 col-form-label'> 
						<svg width='1.5em' height='1.5em' viewBox='0 0 16 16' class='bi bi-person' fill='currentColor' xmlns='http://www.w3.org/2000/svg'>
							<path fill-rule='evenodd' d='M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z' />
						</svg>
					</label>
					<div class='col-10'>
						<input type='text' class='form-control' placeholder='이메일' id='login-id' name='memberId' required/>
					</div>
				</div>
				<div class='form-group row'>
					<label class='col-2 col-form-label'> 
						<svg width='1.5em' height='1.5em' viewBox='0 0 16 16' class='bi bi-lock' fill='currentColor' xmlns='http://www.w3.org/2000/svg'>
							<path fill-rule='evenodd' d='M11.5 8h-7a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h7a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1zm-7-1a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2h-7zm0-3a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z' />
						</svg>
					</label>
					<div class='col-10'>
						<input type='password' class='form-control' id='login-pwd' name='password'
							placeholder='비밀번호' required/>
					</div>
				</div>
				<div class='form-group row'>
					<button type='submit' id='login'
						class='btn btn-primary mt-3 ml-2' href='#' style='width: 45%'>로그인</button>
					<a type='button' class='btn btn-secondary mt-3 ml-2' href='02.html'
						style='width: 45%'>회원가입</a>
					<span></span><br>
					${msg}
				</div>
			</form>
		</div>
	</div>
	<!-- include: footer -->
	<%@ include file='../include/footer.jsp' %>
	<!-- include: footer -->
</div>