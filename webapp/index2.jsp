<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!DOCTYPE jsp>
<html lang="KO">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/index-sub.css">
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

    <script>
        $(document).ready(function () {
            $('.slider').bxSlider({
                adaptiveHeight: true,
                mode: 'fade',
                speed: 1300,
                auto: true,
            });
        });
    </script>
    <style>
        .box-img {
            border-radius: 20px;
        }

        .a_border_none {
            border: 0px;
        }

        .content-box {
            border: none;
        }
    </style>
</head>

<body>
    <header style="z-index: 100000;">
        <!-- Logo -->
        <nav class="navbar">
            <div class="navbar_logo">
                <a style="color: #5180d8;" href="index.jsp" class="navbar_logotext">SMALLPLANET</a>                
            </div>            

            <!-- nav 메뉴 -->
            <div class="menu">
                <ul class="navbar_menu">
                    <!-- <li><a class="menuNum auto-login" style="display: none;">ADMIN</a></li> -->
                    <li><a class="menuNum auto-login" style="display: none;" href="./login.jsp">LOGIN / JOIN</a></li>
                    <li><a class="menuNum" href="./introduce.jsp">소 개</a></li>
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

                <!-- 관리자 -->
                <!-- <div class='btn_container'>
                    <a class='pulse-button'>ADMIN</a>
                </div> -->

                <!-- // 로그인 했을때 프로필 모양
                    <a href="./memberInfo.jsp">
                    <img src="./이미지/profiledefault.png" alt="" class="profile-picture">                
                    <div style="position: relative; top: -30px; right: -10px;">
                    닉네임
                    </a>       
                    <a href="#" style="margin-left: 10px;">로그아웃</a>     -->
            </div>
            

            <!-- 해상도 낮아지면 생기는 버튼 -->
            <a href="#" class="navbar_toggleBtn">
                <i class="fa-solid fa-bars"></i>
            </a>
        </nav>
        <hr class="header_line">
    </header>
    <main>

        <div class="slider-container">
            <div class="slider">
                <div><a href=""><img class="bximg" src="./images/1920BXimg1.jpg" alt=""></a></div>
                <div><a href=""><img class="bximg" src="./images/1920bximg2.jpg" alt=""></a></div>
                <div><a href=""><img class="bximg" src="./images/1920bsimg4.jpg" alt=""></a></div>
                <div><a href=""><img class="bximg" src="./images/1920bsimg5.png" alt=""></a></div>
                <div><a href=""><img class="bximg" src="./images/1920bximg6.jpg" alt=""></a></div>
                <div><a href=""><img class="bximg" src="./images/1920bximg7.jpg" alt=""></a></div>
            </div>
        </div>
        
        <div class="main-content1">
            <div class="title-box">
                <h2 class="main-title">커 뮤 니 티</h2>
            </div>
            <div class="box-bundle">
            <%for(int i=0;i<8;i++){ %>
                <div class="bundle-content">
                    <div class="content-box"><a href=""><img class="box-img" src="#" alt=""></a></div>
                    <a href="">
                        <p class="box-info" style="font-size:21px;">ㅎㅇ</p>
                    </a>
                    <p class="box-info" style="font-size:10px;">조회수</p>
                    <p class="box-info" style="font-size:10px;">2000-06-30</p>
                </div>
            <%} %>
            </div>
            <br>
            <br>
            <div class="wrap">
                <a href="./community_list.html" class="button">M&nbspO&nbspR&nbspE&nbsp&nbsp&nbsp&nbsp&nbsp +</a>
            </div>
        </div>

        <div class="main-content2">
            <div class="title-box">
                <h2 class="main-title">자 료 실</h2>
            </div>
            <div class="box-bundle">
            <%for(int i=0;i<8;i++){ %>
                <div class="bundle-content">
                    <div class="content-box"><a href=""><img class="box-img" src="#" alt=""></a></div>
                    <a href="">
                        <p class="box-info" style="font-size:21px;">ㅎㅇ</p>
                    </a>
                    <p class="box-info" style="font-size:10px;">조회수</p>
                    <p class="box-info" style="font-size:10px;">2000-06-30</p>
                </div>
            <%} %>
            </div>
            <br>
            <br>
            <div class="wrap">
                <a href="#" class="button">M&nbspO&nbspR&nbspE&nbsp&nbsp&nbsp&nbsp&nbsp +</a>
            </div>
        </div>



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
    <script src="script/index-sub.js"></script>
</body>

</html>