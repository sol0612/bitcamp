<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="loginInfo" class="member.model.LoginInfo"
	scope="session" /> --%>

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

#memherPhoto {
	background-image: url('images/images.png');
	background-size: 100%;
	width: 150px;
	height: 150px;
	border: 1px solid #333333;
	border-radius: 75px;
	margin: 20px 0;
}
</style>

<%-- <%
	String id = loginInfo.getUserId();
	if (id == null) {
%> --%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String userid = request.getParameter("userid");
	int resultCnt = 0;

	String jdbcUrl = "jdbc:apache:commons:dbcp:open";

	try {
		conn = DriverManager.getConnection(jdbcUrl);

		String sql = "select userid from member where userid = '" + userid + "'";

		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);

		if (userid==null) {
%>

<script>
	alert('로그인 후 사용가능한 서비스입니다.');
	location.href = 'loginForm.jsp';
</script>

<%
	} else {
%>
</head>
<body>

	<%@ include file="common/header.jsp"%>


	<div id="contents">

		<h2>회원 정보</h2>

		<div id="memherPhoto"></div>

		<hr>
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td><%=userid%>></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=rs.getString("username")%>></td>
			</tr>
		</table>
	</div>
<%
	}
	} catch (SQLException ex) {
	} finally {
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
			}

		if (rs != null)
			try {
				rs.close();
			} catch (SQLException ex) {
			}
		if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException ex) {
			}
	}
%>
</body>
</html>