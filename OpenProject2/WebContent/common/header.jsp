<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.model.LoginInfo"%>
<h1 class="title">OpenProject</h1>

<ul id="gnb">
	<li><a href="index.jsp">메인</a></li>
	<li><a href="memberRegForm.jsp">회원가입</a></li>
	<%
		String lid = (String) request.getSession(false).getAttribute("userId");
		boolean login = lid == null ? false : true;

		String loginCheck = "";
		String std = "";

		if (login) {
			session.invalidate();
			loginCheck = "index.jsp";
			std = "로그아웃";
		} else {
			loginCheck = "loginForm.jsp";
			std = "로그인";
		}
	%>
	<li><a href="<%=loginCheck%>"><%=std%></a></li>
	<li><a href="myPage.jsp">마이페이지</a></li>
	<li><a href="memberList.jsp">회원 리스트</a></li>
</ul>