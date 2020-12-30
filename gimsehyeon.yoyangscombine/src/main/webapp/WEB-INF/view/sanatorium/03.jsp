<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' isELIgnored='false' %>
<head>
<!-- include:lib -->
<%@ include file='../include/lib.jsp' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='gimsehyeon.yoyangscombine.service.review.ReviewServiceImpl' %>
<%@ page import ='gimsehyeon.yoyangscombine.domain.Review' %>


<!-- /include:lib -->
<title>Sanatorium03</title>
</head>

<style>
#search-li {
      list-style: none;
      margin-top: 30px;
}
#detailsearch-form {
      display: inline-block;
}

#btns {
      list-style: none;
      margin: 10px;
}

#sanatorium {

      border: solid 1px black;
      display: inline-block;
      margin-left: 10px;
      margin-right: 10px;
      padding: 10px;
      background-color: white;
      position: absolute;
      z-index: 2;
      margin-top: 5px;
}



#map{
      width: 100vw;
      height: 120vh;
      position: relative;
      z-index: 1;
}

#stnreview {
      weight: 100px;
      height: 500px;
      border: solid 1px black;
      display: inline-block;
      padding: 10px;
      background-color: white;
}

input[id='viewbtn'] {
      display: none;
}

input[id='viewbtn']+label {
      width: 300px;
      display: 20px;
      text-align: center;
      border-bottom: 0;
      cursor: pointer;
}

input[id='viewbtn']:hover+label {
      background-color: darkgrey;
}

input[id='viewbtn']+label+div {
      max-height: 0;
      transition: all .35s;
      overflow: hidden;
}

input[id='viewbtn']+label+div {
      max-height: 0;
      transition: all .35s;
      overflow: hidden;
}

input[id='viewbtn']:checked+label+div {
      max-height: 500px;
}

#review {
      font-size: 13px;
}

#reviewtext {
      width: 300px;
      height: 50px;
      font-size: 15px;
}

.star {
      font-size: 20px;
}

.checked {
      color: orange;
}

#informstar {
      margin-top: -10px;
      font-size: 25px;
}

.card {
      width: 300px;
      border: hidden;
      margin-left: -10px;
}

#reportreason-dropdown {
      width: 450px;
      margin-bottom: 20px;
}

#reporttext {
      width: 400px;
      height: 100px;
}

button[data-target*='AddReview'] {
      padding: 1px;
      float: right;
      margin-right: 5px;
}

button[data-target*='Review'] {
      padding: 3px;
}

#stnbackbtn {
        position: absolute;
        z-index: 2;
        margin-left: 96%;
    }
#review-li{
list-style: none;
margin-left: 1px;
}

</style>


<div class='container'>
   
    <div id='sanatorium'>
       
        <img src='#' width="300px" height="200px">
        <h3>${sanaName}</h3>
        <h5>${addr}</h5>

        <div class="accrodion">
            <input type='checkbox' id="viewbtn">
            <label for='viewbtn'>더보기 ▼</label>
            <div>
				<strong id='review'>후기작성하기</strong>
				<form  method='post' action='./addReview'>
               
               <input type='text'  id='reviewtext' class='form-control'  name='reviewPost'
							placeholder='후기내용을 작성해주세요' required/>
                
                
                <br>
               	<c:if test='${sessionScope.userId != null}'>
               	<c:choose>
                 <c:when test='${reviewList.list.size() > 0 }'>
                 <c:set var="doneLoop" value="false"/>
                
               		 <c:forEach var="dbreviews" items="${reviewList.list}" varStatus="index">
               		 	 <c:if test="${not doneLoop}">
               			<c:if test='${sessionScope.userName == dbreviews.writer}'>
               				<c:if test="${!index.last}">
                    			<button type='submit' id='addreview-btn' class='btn btn-secondary'>등록하기</button>
                    		</c:if>
               				<button type='button' class='btn btn-secondary'data-dismiss='modal' data-toggle='modal'
                    			data-target='#overlapReview' >등록하기</button>
                    		<c:set var="doneLoop" value="true" />

                    		</c:if>
                    	</c:if> 
               		</c:forEach>
               		   
               		</c:when>
               		<c:otherwise>
               			<button type='submit' id='addreview-btn' class='btn btn-secondary'>등록하기</button>
               		</c:otherwise>
               		</c:choose>
               		
                    </c:if>
                    <c:if test='${sessionScope.userId == null}'>
                    	<button type='button'  class='btn btn-secondary'  data-dismiss='modal' data-toggle='modal'
                    data-target='#confirmLogin'>등록하기</button>
                    </c:if>
                  </form>
                <br>
                <hr>
                <!--   -->
                <div id='reviews-card' style="overflow:scroll; width:300px; height:300px;" >
					<c:choose>
						<c:when test='${reviewList.list.size() >0}'>
							<c:forEach var="reviewlist" items="${reviewList.list}">
                    <div class='card'>
                        
                        
                        <div class='card-body'>
                        		
                            	<h6 id ='reviewWriter-h5' class='card-title'>${reviewlist.writer}</h5>
                            	<div id='fixReviewPost-div' name='fixReviewPost-div'>
                            		<form  method='post' action='./fixReview'>
                            		<input type='hidden' name='reviewNum' id='reviewNum' value='${reviewlist.reviewNum}'/>
                            		<input type='text' name='reviewPost' id='reviewPost'/>
                            		<button type='submit' id='fixReview-btn' class='btn btn-secondary'>수정</button>
                                  		  </form>
                            	</div>
								<div id='reviewPost-div'>
                                <p   class='card-text'>${reviewlist.reviewPost}</p>
                                </div>
                                <p class='card-text'>${reviewlist.writingDate }</p>
                              
                                <h6 class='card-subtitle'></h6>
                                <form  method='post' action='./delReview'>
                                <button type='button' id='report-btn' data-target='#reportReview' data-reporter='${sessionScope.userId}' data-reviewnum='${reviewlist.reviewNum}' class='btn btn-secondary' data-dismiss='modal' data-toggle='modal'
                                   		>신고</button>
                                  <c:if test='${sessionScope.userName == reviewlist.writer}'>
                                  		
                                  		 <button type='button' id='inputfixReview-btn' class='btn btn-secondary'>수정</button>
                                  		 
                                  		  <input type='hidden' name='reviewNum' id='reviewNum' value='${reviewlist.reviewNum}'/>
                                  		 <button type='submit' id='delReview-btn' class='btn btn-secondary'>삭제</button>
                                  		  </form>
                                  </c:if>
                               
                        </div>
                    </div>
                    			
                    <hr>
                    </c:forEach>
                    </c:when>
                    </c:choose>
									
                    
                </div>
            </div>

        </div>

    </div>
