<%@page import="boardPack.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bDAO" class="boardPack.BoardDAO" />
<%
	request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	String boardName = request.getParameter("boardName");
	BoardVO vo = bDAO.getBoard(boardName, seq);
	String title = vo.getTitle();
	String writer = vo.getWriter();
	String subject = vo.getSubject();
	String content = vo.getContent();
	int ref = vo.getRef();
	String fileName = vo.getFileName();
	int fileSize = vo.getFileSize();
	String uploadDate = vo.getUploadDate();
	String updateDate = vo.getUpdateDate();
	int cnt = vo.getCnt();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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