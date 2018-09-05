<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/defalut.css">
<style>
h3, td {
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="common/header.jsp"%>
	<div id="contents2">
	<h3>회원가입</h3>
	<hr>
	<form>
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>