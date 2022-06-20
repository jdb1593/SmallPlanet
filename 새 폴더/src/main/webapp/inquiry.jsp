<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="boardPack.BoardVO" %>
<%@page import="java.util.Vector" %>
<jsp:useBean id="bDAO" class="boardPack.BoardDAO"/>
<%@page import="userPack.UserVO" %>
<jsp:useBean id="uDAO" class="userPack.UserDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	String user = (String)session.getAttribute("user");
	UserVO uVO = new UserVO();
	String userName = "";
	if(user!=null){
		uVO = uDAO.getUser(user);
		userName = uVO.getName();
	}
%>
<!DOCTYPE html>
<html lang="KO">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index-sub.css">
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
	<script>$(document).on("change", ".file-input", function(){
	    $filename = $(this).val();
	    if($filename == "")
	      $filename = "파일을 선택해주세요.";
	    $(".filename").text($filename);
	  })
	  </script>

    <script>
        $(document).ready(function () {
            $('.slider').bxSlider({
                slideWidth: 2000,
                speed: 1300,
                auto: true,
            });
        });
    </script>


</head>

<body>
    <header style="z-index: 1;">
        <!-- Logo -->
        <nav class="navbar">
            <div class="navbar_logo">
                <a style="color: #5180d8; border-bottom: 0px solid transparent;" href="index.jsp"
                    class="navbar_logotext">SMALLPLANET</a>
            </div>

            <!-- nav 메뉴 -->
            <div class="menu">
                <ul class="navbar_menu">
                    <li><a class="menuNum" href="introduce.jsp">소 개</a></li>
                    <li><a class="menuNum" href="community.jsp">커뮤니티</a></li>
                    <li><a class="menuNum" href="dataBoard.jsp">자 료 실</a></li>
                    <li><a class="menuNum" href="qnaBoard.jsp">Q & A</a></li>                    
                    <li><a class="menuNum" href="inquiry.jsp" style="border-bottom: 2px solid #5180d8; padding-bottom: 42px;">문의하기</a>
                    </li>
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
        <br>
        <div class="inquiry-form">
            <form method="post" action="insertInquiry" enctype="multipart/form-data">
            	<input name="writer" type="hidden" value="<%=request.getRemoteAddr()%>">
                <h3 class="inq-title">문의 등록</h3>
                <hr>
                <div class="p">제 목</div>
                <input name="title" class="inputs" type="text" placeholder="제목을 입력하세요" required><br><br>
                <div class="p">E-MAIL</div>
                <input name="email" class="inputs" type="email" placeholder="ex) abc@abc.com" required><br><br>
                <div class="p">내 용</div>
                <textarea name="content" class="inputs" name="" id="" cols="30" rows="10" required></textarea>
                <div class="p">연 락 처</div>
                <input name="phoneNumber" class="inputs" type="tel" placeholder="'-'없이 입력해주세요" required>
                <hr>
                <div class="filebox">
                    
<div class="box-file-input"><label><input type="file" name="ev_display" class="file-input" accept="image/*"></label><span class="filename">파일을 선택해주세요.</div>
                </div>
                <hr>
                <div>
                    <h5>개인정보 수집 및 이용에 대한 동의</h5>
                    <p style="font-size: 10px;">정보통신망 이용촉진 및 정보보호 등에 관한 법률을 준수하며 고객님의 개인정보를 수집하고 소중하게 다루고 있습니다. <br>
                        ①개인정보 수집 항목: 이름, 이메일 주소<br>
                        ②수집목적:고객식별, 문의응대, 서비스 품질 향상<br>
                        ③보유 및 이용기간: 수집 목적이 달성되면 지체없이 모든 개인정보를 파기합니다. 단, 관계법령에서 일정 기간 정보의 보관을 규정한 경우에 한해 분리 보관 후 파기합니다.
                    </p>

                </div>
                <div><input type="radio" required> 동의합니다.</div>
                <hr>
                <input type="submit" style="font-family: 'Black Han Sans', sans-serif;" class="button" value="SUBMIT">
            </form>
        </div>
    </main>
    <footer class="foot-container">
        <div class="container">
            <br>
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <h6></h6>
                    <p style="color: #5b5b5b; font-size: 14px;" class="text-justify">안녕하세요 <b>Small planet</b> 입니다.
                        <br>세상에
                        모든것들은 아주 작은 것에서 비롯되어
                        형태를 이루고 자연과 조화를 이루어
                        상생합니다.
                        <br>그렇게 저희 Small Planet 또한 상생과 조화를 통한 협업으로 이끌어지는 팀입니다.
                    </p>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6 style="color: #5b5b5b;">Categories</h6>
                    <ul class="footer-links">
                        <li><a href="#">소 개</a></li>
                        <li><a href="#">커뮤니티</a></li>
                        <li><a href="#">자료실</a></li>
                        <li><a href="#">Q & A</a></li>
                    </ul>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6 style="color: #5b5b5b;">Quick Links</h6>
                    <ul class="footer-links">
                        <li><a href="https://www.notion.so/SMALLPLANET-1448bed7cc404ec8b351574e2049d10a">Notion</a></li>
                        <li><a href="https://github.com/jdb1593/SmallPlanet">GitHub</a></li>

                    </ul>
                </div>
            </div> 
            <hr>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <p style="color: #5b5b5b; font-size: 12px;" class="copyright-text">Copyright &copy; 2022 All Rights
                        Reserved by
                        <a href="https://github.com/jdb1593/SmallPlanet">Small Planet</a>.
                    </p>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <ul class="social-icons">
                        <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                        <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <script src="script/index-sub.js"></script>
</body>
</html>