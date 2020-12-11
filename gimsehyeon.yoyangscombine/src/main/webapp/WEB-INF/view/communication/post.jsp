<%@ page language='java' contentType='text/html; charset=utf-8'	pageEncoding='utf-8'%>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<head>
<!-- include:lib -->
<%@ include file='../include/lib.jsp'%>
<!-- /include:lib -->
<title>게시글 상세보기</title>
<style>
.fileDrop {
	width: 600px;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
}

#border {
	width: 120px;
	height: 150px;
	border: 1px solid black;
}

#border2 {
	width: 500px;
	height: 180px;
	border: 1px solid black;
	margin-left: 0px;
}

.checked {
	color: orange;
}

.list {
	margin-top: 30px;
	padding: 10px;
}

#search-li {
	list-style: none;
	margin-top: 25px;
}

#detailsearch-form {
	display: inline-block;
}

#btns {
	list-style: none;
	margin: 10px;
}

#search {
	margin-left: 40px;
	width: 50px;
}

#btn-brother{
	width: 140px;
}

input {
	padding: 0 0 0 0;
}

ul {
	padding: 0 0 0 0;
}

#search_input {
	width: 100px;
}
label[for='boradTitle'] {
	position: relative;
	top: -1.5px;
}

span {
	margin-top: -15px;
}

#reportreason-dropdown{
   width: 450px;
   margin-bottom: 20px;
}

#reporttext{
   width:450px;
   height:100px;
}
</style>
<script>
// $(function(){
// 	$('#btnDelete').click(function(){
// 		$('#deleteBoard').modal('show');
// 	});
// });
function deleteModal() {
	$('#deleteBoard').modal('show');
}
$(function(){
	$("#btnRemove").click(function(){
		document.commPostForm.action = "./delete";
		document.commPostForm.submit();
	});
});
function btnUpdate(commNum) {
	location.href = "editPost?&communicationNum=" + commNum;
}
</script>
</head>
<body>
<br>
<div class='container'>
	<!-- include: header-->
	<jsp:include page='../include/header.jsp'/>
	<!-- include: header-->
	<div class='row'>
		<div class='col-3 justify-content-center text-center'>
			<ul>
				<li id='search-li'>
					<select id='search-dropdown-o' name='city-search-dropdown-o'>
						<option value='seoul'>서울</option>
						<option value='incheon'>인천</option>
						<option value='busan'>부산</option>
					</select>
				</li>
				<li id='search-li'>
					<select id='search-dropdown-o' name='country-search-dropdown-o'>
						<option value='seoul'>가평군</option>
						<option value='incheon'>양평군</option>
						<option value='busan'>영천군</option>
					</select>
				</li>
				<li id='search-li'>
					<select id='search-dropdown-o' name='district-search-dropdown-o'>
						<option value='seoul'>관양동</option>
						<option value='incheon'>비산동</option>
						<option value='busan'>부평동</option>
					</select>
				</li>
			</ul>
			<form class='navbar-form pull-left' role='search'>
				<div class='input-group'>
					<input type='text' class='form-control' placeholder='Search'>
					<div class='input-group-btn'>
						<button type='submit' style='margin-bottom: 10px;' class='btn btn-default'>
							<i class='fa fa-search'></i>
						</button>
					</div>
				</div>
			</form>
			<br>
			<div>
				<a href='/gimsehyeon.yoyangscombine/communication' id='btn-brother' type='button' class='btn btn-secondary'>자유게시판</a>
			</div>
			<br>
			<div>
				<a href='../sanatorium/02.html' id='btn-brother' type='button' class='btn btn-secondary'>캘린더</a>
			</div>
		</div>

		<div class='col-9' style='overflow:scroll; width:540px; height:800px;'>
			<br>
			<div class='row justify-content-center'>
				<form name='commPostForm' method='post'>
					<div class='row form-group ml-3'>
						<label for='boradTitle'><b style='font-size: 24px;'>제목 : </b></label>
						<div class='ml-2'>
							<p style='font-size: 22px;'>${commPost.communicationTitle}</p>
						</div>
					</div>
					<div style='font-size: 16px;' class='row ml-3'>
						<span> 작성자 : ${commPost.writer} <br> 
							작성일 : ${commPost.writingDate}
						</span>
					</div>
					<hr>
					<div class='form-group'>
						<textarea class='form-control-plaintext' style='font-size: 18px;' rows='10' cols='50' readonly>${commPost.communicationPost}
						</textarea>
					</div>
					<div class='row justify-content-end'>
						<div>
							<input type='hidden' name='communicationNum' value='${commPost.communicationNum}'>
							<c:if test='${sessionScope.userName == commPost.writer }'>
								<a class='btn btn-secondary' onClick='deleteModal()'>삭제</a>
								
								<a class='btn btn-secondary'
									href='/gimsehyeon.yoyangscombine/communication/editPost?communicationNum=${commPost.communicationNum}'>수정</a>
							</c:if>
								<button id='btnReport' class='btn btn-secondary'>신고하기</button>
						</div>
					</div>
				</form>
			</div>
			
			<div id='deleteBoard' class='modal fade' role='dialog' tabindex='-1'>
				<div class='modal-dialog'>
					<div class='modal-content'>
						<div class='modal-header'>
							<button type='button' class='close' data-dismiss='modal'>
								<span>&times;</span>
							</button>
						</div>

						<div class='modal-body text-center'>
							<p style='font-size: 20px;'>
								정말 삭제하시겠습니까? <br>
								삭제된 글은 복구되지 않습니다.
							</p>
						</div>

						<div class='modal-footer'>
							<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
							<button class='btn btn-secondary' id='btnRemove'>삭제</button>
						</div>
					</div>
				</div>
