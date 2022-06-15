<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="boardPack.BoardVO" %>
<%@page import="java.util.Vector" %>
<jsp:useBean id="bDAO" class="boardPack.BoardDAO"/>
<%@page import="userPack.UserVO" %>
<jsp:useBean id="uDAO" class="userPack.UserDAO"/>
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
<script>
	function read(boardName,seq){
		document.readFrm.seq.value=seq;
		document.readFrm.action="view_post.jsp";
		document.readFrm.submit();
	}
</script>
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
		
		UserVO uVO = uDAO.getUser(writer);
		String writerName = uVO.getName();
		String authoroty = uVO.getAuthoroty();
%>
	<tr>
		<td><%=seq %></td>
		<td><%=subject %></td>
		<td><a href="javascript:read('<%=boardName %>','<%=seq %>')"><%=title %></a></td>
		<td><%=writerName %></td>
		<td><%=uploadDate %></td>
		<td><%=cnt %></td>
	</tr>
<%	} %>
</table>
<form name="readFrm" method="get">
	<input type="hidden" name="seq">
	<input type="hidden" name="boardName" value="<%=boardName %>" readonly>
</form>
</body>
</html>