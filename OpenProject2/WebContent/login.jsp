<%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<MemberInfo> members = null;

	if (application.getAttribute("members") != null) {
		members = (ArrayList<MemberInfo>) application.getAttribute("members");
	} else {
		members = new ArrayList<MemberInfo>();
	}
%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userId");
	String pw = request.getParameter("password");

	if (id != null && pw != null) {

		MemberInfo memberInfo = null;

		for (int i = 0; i < members.size(); i++) {
			if (members.get(i).getUserId().equals(id)) {
				memberInfo = members.get(i);
				break;
			}
		}

		if (memberInfo != null && memberInfo.getPassword().equals(pw)) {
			memberInfo.setPassword("");
%>
<jsp:useBean id="loginInfo" class="member.model.LoginInfo"
	scope="session" />
<jsp:setProperty property="userId" name="loginInfo"
	value="<%=memberInfo.getUserId()%>" />
<jsp:setProperty property="userName" name="loginInfo"
	value="<%=memberInfo.getUserName()%>" />
<jsp:setProperty property="userPhoto" name="loginInfo"
	value="<%=memberInfo.getUserPhoto()%>" />
<%
	response.sendRedirect("myPage.jsp");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">
<style>
h2, td {
	padding: 10px;
}
</style>
</head>
<body>

	<%@ include file="common/header.jsp"%>

	<div id="contents">
		<h2>로그인</h2>

		<hr>
		<h1>아이디 또는 비밀번호가 틀립니다. 확인해주세요.</h1>
		<h1>
			<a href="loginForm.jsp">다시로그인하기</a>
		</h1>

	</div>
</body>
</html>