<!-- 				<div id='deleteBoradSuccess' class='modal fade' tabindex='-1'> -->
<!-- 					<div class='modal-dialog'> -->
<!-- 						<div class='modal-content'> -->
<!-- 							<div class='modal-header'> -->
<!-- 								<button type='button' class='close' data-dismiss='modal'> -->
<!-- 									<span>&times;</span> -->
<!-- 								</button> -->
<!-- 							</div> -->
	
<!-- 							<div class='modal-body text-center'> -->
<!-- 								<p style='font-size: 20px;'>게시글이 삭제되었습니다.</p> -->
<!-- 							</div> -->
	
<!-- 							<div class='modal-footer'> -->
<!-- 								<a href='01.html' class='btn btn-secondary'>확인</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
			
			<div class='justify-content-center' style='width: 540px;'>
				<form style='width: 357px; margin: auto;'>
					<p style='font-size: 20px;'>댓글</p>
					<hr>
					<div class='row form-group justify-content-center'>
						<div class='col-9 p-0'>
							<input type='text' class='form-control' id='repleTitle' placeholder='댓글을 입력하세요.'>
						</div>
						<a type='button' class='btn btn-secondary col-2' data-toggle='modal' data-target='#addReple'>작성</a>		
					</div>
				</form>
<!-- 				<div class='row' style='width: 400px; margin: auto;'> -->
<!-- 					<p class='mr-4' id='repleWriter'> 작성자 : 최한석 <br> 작성일 : 2020-11-25 </p> -->
<!-- 					<div class='ml-2 justify-content-end'> -->
<!-- 						<div> -->
<!-- 							<a type='button' class='btn btn-secondary' data-toggle='modal' data-target='#deleteReple'>삭제</a> -->
<!-- 							<a type='button' class='btn btn-secondary' id='modifyReple'>수정</a> -->
<!-- 							<a type='button' class='btn btn-secondary' data-toggle='modal' data-target='#reportReview'>신고하기</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<input class='form-control-plaintext' id='comment' style='font-size: 18px;' placeholder='환영합니다~~~~' readonly> <br> -->
<!-- 					<nav> -->
<!-- 						<div class='nav'> -->
<!-- 							<a class='nav-link' data-toggle='tab' href='#commentRepleShow'>댓글(1)</a> -->
<!-- 						</div> -->
<!-- 					</nav> -->
<!-- 					<div class='tab-content'> -->
<!-- 						<div class='tab-pane fade' id='commentRepleShow'> -->
<!-- 							<div class='row ml-1' style='width: 400px; margin: auto;'> -->
<!-- 								<p class='mr-2' id='repleWriter'> ㄴ작성자 : 한아름 <br> 　작성일 : 2020-11-25 </p> -->
<!-- 								<div class='ml-1 justify-content-end'> -->
<!-- 									<div> -->
<!-- 										<a type='button' class='btn btn-secondary' data-toggle='modal' data-target='#deleteComment'>삭제</a> -->
<!-- 										<a type='button' class='btn btn-secondary' data-toggle='modal' data-target='#modifyComment'>수정</a> -->
<!-- 										<a type='button' class='btn btn-secondary' data-toggle='modal' data-target='#reportReview'>신고하기</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<input class='form-control-plaintext' id='comment' style='font-size: 18px;' placeholder='　잘부탁드립니다!' readonly> <br> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<br>
				<div class='row' style='width: 400px; margin: auto;'>
					<button type='button' class='btn btn-secondary' onclick='history.back()'>뒤로가기</button>
				</div>	
			</div>
			
			<div class='modal fade' id='reportReview'>
			    <div class='modal-dialog'>
			        <div class='modal-content'>
			            <div class='modal-header'>
			                <h5 class='modal-title'>신고하기</h5>
			                <button type='button' class='close' data-dismiss='modal' tableindex='-1'>
			                    <span>&times;</span>
			                </button>
			            </div>
			            <div class='modal-body'>
			                <select id='reportreason-dropdown' class='justify-content-center' name='reportreason-dropdown'>
			                    <option value='advertising'>도배/광고성</option>
			                    <option value='violence'>선정성/폭력성</option>
			                    <option value='defamation'>명예훼손</option>
			                    <option value='hazard'>자살암시/유해성</option>
			                    <option value='other'>기타</option>
			                </select>
			                <textarea id='reporttext'></textarea>
			            </div>
			            <div class='modal-footer'>
			                <button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
			                <button type='button' class='btn btn-secondary' data-dismiss='modal' data-toggle='modal' data-target='#confirmReport'>신고</button>
			            </div>
			        </div>
			    </div>
			</div>
			
			<div id='confirmReport' class='modal fade' tabindex='-1'>
			    <div class='modal-dialog'>
			        <div class='modal-content'>
			            <div class='modal-header'>
			                <h5 class='modal-title'>완료</h5>
			                <button type='button' class='close' data-dismiss='modal'>
			                    <span>&times;</span>
			                </button>
			            </div>
			            <div class='modal-body'>
			                <p>신고완료</p>
			            </div>
			            <div class='modal-footer'>
			                <a href='01.html' class='btn btn-secondary'>확인</a>
			            </div>
			        </div>
			    </div>
			</div>
			
			<div id='deleteReple' class='modal fade' tabindex='-1'>
				<div class='modal-dialog'>
					<div class='modal-content'>
						<div class='modal-header'>
							<button type='button' class='close' data-dismiss='modal'>
								<span>&times;</span>
							</button>
						</div>

						<div class='modal-body text-center'>
							<p style='font-size: 20px;'>
								댓글을 <br>
								삭제하시겠습니까?
							</p>
						</div>

						<div class='modal-footer'>
							<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
							<a class='btn btn-secondary' data-toggle='modal' data-target='#deleteRepleSuccess'>삭제</a>
						</div>
					</div>
				</div>
				
				<div id='deleteRepleSuccess' class='modal fade' tabindex='-1'>
					<div class='modal-dialog'>
						<div class='modal-content'>
							<div class='modal-header'>
								<button type='button' class='close' data-dismiss='modal'>
									<span>&times;</span>
								</button>
							</div>
	
							<div class='modal-body text-center'>
								<p style='font-size: 20px;'>댓글이 삭제되었습니다.</p>
							</div>
	
							<div class='modal-footer'>
								<a href='03.html' class='btn btn-secondary'>확인</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- include: footer-->
	<jsp:include page='../include/footer.jsp'/>
	<!-- include: footer-->
</div>
</body>