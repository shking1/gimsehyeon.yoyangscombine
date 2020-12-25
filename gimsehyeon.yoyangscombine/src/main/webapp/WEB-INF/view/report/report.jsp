<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
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

#search-dropdown {
	width: 140px;
}

#search {
	margin-left: 40px;
	width: 50px;
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
function reportOnModal(){
	$('#reportCheck').modal('show');
}

function list(page){
	location.href = link + "?searchOption=${reports.searchOption}" 
			+ "&keyWord=${reports.keyWord}"
			+ "&curPage=" + page;
}
</script>
</head>
<div class = 'container'>
<!-- include: header -->
<%@ include file='../include/header.jsp' %>
<!-- /include: header -->
<!-- include: nav -->
<%@ include file='../include/nav.jsp' %>
<!-- /include: nav -->
	<div class='col'>
		<div class='justify-content-center'>
		<h4 id='board-title' style="text-align:left">신고 게시판</h4>
			<table class='table table-sm table-hover table-striped text-center'>
				<thead>
					<tr>
						<th></th>
						<th>No.</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
<tbody>
<c:forEach var='report' items='${reports.boards}'>
	<tr id='#reportContents'>
		<td></td>
		<td>${report.reportNum}</td>
		<td>
			<c:choose>
				<c:when test="${report.reportCode eq '1'}">
				도배/광고성
				</c:when>
				<c:when test="${report.reportCode eq '2'}">
				선정성/폭력성
				</c:when>
				<c:when test="${report.reportCode eq '3'}">
				명예훼손
				</c:when>
				<c:when test="${report.reportCode eq '4'}">
				자살암시/유해성
				</c:when>
				<c:otherwise>
				기타
				</c:otherwise>
			</c:choose>
		</td>
		<td onClick='reportOnModal()'>${report.reportContent}</td>
		<td>${report.reporter}</td>
		<td>${report.reportReceptionDate}</td>
	</tr>
</c:forEach>
<tr>
	<td colspan='6' align='center'>
		<c:if test='${reports.pager.curBlock > 1}'>
			<a href="javascript:list('1')">[처음]</a>&nbsp;
		</c:if>								
		<c:if test='${reports.pager.curBlock > 1}'>
			<a href="javascript:list('${reports.pager.prevPage}')">◀</a>&nbsp;
		</c:if>								
		<c:forEach var='num' begin='${reports.pager.blockBegin}' end='${reports.pager.blockEnd}'>
			<c:choose>
				<c:when test='${num == reports.pager.curPage}'>
					<span style='color:red;'>${num}</span>&nbsp;
				</c:when>
				<c:otherwise>
					<a href="javascript:list('${num}')">${num}</a>&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>								
		<c:if test='${reports.pager.curBlock <= reports.pager.totalBlock}'>
			<a href="javascript:list('${reports.pager.nextPage}')">▶</a>&nbsp;
		</c:if>								
		<c:if test='${reports.pager.curPage <= reports.pager.totalPage}'>
			<a href="javascript:list('${reports.pager.totalPage}')">[끝]</a>&nbsp;
		</c:if>
	</td>
</tr>
</tbody>
					
				</table>
				<hr>				
				<div class='float-right'>
					<a class='btn btn-secondary' data-toggle='modal' data-target='#reportAccept'>수락</a>
					<a class='btn btn-secondary' data-toggle='modal' data-target='#reportCancel'>기각</a>
				</div>
			</div>
		</div>
	
		<div id='reportCheck' class='modal fade' tabindex='-1'>
			<div class='modal-dialog'>
				<div class='modal-content'>
					<div class='float-right mr-2'>
					<button type='button' class='close' data-dismiss='modal'>
								<span>&times;</span>
					</button>
					</div>
					<div class='modal-body'>
					<c:forEach var='report' items='${reports.boards}'>
						<h6>신고사유 : 
							<c:choose>
								<c:when test="${report.reportCode eq '1'}">
								도배/광고성
								</c:when>
								<c:when test="${report.reportCode eq '2'}">
								선정성/폭력성
								</c:when>
								<c:when test="${report.reportCode eq '3'}">
								명예훼손
								</c:when>
								<c:when test="${report.reportCode eq '4'}">
								자살암시/유해성
								</c:when>
								<c:otherwise>
								기타
								</c:otherwise>
							</c:choose>
						</h6>
						신고자 : ${report.reporter}<br>
						비매너유저 : 외부값<br>
						<c:choose>
							<c:when test='${report.reviewNum > 0}'>
						  		게시글확인 : <a href="report/${report.reviewNum}">No.${report.reviewNum}</a>
						  	</c:when>
						 	<c:otherwise>
								게시글확인 : <a href='#'>No.1234</a><br>
							</c:otherwise>
						</c:choose>
						
						${report.reportContent}<br>
					</c:forEach>	
					</div>

					<div class='modal-footer'>
						<a class='btn btn-secondary' data-dismiss='modal' data-toggle='modal' data-target='#reportAccept'>수락</a>
						<a class='btn btn-secondary' data-dismiss='modal' data-toggle='modal' data-target='#reportCancel'>기각</a>
					</div>
				</div>
			</div>
		</div>
		
		<div id='reportCancel' class='modal fade' tabindex='-1'>
			<div class='modal-dialog'>
				<div class='modal-content'>
					<div class='modal-body text-center'>
						<br>
						<p style='font-size: 20px;'>기각 메세지를 보냈습니다.</p>
					</div>

					<div class='modal-footer'>
						<a class='btn btn-secondary btn-block' data-dismiss='modal'>확인</a>
					</div>
				</div>
			</div>
		</div>
		
		<div id='reportAccept' class='modal fade' tabindex='-1'>
			<div class='modal-dialog'>
				<div class='modal-content'>
					<div class='modal-body text-center'>
						<br>
						<p style='font-size: 20px;'>수락 확인 메세지를 보냈습니다.</p>
					</div>

					<div class='modal-footer'>
						<a class='btn btn-secondary btn-block' data-dismiss='modal'>확인</a>
					</div>
				</div>
			</div>
		</div>
<!-- include: footer-->
<jsp:include page='../include/footer.jsp'/>
<!-- include: footer-->
</div>