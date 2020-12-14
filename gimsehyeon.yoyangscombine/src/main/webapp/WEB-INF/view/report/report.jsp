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
						<tr>
							<td><input type='radio' name='reportSelect'></td>
							<td>123</td>
							<td>명예훼손</td>
							<td><a style='color: black; text-decoration: none;' data-toggle='modal' data-target='#reportCheck'>안녕하세요 이...</a></td>
							<td>kent@d..</td>
							<td>2020-11-01</td>
						</tr>

						<tr id='#reportContents'>
							<td><input type='radio' name='reportSelect'></td>
							<td>122</td>
							<td>도배/광고성</td>
							<td><a style='color: black; text-decoration: none;' data-toggle='modal' data-target='#reportCheck'>게시판이 더러...</a></td>
							<td>tast@na..</td>
							<td>2020-10-19</td>
						</tr>
						
						<tr>
						
							<td><input type='radio' name='reportSelect'></td>
							<td>121</td>
							<td>기타</td>
							<td><a style='color: black; text-decoration: none;' data-toggle='modal' data-target='#reportCheck'>정지부탁드립니...</a></td>
							<td>tanke@...</td>
							<td>2020-10-01</td>
						</tr>
					</tbody>
				</table>
				<hr>
				<div>
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
						<h6>신고사유 : 명예훼손</h6>
						신고자 : 박성식이 <br>
						비매너유저 : 안녕하세요<br>
						게시글확인 : <a href='#'>No.1234</a><br>
						
						안녕하세요 이 사람 자꾸 사람들한테 욕하고 다녀니네요;; 빨리 정지 부탁드려요 <br>
						
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