<%@ page language='java' contentType='text/html; charset=utf-8'	pageEncoding='utf-8'%>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<head>
<!-- include:lib -->
<%@ include file='../include/lib.jsp'%>
<!-- /include:lib -->
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
<title>게시글 작성</title>
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
								placeholder='제목을 입력하세요.' name='communicationTitle' required />
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
							name='communicationPost' id='communicationPost' placeholder='내용을 입력하세요.' required></textarea>
					</div>
					<hr>
					<div class='row justify-content-end'>
						<div class='col-5'>
							<button type='button' class='btn btn-secondary'  onclick='history.back()'>취소</button>
							<button type='submit' class='btn btn-secondary'>작성</button> <!-- id='btnSave' -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- include: footer-->
	<jsp:include page='../include/footer.jsp'/>
	<!-- include: footer-->
</div>
</body>