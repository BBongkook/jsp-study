<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>나이</th>
		<th>아이디</th>
		<th>기타</th>
	</tr>
<%
String sql = "select * from user_info";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>

	<tr>
		<td><%=rs.getString("ui_num") %></td>
		<td><%=rs.getString("ui_name") %></td>
		<td><%=rs.getString("ui_age") %></td>
		<td><%=rs.getString("ui_id") %></td>
		<td><%=rs.getString("ui_etc") %></td>
	</tr>

<%
}
%>
</table>
<button type ="button" onclick="goUserPage()">돌아가기</button>
<a href="/jsp-study/users/user.jsp">돌아가기</a>
<Script>
	function goUserPage(){
		location.href="/jsp-study/users/user.jsp";
	}
	
</Script>
</body>
</html>