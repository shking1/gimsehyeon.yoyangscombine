<%@ page language='java' contentType='text/html; charset=utf-8'	pageEncoding='utf-8'%>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<head>
<!-- include:lib -->
<%@ include file='../include/lib.jsp'%>
<!-- /include:lib -->
<title>게시글 수정</title>
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
				<form name='commEditForm' method='post' action='./update'>
					<div class='row form-group ml-3'>
						<label for='communicationTitle'>
								<b style='font-size: 24px;'>제목 : </b>
							</label>
							<div class='ml-2'>
								<input type='text' class='form-control col-xs-4' id='communicationTitle'
									name='communicationTitle' value='${comm.communicationTitle}' required>
							</div> 
					</div>
					<div style='font-size: 16px;' class='row ml-3'>
						<span> 작성자 : ${comm.writer} <br> 
							작성일 : ${comm.writingDate}
						</span>
					</div>
					<hr>
					<div class='form-group'>
						<textarea name='communicationPost' class='form-control' style='font-size: 18px;' rows='10' cols='50' required>${comm.communicationPost}</textarea>
					</div>
					<div class='row justify-content-end'>
						<div>							
							<button class='btn btn-secondary' onclick='history.go(-1)'>취소</button>
							<input type='hidden' name='communicationNum' value='${comm.communicationNum}'>
								<button type='submit' class='btn btn-secondary'>수정</button>						
						</div>
					</div>
				</form>
			</div>
			
			<div class='modal fade' id='reportReview'>
			    <div class='modal-dialog'>
			        <div class='modal-content'>
			            <div class='modal-header'>
			                <h5 class='modal-title'>신고하기</h5>
			                <button type='button' class='close' data-dismiss='modal' tabindex='-1'>
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
		</div>
	</div>
	<!-- include: footer-->
	<jsp:include page='../include/footer.jsp'/>
	<!-- include: footer-->
</div>
</body>
