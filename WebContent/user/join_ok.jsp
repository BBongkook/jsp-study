<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8"); // UTF-8 한글 나오게 유니코드 인코딩
String name = request.getParameter("name"); // 값 받기 전에 인코딩해야함
String birth = request.getParameter("birth");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
Connection con;
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "osfu";
String password = "12345678";
Class.forName("oracle.jdbc.OracleDriver");
con = DriverManager.getConnection(url, user, password);
String sql = "insert into users(name, birth, id, pwd) values(?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, birth);
ps.setString(3, id);
ps.setString(4, pwd);
int cnt = ps.executeUpdate();
String result="실패";
if(cnt==1){
	result="성공";
}
%>
name : <%=name%><br>
birth : <%=birth%><br>
id : <%=id%><br>
pwd : <%=pwd%><br>
회원가입여부 <%=result%><br>
<a href="/jsp-study/user/join.jsp">회원가입 돌아가기</a>
