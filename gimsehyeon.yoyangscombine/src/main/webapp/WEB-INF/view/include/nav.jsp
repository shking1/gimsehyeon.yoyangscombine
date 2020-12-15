<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<div id='common-header'>
	<ol>
		<li id='gnb-li'>
		<a href='<%= request.getContextPath() %>/admin'><button id='gnb_btn'>회원관리</button></a>
		</li>
		<li id='gnb-li'>
		<a href="#"><button id='gnb_btn'>신고접수</button></a>
		</li>
		<li id='gnb-li'>
		<a href="#"><button id='gnb_btn'>게시물 관리</button></a>
		</li>
	</ol>
</div>