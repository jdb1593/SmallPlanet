<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="uVO" class="userPack.UserVO"/>
<jsp:useBean id="uDAO" class="userPack.UserDAO"/>
<jsp:setProperty property="*" name="uVO"/>
<%
	String msg = "failed";
	String url = "index.jsp";
	
	boolean result = uDAO.updateUser(uVO);
	if(result){
		msg = "비밀번호 변경에 성공하였습니다. 다시 로그인 해 주세요";
		url = "signIn.jsp";
		session.invalidate();
	}

%>
<script>
	alert("<%=msg %>");
	location.href = "<%=url%>";
</script>
