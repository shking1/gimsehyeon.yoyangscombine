<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
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
<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="./communication/write";
	});
});
var link = window.location.pathname;
function list(page){
	location.href = link + "?searchOption=${comms.searchOption}" 
			+ "&keyWord=${comms.keyWord}"
			+ "&curPage=" + page;
}
function commClick(commNum) {
	location.href = link + "/post?curPage=${comms.pager.curPage}"
			+ "&searchOption=${comms.searchOption}"
			+ "&keyWord=${comms.keyWord}"
			+ "&communicationNum=" + commNum;
}
</script>
<title>자유 게시판</title>
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
		                  <button type='submit' style='margin-bottom: 10px;' class='btn btn-default'><i class='fa fa-search'></i></button>
		               </div>
		            </div>
	        	</form>
	
				<div>
					<a href='/gimsehyeon.yoyangscombine/communication' id='btn-brother' type='button' class='btn btn-secondary'>자유게시판</a>
				</div>
				<br> 
				<div>
					<a href='../sanatorium/02.html' id='btn-brother' type='button' class='btn btn-secondary'>캘린더</a>
				</div>		
			</div>
			
			<div class='col-9'>
				<div id='title-text' style='text-align: left;'>
					<p>
					자유게시판 &nbsp;
					${comms.count}개의 게시물이 있습니다.
					</p>
				</div>
				<div class='justify-content-center'>
					<table class='table table-sm table-hover table-striped text-center'>
						<thead>
							<tr>
								<th>No.</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var='list' items='${comms.lists}'>
								<tr onClick="commClick('${list.communicationNum}');">
									<td>${list.communicationNum}</td>
									<td>${list.communicationTitle}
										<c:if test='${list.cnt > 0}'>
											<span style='color: red; font-size: 14px;'> (${list.cnt})</span>
										</c:if>
									</td>
									<td>${list.writer}</td>
									<td>${list.writingDate}</td>
								</tr>
							</c:forEach>
							<!-- 페이지 네비게이션 -->
							<tr>
								<td colspan='5' align='center'>
									<c:if test='${comms.pager.curBlock > 1}'>
										<a href="javascript:list('1')">[처음]</a>&nbsp;
									</c:if>
									
									<c:if test='${comms.pager.curBlock > 1}'>
										<a href="javascript:list('${comms.pager.prevPage}')">◀</a>&nbsp;
									</c:if>
									
									<c:forEach var='num' begin='${comms.pager.blockBegin}' end='${comms.pager.blockEnd}'>
										<c:choose>
											<c:when test='${num == comms.pager.curPage}'>
												<span style='color:red;'>${num}</span>&nbsp;
											</c:when>
											<c:otherwise>
												<a href="javascript:list('${num}')">${num}</a>&nbsp;
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:if test='${comms.pager.curBlock <= comms.pager.totalBlock}'>
										<a href="javascript:list('${comms.pager.nextPage}')">▶</a>&nbsp;
									</c:if>
									
									<c:if test='${comms.pager.curPage <= comms.pager.totalPage}'>
										<a href="javascript:list('${comms.pager.totalPage}')">[끝]</a>&nbsp;
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
					<form name='searchForm' action='./communication'>
						<div class='row form-group justify-content-center'>
							<select style='width: 100px;' class='form-control selectpicker noborder' name='searchOption'>
								<c:choose>
									<c:when test="${comms.searchOption == 'all'}">
										<option value='all' selected>전체</option>
										<option value='writer'>작성자</option>
										<option value='communication_title'>제목</option>
									</c:when>
									<c:when test="${comms.searchOption == 'writer'}">
										<option value='all'>전체</option>
										<option value='writer' selected>작성자</option>
										<option value='communication_title'>제목</option>
									</c:when>
									<c:when test="${comms.searchOption == 'communication_title'}">
										<option value='all'>전체</option>
										<option value='writer'>작성자</option>
										<option value='communication_title' selected>제목</option>
									</c:when>
								</c:choose>
							</select>
							
							<input type='text' style='width: 300px;' class='form-control' placeholder='검색어를 입력하세요.'
								name='keyWord' value='${comms.keyWord}'>
							
							<input type='submit' class='btn btn-secondary' value='검색'>
						</div>
						<c:if test='${sessionScope.userName != null}'>
							<button type='button' id='btnWrite' class='btn btn-secondary float-right'>글쓰기</button>
						</c:if>
					</form>
				</div>
			</div>
		</div>
		<!-- include: footer-->
		<jsp:include page='../include/footer.jsp'/>
		<!-- include: footer-->
	</div>
</body>