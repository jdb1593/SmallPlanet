<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("utf-8");
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy");


	String emails = request.getParameter("emails");
	String names = request.getParameter("names");
	String birthyears = request.getParameter("birthyears");
	String checkMsg = "";
	if(emails==null){
		emails = "";
		names = "";
		birthyears = "";
	}else{
		checkMsg = "email invailed";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMALL PLANET </title>
	<link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" type="text/css" href="slide navbar style.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</head>
<body>
<%-- 	<!-- signup -->
	<form name="signUp" method="post" action="signUp_proc.jsp">
		email <input type="email" name="email" value="<%=emails %>" required><br>
		<% if(checkMsg!=""){%>
			<span><%=checkMsg %></span><br>
		<% }%>
		name <input name="name" value="<%=names %>" required><br>
		birthday <input name="birthday" value="<%=birthyears %>" required><br>
		password <input name="password" required><br>
		password confirm <input name="passwordCfrm" required><br>
		<input type="submit" value="signup">
	</form>
	
	<!-- login -->
	<form name="login" method="post" action="signIn_proc.jsp">
		email <input name="email" required>
		password <input name="password" required>
		<input type="submit" value="login">
	</form> --%>
	
	
	
	
	
	
	
	<div class="logo"><img src="images/smpLogo.png" alt="" class="logo_img"> <span style="position: relative; left: -10px;">SMALLPLANET</span></div>	
	<div class="main">
		<input type="checkbox" id="chk" aria-hidden="true">

		<!-- 회원가입 -->
		<div class="signup">
			<form name="signUp" method="post" action="signUp_proc.jsp">
				<label for="chk" class="signup-title" aria-hidden="true">회원 가입</label>
				<input class="sign-input" type="text" name="name" value="<%=names %>" placeholder="이름" required>
				<input class="sign-input" type="email" name="email" value="<%=emails %>" placeholder="이메일" required>
				<% if(checkMsg!=""){%>
					<span id="checkMsg"><%=checkMsg %></span>
				<% }%>
				<input class="sign-input" type="password" name="password" id="password" placeholder="비밀번호" 
					required pattern=".{8,20}" title="비밀번호는 8~20자 입니다">
				<input class="sign-input" type="password" name="passwordCfrm" id="password" placeholder="비밀번호 확인" 
					required pattern=".{8,20}" title="비밀번호는 8~20자 입니다">
				<input class="sign-input birth-year" type="number" name="birthyear" value="<%=birthyears %>" 
					placeholder="년(4자)" min="1900" max="<%=sf.format(now) %>" maxlength="4" title="4자리 숫자" required>
                <select name="birthmonth" class="birth">
					<option value="">월</option>
                    <%for(int i = 1; i<=12; i++){%>                
                        <option value="<%=i%>"><%=i%></option>   
                   <% } %>
				</select>
					
				<select name="birthday" class="birth">
					<option value="">일</option>
				<%for(int j = 1; j <=31; j++) {%>							
							<option value="<%=j%>"><%=j%></option>						
				<% } %>
				</select>
				<button onclick="checkPassword()" style="margin-top: -38px;">가입하기</button>
				<div class="close-btn">
					<a href="index.jsp">X</a>
				</div>
			</form>
		</div>

		<!-- 로그인 -->
		<div class="login" style="position: relative; top: 40px;">
			<form name="login" method="post" action="signIn_proc.jsp">
				<label for="chk" aria-hidden="true" style="padding-top: 10px;">로그인</label>
				<input class="login-input" type="email" name="user_email" placeholder="이메일" required>
				<div class="login-pw">
					<input class="login-input" type="password" name="user_pswd" placeholder="비밀번호" required>
					<i class="fa fa-eye fa-lg" onclick=""></i>
				</div>
				<button onclick="openConfirmID()">login</button>
			</form>
		</div>
	</div>
	<script src="script/login.js"></script>
</body>
</html>