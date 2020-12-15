<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<head>
<!-- include:lib -->
<%@ include file='../include/lib.jsp' %>
<!-- /include:lib -->
<title>Main(admin)</title>
</head>
<script>
<!--

//-->
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
   <input id='search-man' type='text'  
   style='border:1px solid'
   title='검색' placeholder='아이디나 이름을 입력하세요..' autofocus>
   <button id='search-btn-admin' type='button' class='btn btn-dark'>검색</button>
</div>
</div>
<!-- 리스트 게시판 끝-->
<!-- include: footer -->
<%@ include file='../include/footer.jsp' %>
<!-- /include: footer -->
</div>
</body>