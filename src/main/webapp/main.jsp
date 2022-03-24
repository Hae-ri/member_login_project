<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("ValidMem") == null) {
%>
	<jsp:forward page="login.jsp"></jsp:forward>

<%	}
	String id =	(String)session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<h2><%= id %>님 안녕하세요. 반갑습니다.</h2>
	<form action="logout.jsp">
		<input type="submit" value="로그아웃">&nbsp;&nbsp;&nbsp;
		<input type="button" value="회원정보수정" onclick="javascript:window.location='modify.jsp'">
	</form>
</body>
</html>