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
<title>���� �޽��� ����</title>
</head>
<body>
	���Ͽ� �޽����� ������ϴ�.
	<br />
	<a href="list.jsp">[��� ����]</a>
</body>
</html>