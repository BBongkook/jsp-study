<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String name = request.getParameter("name");
String credat = request.getParameter("credat");
String trans = request.getParameter("trans");
if("m".equals(trans)){
	trans="남자";
}else trans="여자";
Map<String,String[]> content = request.getParameterMap();
String[] Content = content.get("content"); 

%>
<table border="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>날짜</th>
		<th>성별</th>
		<th>내용</th>
	</tr>
	<tr>
		<td><%=id %></td>
		<td><%=name %></td>
		<td><%=credat %></td>
		<td><%=trans %></td>
		<td><%=Content[0].replace("\r", "") %></td>
	</tr>
</table>
<button type ="button" onclick="golistPage()">돌아가기</button>
<script>
	function golistPage(){
		location.href="/jsp-study/req/param.jsp";
}
</script>


</body>
</html>