<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String emails = request.getParameter("emails");
	String names = request.getParameter("names");
	String birthdays = request.getParameter("birthdays");
	String checkMsg = "";
	if(emails==null){
		emails = "";
		names = "";
		birthdays = "";
	}else{
		checkMsg = "email invailed";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
	<!-- signup -->
	<form name="signUp" method="post" action="signUp_proc.jsp">
		email <input type="email" name="email" value="<%=emails %>" required><br>
		<% if(checkMsg!=""){%>
			<span><%=checkMsg %></span><br>
		<% }%>
		name <input name="name" value="<%=names %>" required><br>
		birthday <input name="birthday" value="<%=birthdays %>" required><br>
		password <input name="password" required><br>
		password confirm <input name="passwordCfrm" required><br>
		<input type="submit" value="signup">
	</form>
	
	<!-- login -->
	<form name="login" method="post" action="signIn_proc.jsp">
		email <input name="email" required>
		password <input name="password" required>
		<input type="submit" value="login">
	</form>
</body>
</html>