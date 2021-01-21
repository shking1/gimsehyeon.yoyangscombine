<%@ page language='java' contentType='text/html; charset=utf-8'	pageEncoding='utf-8'%>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
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
function back() {

	location.href = document.referrer;
}
function deleteModal() {
	$('#deleteBoard').modal('show');
}

function reportModal(){
	$('#reportReview').modal('show');
}

$(function(){
	$("#btnRemove").click(function(){
		document.commPostForm.action = "./delete";
		document.commPostForm.submit();
	});
	
	commentList("1");
	$("#btnComment").click(function(){
		comment();
	});
	
	
});

function comment() {
	var commentPost = $("#commentPost").val();
	var communicationNum = "${commPost.communicationNum}";
	var param = {
		"commentPost" : commentPost,
		"communicationNum" : communicationNum	
	};
	
	$.ajax({
		type : "post",
		url : "../comment/insert",
		data : param,
		success : function() {
			commentList("1");
		}
	});
}

function commentList(num) {
	$.ajax({
		type : "post",
		url : "../comment/list?communicationNum=${commPost.communicationNum}"
			+ "&curPage=" + num,
		success : function(result) {
			document.getElementById("commentPost").value ='';
			$("#commentList").html(result);
		}
	});
}

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
			<form action='../sanatorium/01.process'>
				<ul>     
					<li id='search-li'><select id="search-dropdown-o" name="siDoCd">
						<option value="42">강원도</option>
						<option value="41">경기도</option>
						<option value="48">경상남도</option>
						<option value="47">경상북도</option>
						<option value="29">광주광역시</option>
						<option value="27">대구광역시</option>
						<option value="30">대전광역시</option>
						<option value="26">부산광역시</option>
						<option value="11">서울특별시</option>
						<option value="36">세종특별자치시</option>
						<option value="31">울산광역시</option>
						<option value="28">인천광역시</option>
						<option value="46">전라남도</option>
						<option value="45">전라북도</option>
						<option value="50">제주도</option>
						<option value="44">충청남도</option>
						<option value="43">충청북도</option>
					</select></li>
					
				</ul>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search">
						<div class="input-group-btn">
						   <button type="submit" style="margin-bottom: 10px;" class="btn btn-default"><i class="fa fa-search"></i></button>
						</div>
					</div>
			</form>   
			<br><br>
			<div>
			   <a href="../communication" id='btn-brother' type='button' class='btn btn-secondary'>자유게시판</a>
			</div>
			<br> 
			
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
								<a class='btn btn-secondary'  data-target='#reportPost' data-reporter='${sessionScope.userId}' data-commnum='${commPost.communicationNum}' class='btn btn-secondary' data-dismiss='modal' data-toggle='modal'
								>신고하기</a>
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
			</div>
			
			<div class='justify-content-center' style='width: 540px;'>
				<div style='width: 357px; margin: auto;'>
					<p style='font-size: 20px;'>댓글</p>
					<hr>
					<c:if test='${sessionScope.userName != null}'>
						<div class='row form-group justify-content-center'>
							<div class='col-9 p-0'>
								<input type='text' class='form-control' id='commentPost' name='commentPost' placeholder='댓글을 입력하세요.'>
							</div>
							<input type='hidden' name='communicationNum' value='${commPost.communicationNum}'>
							<button type='button' id='btnComment' class='btn btn-secondary col-2'>작성</button>		
						</div>
					</c:if>
				</div>
				<div id='commentList' class='row' style='width: 450px; margin:auto;'></div>
				<br>
				<div class='row' style='width: 400px; margin: auto;'>
					<a href='/gimsehyeon.yoyangscombine/communication' class='btn btn-secondary'>목록보기</a>
				</div>	
			</div>
			
			<div class='modal fade' id='reportPost'>
			    <div class='modal-dialog'>
			        <div class='modal-content'>
			            <div class='modal-header'>
			                <h5 class='modal-title'>신고하기</h5>
			                <button type='button' class='close' data-dismiss='modal' tabindex='-1'>
			                    <span>&times;</span>
			                </button>
			            </div>
			            <div class='modal-body'>
			            	<form id='report-form' method='post' action='./addReport'>
			                <select id='reportreason-dropdown' class='justify-content-center' name='reportreason-dropdown'>
			                    <option value='1'>도배/광고성</option>
			                    <option value='2'>선정성/폭력성</option>
			                    <option value='3'>명예훼손</option>
			                    <option value='4'>자살암시/유해성</option>
			                    <option value='other'>기타</option>
			                </select>
			                <textarea id='reporttext' name='reportContent'></textarea>
			                <input type='hidden' id='reporter' name='reporter'/>
                			<input type='hidden' id='reportCode' name='reportCode'/>
               				 <input type='hidden' id='reportCommNum' name='commNum'/>
			            </div>
			            <div class='modal-footer'>
			                <button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
			                <button type='button' class='btn btn-secondary' >신고</button>
			                </form>
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
			                <a href='/gimsehyeon.yoyangscombine/communication' class='btn btn-secondary'>확인</a>
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