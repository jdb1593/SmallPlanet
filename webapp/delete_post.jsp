<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bDAO" class="boardPack.BoardDAO" />
<%
	request.setCharacterEncoding("utf-8");

	int seq = Integer.parseInt(request.getParameter("seq"));
	String boardName = request.getParameter("boardName");
	bDAO.deleteBoard(boardName,seq);
	String url = boardName+".jsp";
%>
<script>
	alert("deleted");
	location.href="<%=url%>";
</script>