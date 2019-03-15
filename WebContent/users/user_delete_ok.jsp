<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String[] numList = request.getParameterValues("ui_num");
int cnt=0;
String sql = "delete from user_info where ui_num=?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
for(int i=0; i<numList.length; i++){
	ps.setString(1, numList[i]);
	cnt = ps.executeUpdate();
}

String result = "삭제 실패";
if(cnt==1){
	result = "삭제 성공";
}
%>
<script>
	alert("<%=result%>");
	location.href="/jsp-study/users/list.jsp"
</script>
