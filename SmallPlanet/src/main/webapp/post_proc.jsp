<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bVO" class="boardPack.BoardVO"/>
<jsp:useBean id="bDAO" class="boardPack.BoardDAO"/>
<jsp:setProperty property="*" name="bVO"/>
<%
	String msg = "failed";
	String url = "signIn.jsp";
	

		/* boolean result = bDAO.insertBoard(bVO); */
	/* 	if(result){
			msg = "success";
		}	 */	

%>