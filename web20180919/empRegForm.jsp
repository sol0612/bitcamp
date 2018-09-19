<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="empReg.jsp" type="post">
		<table>
			<tr>
				<td>사원번호</td>
				<td><input type="text" name="empno"></td>
			</tr>
			<tr>
				<td>사원이름</td>
				<td><input type="text" name="ename"></td>
			</tr>
			<tr>
				<td>직급</td>
				<td><input type="text" name="job"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>
