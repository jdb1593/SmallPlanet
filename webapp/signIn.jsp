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
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	 <!-- icon 이미지 -->
	 <script src="https://kit.fontawesome.com/cd6c1c6007.js" crossorigin="anonymous"></script>
	 <!-- bxSlider -->
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	 <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
				<%-- <% if(checkMsg!=""){%>
					<span id="checkMsg"><%=checkMsg %></span>
				<% }%> --%>
				<div class="form-space"><%=checkMsg %></div>
				<input class="sign-input pw" type="password" name="password" id="password_1"  
					placeholder="비밀번호" required="" minlength="8" maxlength="20">
				<div id="password-danger" style="display: none;">숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.</div>
				<div id="password-danger3" style="display: none;">같은 문자를 4번 이상 사용 하실 수 없습니다.</div>
				<input class="sign-input pw" type="password" name="passwordCfrm" id="password_2" 
					placeholder="비밀번호 확인" required="" minlength="8" maxlength="20">
				<div id="alert-success" style="display: none;">비밀번호가 일치합니다.</div>
    			<div id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</div>
				<div>
					<%-- <input class="sign-input birth-year" type="number" name="birthyear" value="<%=birthyears %>" 
						placeholder="년(4자)" min="1900" max="<%=sf.format(now) %>" maxlength="4" title="4자리 숫자" required> --%>
					<input class="sign-input birth-year" type="text" id="year" name="birthyear" placeholder="년(4자)" 
						maxlength="4" pattern="[0-9]+" min="1900" max="<%=sf.format(now) %>" required>
					<div id="password-danger2" style="display: none;">년도는 1900 ~ 2022 사이로 기입해주세요.</div>
	                <select name="birthmonth" class="birth" id="mon" value="월" required>
						<!-- <option value="">월</option> -->
	                    <%for(int i = 1; i<=12; i++){%>                
	                        <option value="<%=i%>"><%=i%></option>   
	                   <% } %>
					</select>
						
					<select name="birthdate" class="birth" id="day" value="일" required>
						<!-- <option value="">일</option> -->
					<%for(int j = 1; j <=31; j++) {%>							
								<option value="<%=j%>"><%=j%></option>						
					<% } %>
					</select>
					<input type="hidden" name="birthday" value="">
				</div>
				
				<input type="button" onclick="checkPassword()" style="margin-top: -38px;" value="가입하기" class="button">
				<div class="close-btn">
					<a href="index-sub.html">X</a>
				</div>
			</form>
		</div>

		<!-- 로그인 -->
		<div class="login" style="position: relative; top: 40px;">
			<form action="post" class="login-form">
				<label for="chk" aria-hidden="true" style="padding-top: 10px;">로그인</label>
				<input class="login-input" type="email" name="user_email" placeholder="이메일" required>
				<div class="form-space"></div>
				<div class="login-pw">
					<input class="login-input" type="password" name="user_pswd" placeholder="비밀번호" required>
					<i class="fa fa-eye fa-lg" onclick=""></i>
					<div class="form-space" style="margin-top: -20px ;"></div>
				</div>
				<input type="button" value="login" class="button" onkeyup="if(window.event.keyCode==13)">
			</form>
		</div>
	</div>	
	<script src="script/login.js"></script>
</body>
</html>