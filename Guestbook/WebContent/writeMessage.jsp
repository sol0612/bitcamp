<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="guest.model.Message"%>
<%@ page import="guest.service.WriteMessageService"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="message" class="guest.model.Message">
	<jsp:setProperty name="message" property="*" />
</jsp:useBean>
<%
	WriteMessageService writeService = WriteMessageService.getInstance();
	writeService.write(message);
%>
<html>
<head>
<title>방명록 메시지 남김</title>
</head>
<body>
	방명록에 메시지를 남겼습니다.
	<br />
	<a href="list.jsp">[목록 보기]</a>
</body>
</html>