<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bVO" class="boardPack.BoardVO"/>
<jsp:useBean id="bDAO" class="boardPack.BoardDAO"/>
<jsp:setProperty property="*" name="bVO"/>
<%
	String boardName = request.getParameter("board");
	int ref = Integer.parseInt(request.getParameter("ref"));
	String msg = "failed";
	String url = "view_post.jsp?boardName="+boardName+"&seq="+ref;
	
	bDAO.commentBoard(boardName,bVO);
%>
<script>
	location.href = "<%=url%>";
</script>