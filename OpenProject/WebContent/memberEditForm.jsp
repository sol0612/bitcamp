<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<%
	String userid = request.getParameter("userid");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String jdbcUrl = "jdbc:apache:commons:dbcp:open";

	conn = DriverManager.getConnection(jdbcUrl);

	stmt = conn.createStatement();

	String list_sql = "select * from MEMBER where userid='" + userid + "'";

	rs = stmt.executeQuery(list_sql);

	String password = "";
	String username = "";
	String userphoto = "";

	if (rs.next()) {
		password = rs.getString("password");
		username = rs.getString("username");
		userphoto = rs.getString("userphoto");
	}
%>
</head>
<body>
	<%@ include file="common/header.jsp"%>
	<div id="contents">
		<h2>회원정보 수정</h2>
		<hr>
		<form action="memberEdit.jsp?userid=<%=userid %>>" method="post">
			<table>
				<tr>
					<td>아이디(이메일)</td>
					<td><input type="text" name="userid" value="<%=userid%>"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" value="<%=password%>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="username" value="<%=username%>"></td>
				</tr>
				<tr>
					<td>사진</td>
					<td><input type="file" name="userphoto" value="<%=userphoto%>"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정하기"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>