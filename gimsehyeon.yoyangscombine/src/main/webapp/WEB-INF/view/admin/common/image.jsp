<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%
	session.removeAttribute("main");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../../include/lib.jsp' %>
<title>로고 이미지 관리</title>
</head>
<script>
function showImg(input) {
   if(input.files[0]) { 
      let reader = new FileReader();
      reader.addEventListener('load', () => {
         $('#previewImg').attr('src', reader.result); 
      }, false) 
      
      reader.readAsDataURL(input.files[0]);
   }
}

$(() => {
   $('input').change(function() {
      showImg(this);
   });
});
</script>
<body>
	<div class='container'>
	<jsp:include page='../../include/header.jsp'/>
	<%@ include file= '../../include/nav.jsp' %>

		<form method='post' enctype='multipart/form-data'>
			<div class='form-row'>
				<div class='form-group col-4'>
					<div class='custom-file'>
						<input name='attachFile' type='file' class='custom-file-input' id='attachFile'/>
						<label class='custom-file-label' for='attachFile'>파일찾기</label>
					</div>
				</div>
				<div class='col-4'>
					<button type='submit' class='btn btn-primary'>등록</button>
				</div>
			</div>
		</form>
		<img id='previewImg' class="img-fluid"/>
	</div>
</body>
</html>