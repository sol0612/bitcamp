<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%-- <%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.List"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%
	ArrayList<MemberInfo> members = null;

	if (application.getAttribute("members") != null) {
		members = (ArrayList<MemberInfo>) application.getAttribute("members");
	} else {
		members = new ArrayList<MemberInfo>();
	}

	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String userName = request.getParameter("userName");

	MemberInfo memberInfo = new MemberInfo();
	memberInfo.setUserId(userId);
	memberInfo.setUserName(userName);
	memberInfo.setPassword(password);

	members.add(memberInfo);
	application.setAttribute("members", members);
%> --%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;

	request.setCharacterEncoding("utf-8");
	
	//USERID, PASSWORD, USERNAME, USERPHOTO
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String username = request.getParameter("username");
	String userphoto = request.getParameter("userphoto");
	String jdbcUrl = "jdbc:apache:commons:dbcp:open";

	try {

		String sql = "insert into MEMBER values(?,?,?,?)";

		conn = DriverManager.getConnection(jdbcUrl);
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, userid);
		pstmt.setString(2, password);
		pstmt.setString(3, username);
		pstmt.setString(4, userphoto);

		resultCnt = pstmt.executeUpdate();
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

		<h2>회원가입 정보</h2>

		<hr>
		<%
			if (resultCnt > 0) {
		%>
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
		}
		} catch (SQLException ex) {
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