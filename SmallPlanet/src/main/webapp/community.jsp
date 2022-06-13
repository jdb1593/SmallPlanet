<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="boardPack.BoardVO" %>
<%@page import="java.util.Vector" %>
<jsp:useBean id="bDAO" class="boardPack.BoardDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	
	String boardName = "community";
	int start = 0;
	int end = 10;
	int listSize = 0;
	Vector<BoardVO> vlist = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<%
	vlist = bDAO.getBoardList(boardName, start, end);
	listSize = vlist.size();
	for(int i=0;i<10;i++){
		if(i==listSize) break;
		BoardVO vo = vlist.get(i);
		int seq = vo.getSeq();
		String subject = vo.getSubject();
		String title = vo.getTitle();
		String writer = vo.getWriter();
		String uploadDate = vo.getUploadDate();
		int cnt = vo.getCnt();
%>
	<tr>
		<td><%=seq %></td>
		<td><%=subject %></td>
		<td><%=title %></td>
		<td><%=writer %></td>
		<td><%=uploadDate %></td>
		<td><%=cnt %></td>
	</tr>
<%	} %>
</table>
</body>
</html>