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
	<select id='search-dropdown' name='search-dropdown'>
		<option value='seoul'>지역선택</option>
		<option value='seoul'>서울</option>
		<option value='incheon'>인천</option>
		<option value='busan'>부산</option>
	</select>
	<input id='search' type='text'  title='검색' value='실버~ 요양원' placeholder='지역선택 후 요양원을 검색하세요' autofocus>
	<a href='sanatorium/01.html'><button id='search-button'>검색</button></a>
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