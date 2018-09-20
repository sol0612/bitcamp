<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (request.getQueryString() != null)
		System.out.println(request.getQueryString());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/default.css">
<title>Insert title here</title>
<style>
h2, td {
	padding: 10px;
}
</style>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbcUrl = "jdbc:apache:commons:dbcp:open";
	int updateCnt = 0;

	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String username = request.getParameter("username");
	String userphoto = request.getParameter("userphoto");

	try {
		conn = DriverManager.getConnection(jdbcUrl);

		String sql = "UPDATE MEMBER SET USERID=?, PASSWORD=?, USERNAME=?, USERPHOTO=? WHERE USERID=?";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, userid);
		pstmt.setString(2, password);
		pstmt.setString(3, username);
		pstmt.setString(4, userphoto);
		pstmt.setString(5, userid);

		updateCnt = pstmt.executeUpdate();
		System.out.println("updateCnt = " + updateCnt);
%>
</head>
<body>
	<%@ include file="common/header.jsp"%>

	<div id="contents">

		<h2>회원수정 내역</h2>

		<hr>
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td><%=userid%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=password%></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=username%></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><%=userphoto%></td>
			</tr>
		</table>
	</div>
	<%
		} catch (SQLException ex) {
			System.out.println("[SQL Error : " + ex.getMessage() + "]");
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
		}
	%>
</body>
</html>