<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' isELIgnored='false' %>
<head>
<!-- include:lib -->
<%@ include file='../include/lib.jsp' %>
<!-- /include:lib -->
<title>Sanatorium02</title>
</head>
<style>
.cal_top{
	margin : 50px;
    text-align: center;
    font-size: 30px;
}
.cal{
	margin : 50px;
    text-align: center;    
}
table.calendar{
    border: 1px solid black;
    display: inline-table;
    text-align: left;
}
table.calendar td{
    vertical-align: top;
    border: 1px solid black;
    width: 100px;
}
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

#btn-brother{
	width: 140px;
}
</style>

<script>
    
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
 
    $(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });
    
    //calendar 그리기
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="80">';
            for(var j=0;j<7;j++){
                setTableHTML+='<td>';
                setTableHTML+='		<div class="cal-day"></div>';
                setTableHTML+='		<div class="cal-schedule"></div>';
                setTableHTML+='</td>';
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $("#cal_tab").html(setTableHTML);
    }
 
    //날짜 초기화
    function initDate(){
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }
    
    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year+"년");
        $("#cal_top_month").text(month+"월");
  
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
            $tdSche.eq(i).text("스케줄");
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    } 
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }
   
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
            $tdSche.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
    }
    
</script>
</head>
<div class='container'>
<!-- include:header -->
<header>
<!-- include: header-->
<jsp:include page='../include/header.jsp'/>
<!-- include: header-->
</header>

<br>
<div class='row'>
      <div class='col-3 justify-content-center text-center'>
         <ul>
            <li id='search-li'><select id="search-dropdown-o" name="city-search-dropdown-o">
                  <option value="seoul">서울</option>
                  <option value="incheon">인천</option>
                  <option value="busan">부산</option>
            </select></li>
            <li id='search-li'><select id="search-dropdown-o" name="country-search-dropdown-o">
                  <option value="seoul">가평군</option>
                  <option value="incheon">양평군</option>
                  <option value="busan">영천군</option>
            </select></li>
            <li id='search-li'><select id="search-dropdown-o" name="district-search-dropdown-o">
                  <option value="seoul">관양동</option>
                  <option value="incheon">비산동</option>
                  <option value="busan">부평동</option>
            </select></li>
         </ul>
         <form class="navbar-form pull-left" role="search">
               <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search">
                  <div class="input-group-btn">
                     <button type="submit" style="margin-bottom: 10px;" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
               </div>
         </form> 
          <br><br>
         <div>
            <a href="../communication/01.html" id='btn-brother' type='button' class='btn btn-secondary'>자유게시판</a>
         </div>
         <br> 
         <div>
            <a href="01.html" id='btn-brother' type='button' class='btn btn-secondary'>캘린더</a>
         </div>
      </div>

<div class='col-9'>
    <div class="cal_top">
        <a href="#" id="movePrevMonth"> &lt;</a>
        <span id="cal_top_year"></span>
        <span id="cal_top_month"></span>
        <a href="#" id="moveNextMonth"> &gt; </a>
    </div>
    <hr>
    <div id="cal_tab" class="cal">
    </div>
    </div>
    </div>
    <!-- include:footer -->
<footer id='main-footer'>
<hr size="2" color="gray" align="left">	
	<div id='footer-pre-div'>
	<pre>
INFO: 
(주)요양스컴바인 대표 김세현 서울시 00동 00로 00길 00-00 
고객문의: 대표번호 0000-0000 | 이메일 yoyangsCombined@yoyang.kr 2020ⓒ All rights reserved<br>
	
요양스컴바인에서 최적의 요양원을 검색하세요. 대한민국 대표 요양원 관리 사이트 요양스컴바인은 수백개의 요양원을 검색하여, 
고객님께서 본인에게 딱 맞는 곳을 찾아 지속적으로 돌봐드릴 수 있도록 도와드립니다. 
	</pre>
	</div>
</footer>
<!-- /include:footer -->
    </div>