<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
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

#e_profile_img{
	width:150px;
	height:170px;
	border:2px solid black;
	margin-left:20px;
}

#btn-brother
{
	font-size:3pt;
}

</style>
<div class='container'>
<!-- include:header -->
<jsp:include page='../include/header.jsp'/>
<!-- /include:header -->
	<h2 style='margin-bottom:50px'>MYPAGE</h2>
	<div class='row'>
		<div class='col-md-4'>
	      <div id='profile_img'>프로필 이미지 200x220</div>
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
					<div><h5>${userName} 보호자님</h5></div><br>
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
										<input type='password' class='form-control' id='last_pw' placeholder='기존 비밀번호' />
									</div>
									<div class='form-gruop'>
										<label for='new_pw' class='col-form-label'>새로운 비밀번호를 입력하세요. </label>
										<input type='password' class='form-control' id='new_pw' placeholder='새로운 비밀번호'/>
									</div>
									<div class='form-gruop'>
										<label for='check_pw' class='col-form-label'>비밀번호를 다시 한번 입력하세요.</label>
										<input type='password' class='form-control' id='check_pw' placeholder = '새 비밀번호 확인'/>
									</div>
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
											<p>성공적으로 수정되었습니다.</p>
										</div>
										<div class='modal-footer'>
											<button type='button' class='btn btn-secondary' data-dismiss='modal'>닫기</button>
										</div>
									</div>
								</div>
							</div>
							<div class='modal-footer'>
								<button type='button' class='btn btn-secondary' data-dismiss='modal'>닫기</button>
								<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#real_mod'>확인</button>
							</div>
						</div>
					</div>
				</div>

				<div id ='buttons' class='container'>
					<div class='form-group row'>
						<button type='button' id='btn-brother' class='btn btn-secondary mt-2' onclick="location.href = '../user/03.html'" style='width: 70px'>정보수정</button> 
						<button type='button' id='btn-brother' class='btn btn-secondary mt-2 ml-1' onclick="location.href = '../user/withdraw'" style='width: 70px'>회원탈퇴</button> 
						<button type='button' id='btn-brother' class='btn btn-secondary mt-2 ml-1' data-toggle='modal' data-target='#pw_fix' style='width: 90px'>비밀번호 수정</button>    
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<!-- 피보호자 정보 -->
	
	<h2 style='margin-bottom:50px'>피보호자 입력란 <button type='button' id='btn-brother' class='btn btn-secondary' onclick = "location.href = '../user/04.html'">추가</button></h2>
	<div class='row'>
		<div class='col-md-4'>
			<div id='e_profile_img'>프로필 이미지 150x170</div>
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
					<div class='form-gruop'>
						<h5>홍상직
							<button type='button' id='btn-brother' class='btn btn-secondary' onclick = "location.href = '../user/05.html'">수정</button>
							<button type='button' id='btn-brother' class='btn btn-secondary' data-toggle='modal' data-target='#del-it'>삭제</button>
	               	</h5>
				      
						<div id='del-it' class='modal fade' tabindex='-1'>
							<div class='modal-dialog'>
								<div class='modal-content'>
									<div class='modal-header'>
										<h5 class='modal-title'>피보호자 정보삭제</h5>
										<button type='button' class='close' data-dismiss='modal'>
											<span>&times;</span>
										</button>
									</div>
									<div class='modal-body'>
										<p>피보호자 정보를 삭제하시겠습니까?<br>삭제된 정보는 복구할 수 없습니다.</p>
									</div>
									<div id='realdel' class='modal fade' tabindex='-1'>
										<div class='modal-dialog'>
											<div class='modal-content'>
												<div class='modal-header'>
													<h5 class='modal-title'>삭제</h5>
													<button type='button' class='close' data-dismiss='modal'>
														<span>&times;</span>
													</button>
												</div>
												<div class='modal-body'>
													<p>삭제되었습니다.</p>
												</div>
												<div class='modal-footer'>
													<button type='button' class='btn btn-secondary' data-dismiss='modal'>확인</button>
												</div>
											</div>
										</div>
									</div>
									<div class='modal-footer'>
										<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
										<button type='button' class='btn btn-secondary' data-toggle='modal' data-target='#realdel'>삭제</button>
									</div>
								</div>
							</div>
						</div>
					</div>
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
					<h5>실버~요양원 <a href='http://www.theheritage.kr/'>바로가기</a></h5>
				</div>
			</div>
			<br><br><br>
		</div>
	</div>
<!-- include:footer -->
<%@ include file='../include/footer.jsp' %>
<!-- include:footer -->
</div>