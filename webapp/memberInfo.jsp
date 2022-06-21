<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="uDAO" class="userPack.UserDAO"/>
<%@page import="userPack.UserVO" %>
<%
	request.setCharacterEncoding("utf-8");
	String user = (String)session.getAttribute("user");
	UserVO uVO = new UserVO();
	String userName = "";
	String userEmail = "";
	String userBirthday = "";
	String userRegDate = "";
	if(user==null || user.equals("")){
%>
	<script>
		alert("로그인 후 이용가능합니다.");
		location.href="signIn.jsp";
	</script>
<%
	}else{
		uVO = uDAO.getUser(user);
		userName = uVO.getName();
		userEmail = uVO.getEmail();
		userBirthday = uVO.getBirthday();
		userRegDate = uVO.getRegDate();
%>
<!DOCTYPE html>
<html lang="KO">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index-sub.css">
    <link rel="stylesheet" href="community_list.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <title>Small Planet</title>
    <!-- 구글폰트 import -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gugi&family=Pacifico&family=Roboto:ital,wght@1,300&family=Supermercado+One&display=swap');
    </style>
    <!-- 부트스트랩 jsDelivr CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- 부트스트랩 jsDeliver JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <!-- icon 이미지 -->
    <script src="https://kit.fontawesome.com/cd6c1c6007.js" crossorigin="anonymous"></script>
    <!-- bxSlider -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <style>
        .form-control {
            margin: 5px 0px;
        }


        .info_container {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
    <header style="z-index: 1;">
        <!-- Logo -->
        <nav class="navbar">
            <div class="navbar_logo">
                <a style="color: #5180d8; border-bottom: 2px solid transparent;" href="index.jsp"
                    class="navbar_logotext">SMALLPLANET</a>
            </div>

            <!-- nav 메뉴 -->
            <div class="menu">
                <ul class="navbar_menu">
                    <li><a class="menuNum" href="introduce.jsp">소 개</a></li>
                    <li><a class="menuNum" href="community.jsp">커뮤니티</a></li>
                    <li><a class="menuNum" href="dataBoard.jsp">자 료 실</a></li>
                    <li><a class="menuNum" href="qnaBoard.jsp">Q & A</a></li>
                    <li><a class="menuNum" href="inquiry.jsp">문의하기</a></li>
                </ul>
            </div>

        <div class="loginJoin">
            <%if(user!=null){%>
             <!-- // 로그인 했을때 프로필 모양-->
					<a href="memberInfo.jsp">
                    <img src="./images/profiledefault.png" alt="" class="profile-picture">                
                    <div style="position: relative; top: -30px; right: -10px;">
                    <%=userName %>
                </a>       
                <a href="logout.jsp" style="margin-left: 10px;">로그아웃</a>
			<%}else{ %>
            	<a href="signIn.jsp">LOGIN / JOIN</a>
			<%} %>
			</div>
            <!-- 해상도 낮아지면 생기는 버튼 -->
            <a href="#" class="navbar_toggleBtn">
                <i class="fa-solid fa-bars"></i>
            </a>
        </nav>
        <hr class="header_line">
    </header>
    <main>
        <div style="padding-top: 15px;padding-bottom:  55px;" class="container info_container">
            <div class="col-lg-4">
                <div class="jumbotron" style="padding-top: 15px;">
                    <form name="memberUpdate" method="post" action="member_update.jsp">
                        <h3 style="text-align: center; padding-bottom: 35px;">회원정보 수정</h3>
                        <div class="form-group">
                            <label>이메일</label>
                            <input type="email" name="email" value="<%=userEmail%>" class="form-control" style="background-color:#c0c0c0;" readonly>
                        <div class="form-group">
                        <label>비밀번호</label>
                            <input id="password_1" type="password" class="form-control pw" placeholder="비밀번호"
                                name="password" maxlength="20" value="">
                            <input id="password_2" type="password" class="form-control pw" placeholder="비밀번호 확인"
                                name="userPasswordCheck" maxlength="20" value="">
                        </div>
                        <!-- <input style=" width: 13%;text-align: center; display: flex;" type="submit"
                                class="btn btn-primary form-control" value="확인"> -->
                        <div style="position: relative; text-align: right;">
                            <div id="success" style="display:none; color: #000; font-size: 9px;">비밀번호가 일치합니다.</div>
                            <div id="danger" style="display:none; color: #d92742; font-weight: bold; font-size: 9px;">비밀번호가일치하지 않습니다.</div>
                            <div id="password-danger" style="font-size:9px; color:red; display: none;">숫자+영문자+특수문자 조합으로 8자리 이상
                                사용해야 합니다.</div>
                            <div id="password-danger3" style="font-size:9px; color:red; display:none;">같은 문자를 4번 이상 사용 하실 수
                                없습니다.</div>
                        </div>

                        <div class=" form-group">
                        <label>회원이름</label>
                            <input type="text" class="form-control" placeholder="이름" name="name" maxlength="20"
                                value="<%=userName%>" readonly>
                        </div>
                        <div class="form-group">
                        <label>생년월일</label>
<%--                             <input type="text" class="form-control" placeholder="생년월일" name="birthday"
                                maxlength="20" value="<%=userBirthday%>" readonly>
                        </div> --%>
                            <div class="form-control" style="background-color:#c0c0c0;"><%=userBirthday%>
                        </div>
                        <label>가입일자</label>
<%--                             <input type="text" class="form-control" placeholder="가입일자" name="joindate"
                                maxlength="20" value="<%=userRegDate%>" readonly>
                        </div> --%>
                            <div class="form-control" style="background-color:#c0c0c0;"><%=userRegDate%></div>

                        <input style="margin-top: 15px;" type="button" onclick="checkPassword()"
                            class="btn btn-primary form-control" value="수정완료">
                        
                        <a href="secession.jsp" style="margin-top: 5px; border: 1px solid #ff3232; 
                        	background-color:#ff3232;" class="btn btn-primary form-control">회원탈퇴</a>
                    </form>
                </div>
            </div>

            <script>
                //비밀번호 확인
                $('.pw').focusout(function () {
                    let pwd1 = $("#password_1").val();
                    let pwd2 = $("#password_2").val();
                    if (pwd1 != '' && pwd2 == '') {
                        null;
                    } else if (pwd1 != "" || pwd2 != "") {
                        if (pwd1 == pwd2) {
                            $("#success").css('display', 'block');
                            $("#danger").css('display', 'none');
                        } else {
                            $("#success").css('display', 'none');
                            $("#danger").css('display', 'block');
                        }
                    }
                });
                // 비밀번호 유효성 검사 문법
                function checkPassword() {
                    // 비밀번호 확인
                    let pwd1 = $("#password_1").val();
                    if(pwd1!=null){
	                    let pwd2 = $("#password_2").val();
	                    if (pwd1 !== pwd2) {
	                        $('#password_1').val('').focus();
	                        $('#password_2').val('').focus();
	                        return false;
	                    }
	                    // 정규식
	                    if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(pwd1)) {
	                        if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(pwd2)) {
	                            $("#password-danger").css('display', 'block');
	                            $("#password-danger3").css('display', 'none');
	                            $("#danger").css('display', 'none');
	                            $("#success").css('display', 'none');
	                            $('#password_1').val('').focus();
	                            $('#password_2').val('').focus();
	                            setTimeout(function () {
	                                $("#password-danger").css('display', 'none');
	                            }, 5000)
	                            return false;
	                        }
	                    }
	                    if (/(\w)\1\1\1/.test(pwd1)) {
	                        if (/(\w)\1\1\1/.test(pwd2)) {
	                            $("#password-danger3").css('display', 'block');
	                            $("#password-danger").css('display', 'none');
	                            $('#password_1').val('').focus();
	                            $('#password_2').val('').focus();
	                            return false;
	                        };
	                    };
                    }
                    document.memberUpdate.submit();
                };
            </script>
            <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
            <script src="js/bootstrap.js"></script>
    </main>
 <footer class="foot-container">
        <div class="container">
            <br>
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <h6></h6>
                    <p style="color: #5b5b5b;" class="text-justify">안녕하세요 Small planet 입니다. <br>세상에 모든것들은 아주 작은 것에서 비롯되어
                        형태를 이루고<br> 자연과 조화를 이루어
                        상생합니다.
                        그렇게 저희 Small Planet 또한 <br>상생과 조화를 통한 협업으로 이끌어지는 팀입니다.</p>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6 style="color: #5b5b5b;">Categories</h6>
                    <ul class="footer-links">
                        <li><a href="./introduce.jsp">소개</a></li>
                        <li><a href="./community.jsp">커뮤니티</a></li>
                        <li><a href="./dataBoard.jsp">자료실</a></li>
                        <li><a href="./qnaBoard.jsp">Q & A</a></li>
                        <li><a href="./inquiry.jsp">문의하기</a></li>
                    </ul>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6 style="color: #5b5b5b;">Quick Links</h6>
                    <ul class="footer-links">
                        <li><a href="https://gratis-zinc-179.notion.site/0edca8071fd94328ac9b6614af09ee45" target= "_blank">Notion</a></li>
                        <li><a href="https://github.com/jdb1593/SmallPlanet.git" target= "_blank">GitHub</a></li>
                    </ul>
                </div>
            </div>
            <hr>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <p style="color: #5b5b5b;" class="copyright-text">Copyright &copy; 2022 All Rights Reserved by
                        <a href="https://github.com/jdb1593/SmallPlanet.git">Small Planet</a>.
                    </p>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <ul class="social-icons">
                        <li><a class="facebook" href="https://ko-kr.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                        <li><a class="twitter" href="https://twitter.com/?lang=ko"><i class="fa fa-twitter"></i></a></li>
                        <li><a class="dribbble" href="https://dribbble.com/"><i class="fa fa-dribbble"></i></a></li>
                        <li><a class="linkedin" href="https://kr.linkedin.com/"><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <script src="script/community_list.js"></script>
</body>
</html>
<%}%>