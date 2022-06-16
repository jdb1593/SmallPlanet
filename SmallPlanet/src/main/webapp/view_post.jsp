<%@page import="boardPack.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bDAO" class="boardPack.BoardDAO" />
<%
	request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	String boardName = request.getParameter("boardName");
	BoardVO bVO = bDAO.getBoard(boardName, seq);
	String title = bVO.getTitle();
	String writer = bVO.getWriter();
	String subject = bVO.getSubject();
	String content = bVO.getContent();
	int ref = bVO.getRef();
	String fileName = bVO.getFileName();
	int fileSize = bVO.getFileSize();
	String uploadDate = bVO.getUploadDate();
	String updateDate = bVO.getUpdateDate();
	int cnt = bVO.getCnt();
	session.setAttribute("board", bVO);//게시물을 세션에 저장
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="delete_post.jsp?boardName=<%=boardName%>&seq=<%=seq%>">삭제</a><br/>
<a href="post.jsp?boardName=<%=boardName%>&seq=<%=seq%>">수정</a><br/>
<a href="post.jsp?boardName=<%=boardName%>&ref=<%=ref%>">답글</a><br/>

subject<p><%=subject %></p>
title<p><%=title %></p>
writer<p><%=writer %></p>
uploadDate<p><%=uploadDate %></p>
updateDate<p><%=updateDate %></p>
cnt<p><%=cnt %></p>
fileName<p><%=fileName %></p>
fileSize<p><%=fileSize %></p>
content<p><%=content %></p>

ref<p><%=ref %></p> <!--댓글/답글용  -->
</body>
</html>