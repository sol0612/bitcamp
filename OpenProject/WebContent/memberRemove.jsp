<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");

	Connection conn = null;
	Statement stmt = null;

	String jdbcUrl = "jdbc:apache:commons:dbcp:open";

	try {
		conn = DriverManager.getConnection(jdbcUrl);

		String sql = "delete from MEMBER where userid='" + userid + "'";

		stmt = conn.createStatement();
		stmt.executeUpdate(sql);

		response.sendRedirect("memberList.jsp");

	} catch (SQLException ex) {
	} finally {
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
			}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>