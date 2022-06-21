<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="uDAO" class="userPack.UserDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("user_email");
	String password = request.getParameter("user_pswd");
	String url = "signIn.jsp";
	String successUrl = (String)session.getAttribute("referUrl");
	String msg = "로그인 실패";
	
	boolean result = false;
	boolean emailCheck = uDAO.emailCheck(email);
	if(emailCheck){
		result = uDAO.login(email, password);
		if(result){
			session.setAttribute("user", email);
			msg = "로그인 성공";
			url = successUrl!=null? successUrl:"index.jsp";
		}
	}
%>
<form name="emailfrm" method="post" action="signIn.jsp">
	<input type="hidden" name="emaill" value="<%=email %>">
	<input type="hidden" name="emaillc" value="<%=emailCheck %>">
	<input type="hidden" name="pswdl" value="<%=result %>">
</form>
<script>
	alert("<%=msg %>");
	if(!<%=emailCheck%> || !<%=result %>){
		document.emailfrm.submit();
	}else{
		location.href = "<%=url%>";
	}
</script>