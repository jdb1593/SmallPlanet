<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bDAO" class="boardPack.BoardDAO" />
<jsp:useBean id="iDAO" class="boardPack.InquiryDAO" />
<%@page import="userPack.UserVO" %>
<jsp:useBean id="uDAO" class="userPack.UserDAO" />
<%
	request.setCharacterEncoding("utf-8");

	int seq = Integer.parseInt(request.getParameter("seq"));
	String boardName = request.getParameter("boardName");
	String url = boardName+".jsp";
	if(boardName.equals("inquiryBoard")){
		String user = (String)session.getAttribute("user");
		UserVO uVO = new UserVO();
		String userName = "";
		String userAuthority = "";
		if(user!=null){
			uVO = uDAO.getUser(user);
			userName = uVO.getName();
			userAuthority = uVO.getAuthority();
		}
		
		if(!userAuthority.equals("admin")){
	%>
		<script>
			alert("관리자 전용 페이지입니다.");
			location.href="index.jsp";
		</script>
	<%
		}else{
			iDAO.deleteInquiry(seq);
			url = "admin-list.jsp";
		}
	}else{
		bDAO.deleteBoard(boardName,seq);
	}
%>
<script>
	alert("deleted");
	location.href="<%=url%>";
</script>