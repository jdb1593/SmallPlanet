<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="uVO" class="userPack.UserVO"/>
<jsp:useBean id="uDAO" class="userPack.UserDAO"/>
<jsp:setProperty property="*" name="uVO"/>
<%
	String msg = "비밀번호가 일치하지 않습니다.";
	String url = "secession.jsp";
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	boolean result = uDAO.deleteUser(email,password);
	if(result){
		msg = "SMALL PLANET에서 탈퇴하셨습니다.";
		url = "index.jsp";
		session.invalidate();
	}
	
%>
<script>
	alert("<%=msg %>");
	location.href = "<%=url%>";
</script>
