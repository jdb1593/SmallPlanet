<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- partial:index.partial.html -->
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>SMALL PLANET </title>
	<link rel="stylesheet" href="./login.css">
	<link rel="stylesheet" type="text/css" href="slide navbar style.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</head>

<body>
	<div class="logo"><img src="./이미지/smpLogo.png" alt="" class="logo_img"> <span style="position: relative; left: -10px;">SMALLPLANET</span></div>	
	<div class="main">
		<input type="checkbox" id="chk" aria-hidden="true">

		<!-- 회원가입 -->
		<div class="signup">
			<form action="post">
				<label for="chk" class="signup-title" aria-hidden="true">회원 가입</label>
				<input class="sign-input" type="text" name="user_name" placeholder="이름" required="">
				<input class="sign-input" type="email" name="user_email" placeholder="이메일" required="">
				<input class="sign-input" type="password" name="user_pw" id="password" placeholder="비밀번호" required="" minlength="8" maxlength="20">
				<input class="sign-input" type="password" name="user_pwc" id="password" placeholder="비밀번호 확인" required="" minlength="8" maxlength="20">
				<input class="sign-input birth-year" type="user_birthday" name="birth" placeholder="년(4자)" maxlength="4" required="">
                <select name="month" class="birth">
					<option value="">월</option>
                    <%for(int i = 1; i<=12; i++){                        
                   %>                
                        <option value="<%=i%>"><%=i%></option>   
                   <% } %>
				</select>
					
				<select name="day" class="birth">
					<option value="">일</option>
				<%
					for(int j = 1; j <=31; j++) {
						%>							
							<option value="<%=j%>"><%=j%></option>						
						<%
					}
				%>
				</select>
				<button onclick="checkPassword()" style="margin-top: -38px;">가입하기</button>
				<div class="close-btn">
					<a href="index-sub.html">X</a>
				</div>
			</form>
		</div>

		<!-- 로그인 -->
	<script src="login.js"></script>
</body>
</html>
<!-- partial -->
