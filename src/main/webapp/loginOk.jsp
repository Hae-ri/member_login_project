<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="com.javatest.ex.*" %>
<%
	request.setCharacterEncoding("UTF-8"); 

	String id = request.getParameter("id");	
	String pw = request.getParameter("pw");	
	
	MemberDao dao = MemberDao.getInstance(); 
	int checkNum = dao.userCheck(id, pw); // 1:로그인 성공, 2:비밀번호 오류, -1:아이디 없음
	if(checkNum == -1) {%>
		<script type="text/javascript">
		alert("아이디가 존재하지 않습니다. 아이디를 확인하세요.");
		history.back(); // 뒤로 가기
		</script>
<%
	}else if (checkNum == 2) {
%>
		<script type="text/javascript">
		alert("비밀번호가 틀립니다.");
		history.back(); // 뒤로 가기
		</script>

<%
	}else if(checkNum == 1) {
		session.setAttribute("id",id);
		session.setAttribute("ValidMem", "yes");
		response.sendRedirect("main.jsp");
		
	}		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="login.jsp">로그인 페이지로 가기</a>
</body>
</html>