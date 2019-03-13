<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String[] ciNums = request.getParameterValues("ci_num");

String sql = "delete from car_info where 1=1 ";
sql += " and ci_num in(";
for(int i=0; i<ciNums.length; i++){
	sql+= "?,";
}
sql = sql.substring(0,sql.length()-1);
sql += ")";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
for(int i=0; i<ciNums.length; i++){
	ps.setString(i+1, ciNums[i]);
}
int cnt = ps.executeUpdate();
String result = "삭제 실패";
if(cnt>=1){
	result= "삭제 성공";
}
out.write(sql);
%>
<script>
	alert("<%=result%>");
	location.href= "/jsp-study/car/list.jsp";
</script>