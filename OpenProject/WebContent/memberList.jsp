<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="open.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%
	ArrayList<MemberInfo> members = (ArrayList<MemberInfo>) application.getAttribute("members");

/* 	if (application.getAttribute("members") != null) {
		members = (ArrayList<MemberInfo>) application.getAttribute("members");
	} else {
		members = new ArrayList<MemberInfo>();
	} */
%> --%>
<%
	List<MemberInfo> members = new ArrayList<MemberInfo>();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">
<style>
h2 {
	padding: 10px;
}

table {
	margin-top: 10px;
}

td {
	padding: 10px 20px;
	text-align: center;
}
</style>
</head>
<body>

	<%@ include file="common/header.jsp"%>

	<div id="contents">
		<h2>회원리스트</h2>

		<hr>

		<table border="1">
			<tr>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>사진</td>
				<td>관리</td>
			</tr>
			<%
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;

				//jdbcurl 설정
				String jdbcUrl = "jdbc:apache:commons:dbcp:open";

				try {
					//컨넥션 객체 생성
					conn = DriverManager.getConnection(jdbcUrl);

					//USERID, PASSWORD, USERNAME, USERPHOTO
					String sql = "SELECT * FROM MEMBER";

					//statement 객체 생성
					stmt = conn.createStatement();

					//쿼리실행
					rs = stmt.executeQuery(sql);

					if (rs.next()) {
						do {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><a href="memberEditForm.jsp?userid=<%= rs.getString(1) %>">수정</a> <a
					href="memberRemove.jsp?userid=<%= rs.getString(1) %>">삭제</a></td>
			</tr>
			<%
				} while (rs.next());
					} else {
			%>
			<tr>
				<td colspan="5">가입된 회원이 없습니다.</td>
			</tr>
			<%
				}
				} finally {
					if (rs != null) {
						try {
							rs.close();
						} catch (SQLException se) {

						}
					}
					if (stmt != null) {
						try {
							stmt.close();
						} catch (SQLException se) {

						}
					}
					if (conn != null) {
						try {
							conn.close();
						} catch (SQLException se) {

						}
					}
				}
			%>
		</table>
	</div>
</body>
</html>