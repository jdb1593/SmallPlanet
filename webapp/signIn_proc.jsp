<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="uDAO" class="userPack.UserDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String url = "signIn.jsp";
	String msg = "failed";
	
	boolean result = uDAO.login(email, password);
	if(result){
		session.setAttribute("user", email);
		msg = "success";
		url = "index.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>