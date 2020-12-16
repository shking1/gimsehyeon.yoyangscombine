<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' isELIgnored='false' %>
<head>
<!-- include:lib -->
<%@ include file='../include/lib.jsp' %>

<!-- /include:lib -->
<title>Sanatorium01</title>
</head>

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
<div class='container'>


<header>
</header>
<br>
<!-- /include:header -->
   <div class='row'>
      <div class='col-3 justify-content-center text-center'>
         <form action='01.process'>
         <ul>
         
            <li id='search-li'><select id="search-dropdown-o" name="siDoCd">
                  <option value="42">강원도</option>
                  <option value="41">경기도</option>
                  <option value="48">경상남도</option>
                  <option value="47">경상북도</option>
                  <option value="29">광주광역시</option>
                  <option value="27">대구광역시</option>
                  <option value="30">대전광역시</option>
                  <option value="26">부산광역시</option>
                  <option value="11">서울특별시</option>
                  <option value="36">세종특별자치시</option>
                  <option value="31">울산광역시</option>
                  <option value="28">인천광역시</option>
                  <option value="46">전라남도</option>
                  <option value="45">전라북도</option>
                  <option value="50">제주도</option>
                  <option value="44">충청남도</option>
                  <option value="43">충청북도</option>
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

               <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search">
                  <div class="input-group-btn">
                     <button type="submit" style="margin-bottom: 10px;" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
               </div>
         
         </form>
         
         <br><br>
         <div>
            <a href="../communication" id='btn-brother' type='button' class='btn btn-secondary'>자유게시판</a>
         </div>
         <br> 
         <div>
            <a href="02" id='btn-brother' type='button' class='btn btn-secondary'>캘린더</a>
         </div>
      </div>
 
<div class='col-9'>

<%
 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B550928/searchLtcInsttService/getLtcInsttSeachList"); /*URL*/
urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=VFE9v0yK2dxo9e%2FLXfgqpMU5SEyBdoitB7ptSaLub9KCIfC1hnDu9F18QNwIbM%2FeFSS6CfWc6hhaSHNOLuGQZg%3D%3D"); /*Service Key*/
urlBuilder.append("&" + URLEncoder.encode("siDoCd","UTF-8") + "=" + URLEncoder.encode("11", "UTF-8")); /*공통항목 법정동 코드설명 참조*/
urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*공통항목 법정동 코드설명 참조*/
URL url = new URL(urlBuilder.toString());

if(request.getParameterValues("urlStr")!=null){
    url =new URL(request.getParameter("urlStr"));   
 }
 
   
   String urlStr = url.toString();
   HttpURLConnection conn = (HttpURLConnection) url.openConnection();
   conn.setRequestMethod("GET");
   conn.setRequestProperty("Content-type", "application/json");
   String oriNum ="";
   String numKind = "";
 
    if(urlStr==null){
       return;
    }else{
   DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
   DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
   Document doc = dBuilder.parse(urlStr);
   
   NodeList nList = doc.getElementsByTagName("item");
   doc.getDocumentElement().normalize();
   
   for(int temp = 0; temp < nList.getLength(); temp++){
      %>
        <div class='list'>
       <div class='row'>
          <div class='col-4'>
             <div id='border'>
              100x120
              </div>
               <div class='star ml-2'>
                   <span class="fa fa-star checked"></span>
                   <span class="fa fa-star checked"></span>
                   <span class="fa fa-star checked"></span>
                   <span class="fa fa-star checked"></span>
                   <span class="fa fa-star"></span>
            </div>
         </div>
           <div id='border2 ml-2'>   
           <form method='post' action='./getReviewlist'>
      <%
      Node nNode = nList.item(temp);
      if(nNode.getNodeType() == Node.ELEMENT_NODE){
                     
         Element eElement = (Element) nNode;
         System.out.println(eElement.getTextContent());
         oriNum = getTagValue("longTermAdminSym", eElement);
         numKind = getTagValue("adminPttnCd", eElement);
         
         out.println("고유번호 : " + oriNum +"<br>");         
         out.println("분류  : " + numKind +"<br>");
         out.println("이름 : " + getTagValue("adminNm", eElement)+"<br>");
         
         
         
         StringBuilder urlBuilder2 = new StringBuilder("http://apis.data.go.kr/B550928/getLtcInsttDetailInfoService/getGeneralSttusDetailInfoItem");
      
         urlBuilder2.append("?" + URLEncoder.encode("longTermAdminSym","UTF-8") + "=" + URLEncoder.encode(oriNum, "UTF-8")); /*공통항목 법정동 코드설명 참조*/
         urlBuilder2.append("&" + URLEncoder.encode("adminPttnCd","UTF-8") + "=" + URLEncoder.encode(numKind, "UTF-8")); /*공통항목 법정동 코드설명 참조*/
         urlBuilder2.append("&" + URLEncoder.encode("serviceKey","UTF-8")+ "=" + "VFE9v0yK2dxo9e%2FLXfgqpMU5SEyBdoitB7ptSaLub9KCIfC1hnDu9F18QNwIbM%2FeFSS6CfWc6hhaSHNOLuGQZg%3D%3D"); /*Service Key*/
         
         URL url2 = new URL(urlBuilder2.toString());
         String urlStr2 = url2.toString();
         HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
         conn2.setRequestMethod("GET");
         conn2.setRequestProperty("Content-type", "application/json");
         BufferedReader rd2;

         DocumentBuilderFactory dbFactoty2 = DocumentBuilderFactory.newInstance();
         DocumentBuilder dBuilder2 = dbFactoty2.newDocumentBuilder();
         Document doc2 = dBuilder2.parse(urlStr2);

         NodeList nList2 = doc2.getElementsByTagName("item");
         System.out.println("파싱할 리스트 수2 : "+ nList2.getLength());

         doc2.getDocumentElement().normalize();
         System.out.println("Root element: " + doc2.getDocumentElement().getNodeName()); // Root element: result
         
         for(int temp2 = 0; temp2 < nList2.getLength(); temp2++){
            Node nNode2 = nList2.item(temp2);
            if(nNode2.getNodeType() == Node.ELEMENT_NODE){                  
               Element eElement2 = (Element) nNode2;
               System.out.println(eElement2.getTextContent());
               out.println("연락처 : "+ getTagValue("locTelNo_1", eElement2)+"-"+getTagValue("locTelNo_2", eElement2)+"-"+getTagValue("locTelNo_3", eElement2)+"<br>");
            }
         }
         
         
         %>
          <input type='hidden' name='sanaName' id='reviewNum' value='<%=getTagValue("adminNm", eElement) %>'/>
            <a href='03'><button type='submit'>지도보기</button></a>
            </form>

          </div>  
       </div>
      </div>  
     <hr>
     <%
         }   
      }   
    }
    %>
               
<%@ page import='java.net.HttpURLConnection' %>
<%@ page import='java.net.URL' %>
<%@ page import='java.net.URLEncoder' %>
<%@ page import='java.io.BufferedReader' %>
<%@ page import='org.w3c.dom.Document'%>
<%@ page import='org.w3c.dom.Element'%>
<%@ page import='org.w3c.dom.Node'%>
<%@ page import='org.w3c.dom.NodeList'%>
<%@ page import='javax.xml.parsers.DocumentBuilder'%>
<%@ page import='javax.xml.parsers.DocumentBuilderFactory' %>
<%!

public  static String getTagValue(String tag, Element eElement) {
    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
    Node nValue = (Node) nlList.item(0);
    if(nValue == null) 
        return null;
    return nValue.getNodeValue();
}
%>

      </div>
   </div>
</div>