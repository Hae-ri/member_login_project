<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javatest.ex.MemberDto" %>
<%@ page import="com.javatest.ex.MemberDao" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = (String)session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getMemberInfo(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script type="text/javascript" src="members.js"></script>
</head>
<body>
	<h2>회원가입정보</h2>
	<hr>
	<form action="modifyOk.jsp" method="post" name="reg_frm">
		아이디 : <%= dto.getId() %><br><br>
		비밀번호 : <input type="password" name="pw" size="20"><br><br>
		비밀번호 확인 : <input type="password" name="pw_check" size="20"><br><br>
		이름 : <input type="text" name="name" size="20" value="<%= dto.getName() %>"><br><br>
		이메일 : <input type="text" name="eMail" size="20" value="<%= dto.geteMail() %>"><br><br>
		주소 : <input type="text" name="address" size="50" value="<%= dto.getAddress() %>"><br><br>
	<hr>
		<input type="button" value="정보수정" onclick="updateInfoCheck()"> &nbsp;&nbsp;&nbsp;
		<input type="reset" value="취소" onclick="javascript:window.location='login.jsp'">
		
	</form>
</body>
</html>