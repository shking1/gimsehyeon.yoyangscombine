<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ page isErrorPage='true' %>
<!-- include:lib -->
<%@ include file='../../include/lib.jsp' %>
<!-- /include:lib -->
<style>
#error_img {
	width: 500px;
	height: 240px;
	border: 1px solid black;
	margin-top: 40px;
	margin-left: 10px;
}
</style>
<script>
var imgError = function (image) {
	image.onerror = "";
	var parent = image.parentElement;
	var parentTag = parent.innerHTML;
	var brokenImageTag = image.outerHTML;
	parent.innerHTML = parentTag.replace(brokenImageTag, 
	      `<div id='error_img'>로고이미지 500x240</div>`);
	return true;
}
</script>
<br><br><br><br>
<title>Error</title>
<div class='container'>
<div class='row justify-content-center'>
	<div class='col-10'>
		<div class='ml-2'>
			<h4>ERROR</h4><br>잘못된 접근입니다.
		</div>
		<a href='<%= request.getContextPath() %>'><img src='<%= request.getContextPath() %>/img/logo.png' id='error_img' onerror='imgError(this);'></a>
		<br>
		<div class='ml-2'>
			세계최강 요양원 검색사이트<br><a href='<%= request.getContextPath() %>'>메인으로 돌아가기</a>
			<br>
			INFO: 
			(주)요양스컴바인 대표 김세현 서울시 00동 00로 00길 00-00 <br>
			고객문의: 대표번호 0000-0000 | 이메일 yoyangsCombined@yoyang.kr 2020ⓒ All rights reserved<br>
		</div>
	</div>
</div>
</div>