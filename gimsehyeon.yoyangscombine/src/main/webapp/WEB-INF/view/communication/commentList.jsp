<%@ page language='java' contentType='text/html; charset=utf-8'	pageEncoding='utf-8'%>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<head>
<!-- include:lib -->
<%@ include file='../include/lib.jsp'%>
<!-- /include:lib -->
<script>

$(document).ready(function() {
	$("#reportComment").on('show.bs.modal', function(e) {
		reporter = $(e.relatedTarget).data('reporter');
		commentNum =  $(e.relatedTarget).data('commentnum');
		$('#reporter').val(reporter);
		$('#reportCommentNum').val(commentNum);
		$('#reportCode').val($('#reportreason-dropdown').val());
	});
});
function deleteCommentModal(indexNum) {
	$('#hiddenInput').html("<input type='hidden' id='hiddenValue' name='hiddenValue' value='"+ indexNum +"'/>");
	$('#deleteComment').modal('show');
}
function updateComment(indexNum) {
	$("#commentPost" + indexNum).attr("readonly", false);
	$("#btnUpdateWrite" + indexNum).html("<a class='btn btn-secondary id='updateWrite' onClick='updateCommentWrite("+indexNum+")'>작성</a>");
}

$(function(){
	$("#btnRemoveComment").click(function(){
		RemoveComment();
	});
	
});

function updateCommentWrite(indexNum) {
	var commentNum = $("#commentNum" + indexNum).val();
	var commentPost = $("#commentPost" + indexNum).val();
	var pathName = window.location.href;
	var param = {
		"commentNum" : commentNum,
		"commentPost" : commentPost
	};
	
	$.ajax({
		type : "post",
		url : "../comment/update",
		data : param,
		success : function() {
			location.href = pathName;
		}
	});
}

function RemoveComment() {
	var hiddenValue = $('#hiddenValue').val();
	console.log(hiddenValue);
	var commentNum = $("#commentNum" + hiddenValue).val();
	var pathName = window.location.href;
	var param = {
		"commentNum" : commentNum
	};
	
	$.ajax({
		type : "post",
		url : "../comment/delete",
		data : param,
		success : function() {
			location.href = pathName;
		}
	});
}
</script>
<title>게시글 상세보기</title>
</head>
<body>
<br>
<div class='container'>
	<table style='width: 430px;'>
	<tbody>
		<c:forEach var='comment' items='${comments}' varStatus='indexNum'>
			<tr>
				<td> 
					<form id='commentForm' name='commentForm' method='post'>
						작성자 : ${comment.writer} 
						<input type='hidden' id='commentNum${indexNum.index}' name='commentNum' value='${comment.commentNum}'>
						<button class='float-right btn btn-secondary' data-target='#reportComment' data-reporter='${sessionScope.userId}' data-commentnum='${comment.commentNum}'  data-dismiss='modal' data-toggle='modal'>신고하기</button>
						<c:if test='${sessionScope.userName == comment.writer }'>				
							<a id='btnCommentUpdate' class='float-right btn btn-secondary' onClick="updateComment('${indexNum.index}')">수정</a>
							<a class='float-right btn btn-secondary' onClick="deleteCommentModal('${indexNum.index}')">삭제</a>
						</c:if>
						<br>
						작성일 : ${comment.writingDate}
						<div class='row'>
							<input type='text' id='commentPost${indexNum.index}' name='commentPost' class='form-control col-10' 
								value='${comment.commentPost}' readonly>
							<div id='btnUpdateWrite${indexNum.index}'></div>
						</div>
					</form>
				</td> 
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class='modal fade' id='reportComment'>
    <div class='modal-dialog'>
        <div class='modal-content'>
            <div class='modal-header'>
                <h5 class='modal-title'>신고하기</h5>
                <button type='button' class='close' data-dismiss='modal' tableindex='-1'>
                    <span>&times;</span>
                </button>
            </div>
            <div class='modal-body'>
           	<form id='report-form' method='post' action='./addCommentReport'>
                <select id="reportreason-dropdown" class='justify-content-center' name="reportreason-dropdown">
                    <option value="1">도배/광고성</option>
                    <option value="2">선정성/폭력성</option>
                    <option value="3">명예훼손</option>
                    <option value="4">자살암시/유해성</option>
                    <option value="other">기타</option>
                </select>
                <textarea id='reporttext' name='reportContent'></textarea>
                <input type='hidden' id='reporter' name='reporter'/>
                <input type='hidden' id='reportCode' name='reportCode'/>
                <input type='hidden' id='reportCommentNum' name='commentNum'/>
            </div>
            <div class='modal-footer'>
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
                <button type='button' id='confirmReport-btn' class='btn btn-primary'>신고</button>
               </form>
            </div>
        </div>
    </div>
</div>
	
	<div id='deleteComment' class='modal fade' role='dialog' tabindex='-1'>
		<div class='modal-dialog'>
			<div class='modal-content'>
				<div class='modal-header'>
					<button type='button' class='close' data-dismiss='modal'>
						<span>&times;</span>
					</button>
				</div>

				<div class='modal-body text-center'>
					<p style='font-size: 20px;'>
						댓글을 <br>
						삭제하시겠습니까?
					</p>
				</div>

				<div class='modal-footer'>
					<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
					<div id='hiddenInput'></div>
					<button class='btn btn-secondary' id='btnRemoveComment'>삭제</button>
				</div>
			</div>
		</div>
	</div>
</div>
</body>