<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' isELIgnored='false' %>
<head>
<!-- include:lib -->
<%@ include file='./include/lib.jsp' %>
<!-- /include:lib -->
<title>Main</title>
</head>
<body id='main-body'>
<br>
<div class='container'>
<!-- include: header-->
<jsp:include page='./include/header.jsp'/>
<!-- include: header-->
<div id='title-text'>
	<br>
	<p>
	당신의 요양원을 검색하세요
	</p>        
</div> 
<div id='box'>
	<form action='sanatorium/01.process'>
         <select id="search-dropdown" name="siDoCd">
                  <option value="42" >강원도</option>
                  <option value="41" >경기도</option>
                  <option value="48" >경상남도</option>
                  <option value="47" >경상북도</option>
                  <option value="29" >광주광역시</option>
                  <option value="27" >대구광역시</option>
                  <option value="30" >대전광역시</option>
                  <option value="26" >부산광역시</option>
                  <option value="11" selected>서울특별시</option>
                  <option value="36" >세종특별자치시</option>
                  <option value="31" >울산광역시</option>
                  <option value="28" >인천광역시</option>
                  <option value="46" >전라남도</option>
                  <option value="45" >전라북도</option>
                  <option value="50" >제주도</option>
                  <option value="44" >충청남도</option>
                  <option value="43" >충청북도</option>
            </select>
	<input id='search' type='text' name='searchName' title='검색' value='실버~ 요양원' placeholder='지역선택 후 요양원을 검색하세요' autofocus>
	<button type='submit' id='search-button'>검색</button>
</div>
<div id='box2'>
	수많은 보호자님들의 선택! 정보는 나눌수록 넓어집니다.
	<a href='<%= request.getContextPath() %>/communication' style='display:line'>자유게시판 바로가기</a>
	<br><br><br>
</div>
<!-- include: footer -->
<%@ include file='./include/footer.jsp' %>
<!-- include: footer -->
</div>
</body>