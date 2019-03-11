<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="/jsp-study/user/join_ok.jsp"method="post"> <!-- "" 아무것도 없으면 join.jsp(자기자신) -->
	이름 : <input type="text" name="name"><br>
	생년월일:<input type="date" name="birth"><br>
	아이디:<input type="text" name="id"><br>
	비밀번호:<input type="password"name="pwd"><br>
	<button type="submit">회원 가입</button> <!-- 폼 태그 안에 있어서 반응 -->
	<!-- button type="button" 이라고 하면 무반응 -->
	<!-- button 폼태그 안에서 버튼 디폴트가 submit(제출) -->
	<!-- button type="reset"은 초기화 시킨다 -->
</form>

</body>
</html>