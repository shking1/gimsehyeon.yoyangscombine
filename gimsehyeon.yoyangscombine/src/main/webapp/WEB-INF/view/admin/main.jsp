<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<head>
<!-- include:lib -->
<%@ include file='../include/lib.jsp' %>
<!-- /include:lib -->
<title>Main(admin)</title>
</head>

<script>
var link = window.location.pathname;
function list(page){
	location.href = link + "?searchOption=${users.searchOption}" 
			+ "&keyWord=${users.keyWord}"
			+ "&curPage=" + page;
}
</script>
<body id='main-admin-body'>
<br>
<div class='container'>
<!-- include: header -->
<%@ include file='../include/header.jsp' %>
<!-- /include: header -->
<!-- include: nav -->
<%@ include file='../include/nav.jsp' %>
<!-- /include: nav -->
<br>

<div id='admin-main-board'>
<!-- 리스트 게시판 시작-->
<h4 id='board-title' style='text-align:left'>회원관리</h4>
<table class='sub_news' border='1' cellspacing='0'>
   <caption>회원관리(게시판형식)</caption>
   <thead>
      <tr>
         <th scope='col' style='text-align:center;'>No.</th>
         <th scope='col' style='text-align:center;'>아이디(이메일)</th>
         <th scope='col' style='text-align:center;'>이름</th>
         <th scope='col' style='text-align:center;'>신고 수</th>
         <th scope='col' style='text-align:center;'>가입일</th>
      </tr>
   </thead>
   <tbody>
     <c:forEach var='list' items='${users.lists}'>
		<tr>
			<td>${list.userNum}</td>
			<td>${list.userId}</td>
			<td>${list.userName}</td>
			<td>${list.numOfReport}</td>
			<td>${list.joinDate}</td>
		</tr>
	</c:forEach>
	<!-- 페이지 네비게이션 -->
	<tr>
		<td colspan='5' align='center'>
			<c:if test='${users.pager.curBlock > 1}'>
				<a href="javascript:list('1')">[처음]</a>&nbsp;
			</c:if>
			
			<c:if test='${users.pager.curBlock > 1}'>
				<a href="javascript:list('${users.pager.prevPage}')">◀</a>&nbsp;
			</c:if>
			
			<c:forEach var='num' begin='${users.pager.blockBegin}' end='${users.pager.blockEnd}'>
				<c:choose>
					<c:when test='${num == users.pager.curPage}'>
						<span style='color:red;'>${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test='${users.pager.curBlock <= users.pager.totalBlock}'>
				<a href="javascript:list('${users.pager.nextPage}')">▶</a>&nbsp;
			</c:if>
			
			<c:if test='${users.pager.curPage <= users.pager.totalPage}'>
				<a href="javascript:list('${users.pager.totalPage}')">[끝]</a>&nbsp;
			</c:if>
		</td>
	</tr>
   </tbody>
</table>
<div class='search-brother'>
   <form name='searchForm' action='./admin'>
		<div class='row form-group justify-content-center'>
			<select style='width: 100px;' class='form-control selectpicker noborder' name='searchOption'>
				<c:choose>
					<c:when test="${users.searchOption == 'all'}">
						<option value='all' selected>전체</option>
						<option value='user_id'>회원아이디</option>
						<option value='user_name'>회원이름</option>
					</c:when>
					<c:when test="${users.searchOption == 'user_id'}">
						<option value='all'>전체</option>
						<option value='user_id' selected>회원아이디</option>
						<option value='user_name'>회원이름</option>
					</c:when>
					<c:when test="${users.searchOption == 'user_name'}">
						<option value='all'>전체</option>
						<option value='user_id'>회원아이디</option>
						<option value='user_name' selected>회원이름</option>
					</c:when>
				</c:choose>
			</select>
			
			<input type='text' style='width: 300px;' class='form-control' placeholder='검색어를 입력하세요.'
				name='keyWord' value='${users.keyWord}'>
			
			<input type='submit' class='btn btn-secondary' value='검색'>
		</div>
	</form>
</div>
</div>
<!-- 리스트 게시판 끝-->
<!-- include: footer -->
<%@ include file='../include/footer.jsp' %>
<!-- /include: footer -->
</div>
</body>