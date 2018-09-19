<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;

	String url = "jdbc:oracle:thin:@localhost:1522:orcl";
	String user = "scott";
	String pw = "1234";
	try {
		conn = DriverManager.getConnection(url, user, pw);

		String empno = request.getParameter("empno");
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");

		String sql = "insert into emp (empno, ename, job) values (?, ?, ?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, Integer.parseInt(empno));
		pstmt.setString(2, ename);
		pstmt.setString(3, job);
		resultCnt = pstmt.executeUpdate();
	} finally {
		conn.close();
		pstmt.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		등록완료 <a href="emp_list.jsp">EMP LIST</a>
	</h1>
</body>
</html>
