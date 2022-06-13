<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	  request.setCharacterEncoding("utf-8");
	  String user = (String)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(user!=null){%>
		<p><%=user %></p>
		<a href="logout.jsp">logout</a>
	<%}else{ %>
		<a href="signIn.jsp">login/signUp</a>
	<%} %>
	<a href="community.jsp">community</a>
</body>
</html>