</div>


<a href = '01.html'><button id = 'stnbackbtn' type = 'button' class = 'btn btn-secondary'>X</button></a>


<div id="map">
</div>
<script>



var HOME_PATH = window.HOME_PATH || '.';
var position = new naver.maps.LatLng(37.3595704, 127.105399);
var mapOptions = {
    center: position,
    zoom: 15
};
var map = new naver.maps.Map('map', mapOptions);

var reporter;
var reviewNum;


$(document).ready(function() {
	$('#fixReviewPost-div').hide(); 
	
	$("#inputfixReview-btn").click(function(){
		
		$('#fixReviewPost-div').show();
		$('#reviewPost-div').hide();
		$("#inputfixReview-btn").hide();
		
	});
	
	$("#reportReview").on('show.bs.modal', function(e) {
		reporter = $(e.relatedTarget).data('reporter');
		reviewNum =  $(e.relatedTarget).data('reviewnum');
		$('#reporter').val(reporter);
		$('#reportReviewNum').val(reviewNum);
		$('#reportCode').val($('#reportreason-dropdown').val());
		
	});
});

	
	    	
	  
</script>


<div id='overlapReview' class='modal fade' tabindex='-1'>
    <div class='modal-dialog'>
        <div class='modal-content'>
            <div class='modal-header'>
                <h5 class='modal-title'>후기</h5>
                <button type='button' class='close' data-dismiss='modal'>
                    <span>&times;</span>
                </button>
            </div>
            <div class='modal-body'>
                <p>후기는 한번만 작성할 수 있습니다.</p>
            </div>
            <div class='modal-footer'>
              <button type='button' class='btn btn-secondary' data-dismiss='modal'>확인</button>
            </div>
        </div>
    </div>
</div>
<div id='confirmLogin' class='modal fade' tabindex='-1'>
    <div class='modal-dialog'>
        <div class='modal-content'>
            <div class='modal-header'>
                <h5 class='modal-title'>로그인</h5>
                <button type='button' class='close' data-dismiss='modal'>
                    <span>&times;</span>
                </button>
            </div>
            <div class='modal-body'>
                <p>로그인을 해주세요</p>
            </div>
            <div class='modal-footer'>
              <button type='button' class='btn btn-secondary' data-dismiss='modal'>확인</button>
            </div>
        </div>
    </div>
</div>



<div class='modal fade' id='reportReview'>
    <div class='modal-dialog'>
        <div class='modal-content'>
            <div class='modal-header'>
                <h5 class='modal-title'>신고하기</h5>
                <button type='button' class='close' data-dismiss='modal' tableindex='-1'>
                    <span>&times;</span>
                </button>
            </div>
            <div class='modal-body'>
           	<form id='report-form' method='post' action='./addReport'>
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
                <input type='hidden' id='reportReviewNum' name='reviewNum'/>
            </div>
            <div class='modal-footer'>
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
                <button type='submit' id='confirmReport-btn' class='btn btn-primary'>신고</button>
               </form>
            </div>
        </div>
    </div>
</div>





