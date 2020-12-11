<%@ page language='java' contentType='text/html; charset=utf-8'	pageEncoding='utf-8'%>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<head>
<!-- include:lib -->
<%@ include file='../include/lib.jsp'%>
<!-- /include:lib -->
<script type='text/javascript' src='../res/ckeditor/ckeditor.js'></script>
<style>
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

#search{
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

#search_input{
	width: 100px;
}
</style>
<script>
$(function(){
	$("#btnBack").click(function(){
		location.href="./";
	});
	
	$("#btnSave").click(function(){
		document.saveCommunication.submit();
	});
});
</script>
<title>Insert title here</title>
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
					<a href='01.html' id='btn-brother' type='button' class='btn btn-secondary'>자유게시판</a>
				</div>
				<br>
				<div>
					<a href='../sanatorium/02.html' id='btn-brother' type='button' class='btn btn-secondary'>캘린더</a>
				</div>
			</div>
		
			<div class='col-9' style='overflow:scroll; width:540px; height:800px;'>
				<div id='title-text' style='text-align: left;'>
					<p>게시글 작성</p>
				</div>
				<div class='row justify-content-center'>
					<form id='saveCommunication' name='saveCommunication' method='post'
						action='./insert'>
						<div class='row form-group ml-2'>
							<label for='communicationTitle'>
								<b style='font-size: 24px;'>제목 : </b>
							</label>
							<div class='ml-2'>
								<input type='text' class='form-control col-xs-4' id='communicationTitle'
									placeholder='제목을 입력하세요.' name='communicationTitle'>
							</div> 
						</div>
						<div style='font-size: 12px;' class='row ml-2'>
							<span> 
								작성자 : ${userName}
							</span>
						</div>
						<hr>
						<div class='row form-group justify-content-center'>
							<textarea class='from-control' rows='20' cols='50' 
								name='communicationPost' id='communicationPost' placeholder='내용을 입력하세요.'></textarea>
						</div>
						<hr>
						<div class='row justify-content-end'>
							<div class='col-5'>
								<button type='button' class='btn btn-secondary' id='btnBack'>취소</button>
								<button type='button' class='btn btn-secondary' id='btnSave'>작성</button>
			<!-- 					<a type='button' class='btn btn-secondary' data-toggle='modal' data-target='#addCommunication'>작성</a> -->
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	<!-- 	<div id='addCommunication' class='modal fade' tabindex='-1'> -->
	<!-- 		<div class='modal-dialog'> -->
	<!-- 			<div class='modal-content'> -->
	<!-- 				<div class='modal-header'> -->
	<!-- 					<button type='button' class='close' data-dismiss='modal'> -->
	<!-- 						<span>&times;</span> -->
	<!-- 					</button> -->
	<!-- 				</div> -->
	
	<!-- 				<div class='modal-body text-center'> -->
	<!-- 					<p style='font-size: 20px;'>작성을 완료하시겠습니까?</p> -->
	<!-- 				</div> -->
	
	<!-- 				<div class='modal-footer'> -->
	<!-- 					<button type='button' class='btn btn-secondary' -->
	<!-- 						data-dismiss='modal'>취소</button> -->
	<!-- 					<a class='btn btn-secondary' data-toggle='modal' -->
	<!-- 						data-target='#addCommunicationSuccess'>확인</a> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 		<div id='addCommunicationSuccess' class='modal fade' tabindex='-1'> -->
	<!-- 			<div class='modal-dialog'> -->
	<!-- 				<div class='modal-content'> -->
	<!-- 					<div class='modal-header'> -->
	<!-- 						<button type='button' class='close' data-dismiss='modal'> -->
	<!-- 							<span>&times;</span> -->
	<!-- 						</button> -->
	<!-- 					</div> -->
	
	<!-- 					<div class='modal-body text-center'> -->
	<!-- 						<p style='font-size: 20px;'>게시글이 작성되었습니다.</p> -->
	<!-- 					</div> -->
	
	<!-- 					<div class='modal-footer'> -->
	<!-- 						<a href='01.html' class='btn btn-secondary'>확인</a> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	</div>
</body>
<!-- include: footer-->
<jsp:include page='../include/footer.jsp'/>
<!-- include: footer-->
