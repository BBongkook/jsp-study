<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="/jsp-study/user?cmd=users">유저 리스트 보기</a>
<a href="/jsp-study/user?cmd=user&ui_num=54">54번 데이터 보기</a>
<form method="post" action="/jsp-study/user">
	<SELECT NAME="cmd" SIZE="3">
        <OPTION VALUE="insert">삽입</OPTION>
        <OPTION VALUE="update">수정</OPTION>
        <OPTION VALUE="delete">삭제</OPTION>
    </SELECT> <br>
번호 : <input type="text" name="ui_num"> <br>
이름 : <input type="text" name="ui_name"> <br>
나이 : <input type="number" name="ui_age"> <br>
아이디 : <input type="text" name="ui_id"> <br>
비고 : <input type="text" name="ui_etc"> <br>
<button>전송</button>
</form>
</body>
</html>