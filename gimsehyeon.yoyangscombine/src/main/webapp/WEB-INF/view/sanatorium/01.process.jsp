<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import='java.io.InputStreamReader' %>
<%@ page import='java.net.HttpURLConnection' %>
<%@ page import='java.net.URL' %>
<%@ page import='java.net.URLEncoder' %>
<%@ page import='java.io.BufferedReader' %>
<%@ page import='java.io.IOException' %>
<%@ page import='javax.xml.stream.XMLInputFactory' %>
<%@ page import='javax.xml.stream.XMLStreamReader' %>

<%@ page import='java.io.BufferedInputStream' %>


<%@ page import='java.io.IOException'%>
<%@ page import='java.util.List'%>
<%@ page import='java.util.Map'%>


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
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
   String st = request.getParameter("siDoCd");
System.out.println(st+"dddddddddddddddddddddddddddddddddddd");
StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B550928/searchLtcInsttService/getLtcInsttSeachList"); /*URL*/
urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=VFE9v0yK2dxo9e%2FLXfgqpMU5SEyBdoitB7ptSaLub9KCIfC1hnDu9F18QNwIbM%2FeFSS6CfWc6hhaSHNOLuGQZg%3D%3D"); /*Service Key*/
urlBuilder.append("&" + URLEncoder.encode("siDoCd","UTF-8") + "=" + URLEncoder.encode(st, "UTF-8"));/*공통항목 법정동 코드설명 참조*/
if( request.getParameter("searchName") != null){
	urlBuilder.append("&" + URLEncoder.encode("adminNm","UTF-8") + "=" + URLEncoder.encode(request.getParameter("searchName"), "UTF-8"));/*공통항목 법정동 코드설명 참조*/
}
urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*공통항목 법정동 코드설명 참조*/

URL url = new URL(urlBuilder.toString());
String urlStr = url.toString();

%>
<jsp:forward page='01.jsp'>
   <jsp:param name='urlStr' value='<%=urlStr%>'/>
   <jsp:param name='selectedsiDoCd' value='<%=st%>'/>
</jsp:forward>

</body>
</html>