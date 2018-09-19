<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");

	// 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;

	String url = "jdbc:oracle:thin:@localhost:1522:orcl";
	String user = "scott";
	String pw = "1234";

	try {
		// 컨넥션 객체 생성
		conn = DriverManager.getConnection(url, user, pw);

		// PreparedStatement 객체 생성
		String sql = "update emp set ename=?, job=? where empno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ename);
		pstmt.setString(2, job);
		pstmt.setInt(3, Integer.parseInt(empno));
		resultCnt = pstmt.executeUpdate();
	} finally {
		pstmt.close();
		conn.close();
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
		<%
			if (resultCnt > 0) {
		%>
		수정완료
		<%
			} else {
		%>
		수정실패
		<%
			}
		%>
		<a href="emp_list.jsp">EMP LIST</a>
	</h1>

</body>
</html>