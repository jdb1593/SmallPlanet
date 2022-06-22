<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bVO" class="boardPack.BoardVO"/>
<jsp:useBean id="bDAO" class="boardPack.BoardDAO"/>
<jsp:setProperty property="*" name="bVO"/>
<%
	String boardName = request.getParameter("board");
	int seq = Integer.parseInt(request.getParameter("seq"));
	String nowPage = request.getParameter("nowPage");
    String keyField = request.getParameter("keyField");
    String keySub = request.getParameter("keySub");
    String keyWord = request.getParameter("keyWord");
	String msg = "failed";
	String url = "view_post.jsp?boardName="+boardName+"&seq="+seq+"&nowPage="+nowPage
			+"&keyField="+keyField+"&keySub="+keySub+"&keyWord="+keyWord;
	
	bDAO.commentBoard(boardName,bVO);
%>
<script>
	location.href = "<%=url%>";
</script>