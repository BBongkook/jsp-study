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
<form>
이름: <input type="text" name="ui_name">
<button>검색</button>
</form>
<form method="post" action="/jsp-study/users/user_delete_ok.jsp">
<table border="1">
	<tr>
		<th>삭제</th>
		<th>번호</th>
		<th>이름</th>
		<th>나이</th>
		<th>아이디</th>
		<th>기타</th>
	</tr>
<%
String sql = "select ui_num, ui_name, ui_age, ui_id, ui_etc from user_info where 1=1";
String uiName = request.getParameter("ui_name");
if(uiName!=null){
	sql += " and ui_name like ?";	
}

PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
if(uiName!=null){
	ps.setString(1, "%"+uiName+"%");	
}
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>


	<tr>

		<td><input type="checkbox" name="ui_num" value=<%=rs.getString("ui_num")%>></td>
		<td><%=rs.getString("ui_num") %></td>
		<td><a href="/jsp-study/users/user_view.jsp?ui_num=<%=rs.getString("ui_num")%>"><%=rs.getString("ui_name") %></a></td>
		<td><%=rs.getString("ui_age") %></td>
		<td><%=rs.getString("ui_id") %></td>
		<td><%=rs.getString("ui_etc") %></td>
	</tr>

<%
}
%>
</table>
<button>삭제</button>
</form>
<button type ="button" onclick="goUserPage()">돌아가기</button>
<a href="/jsp-study/users/user.jsp">돌아가기</a>
<Script>
	function goUserPage(){
		location.href="/jsp-study/users/user.jsp";
	}
	
</Script>
</body>
</html>