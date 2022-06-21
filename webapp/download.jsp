<%@page contentType="application; charset=utf-8"%>
<jsp:useBean id="bDAO" class="boardPack.BoardDAO" />
<%
	  bDAO.downLoad(request, response, out, pageContext);
%>