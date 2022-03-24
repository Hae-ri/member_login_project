<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="com.javatest.ex.*" %>

<jsp:useBean id="dto" class="com.javatest.ex.MemberDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	String id = (String) session.getAttribute("id");
	dto.setId(id);

	MemberDao dao = MemberDao.getInstance();
	int checkNum = dao.modifyMember(dto); // 1이 반환되면 수정 성공
	
	if(checkNum == 1) {
%>
	<script type="text/javascript">
		alert("회원정보 수정 성공");
		document.location.href="main.jsp";
	</script>		
<%
	}else {
%>	
	<script type="text/javascript">
		alert("회원정보 수정 실패");
		history.back(); // 뒤로 가기
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정완료</title>
</head>
<body>

</body>
</html>