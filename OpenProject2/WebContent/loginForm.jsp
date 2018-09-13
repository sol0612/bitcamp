<%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@page import="member.model.Cookies"%>
<%
	Cookies cookies = new Cookies(request);
%>
<%
	ArrayList<MemberInfo> members = (ArrayList<MemberInfo>) application.getAttribute("members");

	if (application.getAttribute("members") != null) {
		members = (ArrayList<MemberInfo>) application.getAttribute("members");
	} else {
		members = new ArrayList<MemberInfo>();
	}

	MemberInfo memberinfo = null;
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String remember = request.getParameter("remember");
	// checkbox name이 remember 이고 checked = on, unchecked = null 값을 받게 된다.

	memberinfo.setUserId("id");
	memberinfo.setPassword("password");
			
	if (id == memberinfo.getUserId() && password == memberinfo.getPassword()) {
		session.setAttribute("id", id);
		if (remember != null && remember.equals("on")) {
			response.addCookie(Cookies.createCookie("AUTH", id, "/loginForm.jsp", 60 * 60));
		} else {//쿠키 삭제 
			if (remember == null) {
				//PrintWriter out = response.getWriter();
				//request.setAttribute("getplaceholder", id); setAttribute 안됨	
				response.addCookie(Cookies.createCookie("AUTH", "", "/loginForm.jsp", 0));
				response.sendRedirect("/loginForm.jsp");
			}
		}
	}
%> --%>
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
		<form action="login.jsp" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userId">
						<%-- value="<%if (cookies.exists("AUTH")) {%><%=cookies.getValue("AUTH")%><%}%>"> --%>
						</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="remember">
						<%-- <%if (cookies.exists("AUTH")) {%> <%=" checked"%> <%}%>> --%>
						아이디기억하긔ㅇㅅㅇ</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="로그인"></td>

				</tr>
			</table>

		</form>

	</div>
</body>
</html>