<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="test.jsp.study.db.DBCon"%>
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
String uiNum = request.getParameter("ui_num");

String sql = "select ui_num, ui_name, ui_age, ui_id, ui_etc from user_info";
sql += " where ui_num=?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1, uiNum);
ResultSet rs = ps.executeQuery(); 
if(rs.next()){
%>
<form method="post" action="/jsp-study/users/user_update_ok.jsp">
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>나이</th>
		<th>아이디</th>
		<th>기타</th>
	</tr>
	
	<tr>
		<td><%=rs.getString("ui_num")%></td>
		<td><input type="text" name="ui_name" value="<%=rs.getString("ui_name")%>"></td>
		<td><input type="number" name="ui_age" value="<%=rs.getString("ui_age")%>"></td>
		<td><input type="text" name="ui_id" value="<%=rs.getString("ui_id")%>"></td>
		<td><textarea name="ui_etc"><%=rs.getString("ui_etc")%></textarea></td>
	</tr>
	
<%
} else{
	out.write("없다");
}
%>
</table>
<button>유저수정</button>
<input type="hidden" name="ui_num" value="<%=rs.getString("ui_num")%>">
</form>
</body>
</html>