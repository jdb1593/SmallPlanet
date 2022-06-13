<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="uVO" class="userPack.UserVO"/>
<jsp:useBean id="uDAO" class="userPack.UserDAO"/>
<jsp:setProperty property="*" name="uVO"/>
<%
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String brithday = request.getParameter("birthday");
	String msg = "failed";
	String url = "signIn.jsp";
	
	boolean emailCheck = uDAO.emailCheck(email);
	if(!emailCheck){
		boolean result = uDAO.insertUser(uVO);
		if(result){
			msg = "success";
		}		
	}
	
%>
<form name="emailfrm" method="post" action="signIn.jsp">
	<input type="hidden" name="emails" value="<%=email %>">
	<input type="hidden" name="names" value="<%=name %>">
	<input type="hidden" name="birthdays" value="<%=brithday %>">
</form>
<script>
	alert("<%=msg %>");
	if(<%=emailCheck%>){
		document.emailfrm.submit();
	}else{
		location.href = "<%=url%>";
	}
</script>
