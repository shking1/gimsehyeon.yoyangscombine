<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<head>
<!-- include:lib -->
<%@ include file='../include/lib.jsp' %>
<!-- /include:lib -->
<title>Main(admin)</title>
</head>
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
         <th scope='col' style='text-align:center;'>게시글 수</th>
         <th scope='col' style='text-align:center;'>가입일</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td class='title'>123458</td>
         <td><a href='user/01.html' class='id-first-board'>kent@d..</a></td>
         <td><a href='user/01.html' class='name-first-board'>김성식</a></td>
         <td class='write-first-board'>0</td>
         <td class='date-first-board'>2020/11/01</td>
      </tr>
      <tr>
         <td class='title'>123457</td>
         <td><a href='user/01.html' class='id-first-board'>tast@na..</a></td>
         <td><a href='user/01.html' class='name-first-board'>박두칠</a></td>
         <td class='write-first-board'>3</td>
         <td class='date-first-board'>2020/10/19</td>
      </tr>
      <tr>
         <td class='title'>123456</td>
         <td><a href='user/01.html' class='id-first-board'>tanke@..</a></td>
         <td><a href='user/01.html' class='name-first-board'>요양원미식가</a></td>
         <td class='write-first-board'>2</td>
         <td class='date-first-board'>2020/10/01</td>
      </tr>
   </tbody>
</table>
<div>
<br>
   <ul class='pagination justify-content-center'>
      <li><a href='#' style='margin-right: 5px;' class='text-secondary'> ◀ </a></li>
      <li><a href='#' style='margin-right: 5px;' class='text-secondary'> 1 </a></li>
      <li><a href='#' style='margin-right: 5px;' class='text-secondary'> 2 </a></li>
      <li><a href='#' style='margin-right: 5px;' class='text-secondary'> 3 </a></li>
      <li><a href='#' style='margin-right: 5px;' class='text-secondary'> 4 </a></li>
      <li><a href='#' style='margin-right: 5px;' class='text-secondary'> 5 </a></li>
      <li><a href='#' style='margin-right: 5px;' class='text-secondary'> ▶ </a></li>
   </ul>
</div>
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