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
<html class="introhtml" lang="KO">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="index-sub.css">
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
                slideWidth: 2000,
                speed: 1300,
                auto: true,
            });
        });
    </script>


</head>

<body class="introbody">
    <header style="z-index: 999;">
        <!-- Logo -->
        <nav class="navbar">
            <div class="navbar_logo">
                <a style="color: #5180d8;" href="index-sub.html" class="navbar_logotext">SMALLPLANET</a>
            </div>

            <!-- nav 메뉴 -->
            <div class="menu">
                <ul class="navbar_menu">
                    <li><a class="menuNum" href="introduce.html"
                            style="border-bottom: 2px solid #5180d8; padding-bottom: 42px;">소 개</a></li>
                    <li><a class="menuNum" href="community_list.html">커뮤니티</a></li>
                    <li><a class="menuNum" href="data_list.html">자 료 실</a></li>
                    <li><a class="menuNum" href="Q&A.html">Q & A</a></li>
                    <li><a class="menuNum" href="inquiry.html">문의하기</a></li>
                </ul>
            </div>

            <div class="loginJoin"><a href="./login.html">LOGIN / JOIN</a></div>


            <!-- 해상도 낮아지면 생기는 버튼 -->
            <a href="#" class="navbar_toggleBtn">
                <i class="fa-solid fa-bars"></i>
            </a>
        </nav>
        <hr class="header_line">
    </header>


    <div id="fullpage" style="width: 100%; display: block;">
        <div class='quick'>
            <ul class="quickInUl"></ul>
        </div>
        <div class="fullsection full1" pageNum="1"><span><img src="./이미지/Untitled-1 copy.jpg" alt=""></span></div>
        <div class="fullsection full2" pageNum="2"
            style="background-image: url(./이미지/introimg3.jpg); background-size: 100%;"><span>
                <h1 class="intro-con2"><br>모든것은 작은것에 부터 시작됩니다</h1>
            </span></div>
        <div class="fullsection full3" pageNum="3" style="background-image: url(./이미지/introimg1.jpg);"><span>
                <h2 style="font-size: 35px;"><br><br>Lorem Ipsum is simply dummy text of the printing and typesetting
                    industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                    unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived
                    not only five centuries, but also the leap into electronic typesetting, remaining essentially
                    unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem
                    Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including
                    versions of Lorem Ipsum.</h2>
            </span></div>
        <div class="fullsection full4" pageNum="4"
            style="background-image: url(./이미지/introimg2.jpg); background-size: 100%;"><span>Let me
                introduce our team!</span></div>
        <div class="fullsection full5" pageNum="5"><span><img class="intro-img" src="./이미지/saydabin.png" alt="">
                <div style="color: rgb(0, 0, 0); font-size: 28px;">🙋🏻‍♂️정다빈</div>
                <div style="color: gray; font-size: 18px;">예비개발자 | <a href="https://github.com/jdb1593"
                        style="text-decoration: none;">GitHub</a></div>
                <div style="color: gray; font-size: 18px;">29세</div>
                <div style="color: gray; font-size: 18px;">jdb1593@naver.com</div>
                <div style="color: gray; font-size: 18px;">인사말 : <br> System.out.prinln("Hello Everyone!")</div>
            </span>
        </div>
        <div class="fullsection full6" pageNum="6"><span><img class="intro-img" src="./이미지/sayjungsoo.png">
                <div style="color: rgb(0, 0, 0); font-size: 28px;">🙋🏻‍♂️남정수</div>
                <div style="color: gray; font-size: 18px;">예비개발자 | <a href="https://github.com/BlancPong"
                        style="text-decoration: none;">GitHub </a>
                    <a href="https://bu3820.tistory.com/" style="text-decoration: none;">Blog</a>
                </div>
                <div style="color: gray; font-size: 18px;">29세</div>
                <div style="color: gray; font-size: 18px;">bu3820@naver.com</div>
                <div style="color: gray; font-size: 18px;">인사말 : <br> ㅂㅁㅇ제ㅑ라!!</div>
            </span>

        </div>
        <div class="fullsection full7" pageNum="7"><span><img class="intro-img" src="./이미지/sayhaejin.png">
                <div style="color: rgb(0, 0, 0); font-size: 28px;">🙋🏻‍♀️배혜진</div>
                <div style="color: gray; font-size: 18px;">BACK-END | <a href="https://github.com/kuppernickel/"
                        style="text-decoration: none;">GitHub</a>
                </div>
                <div style="color: gray; font-size: 18px;">25세</div>
                <div style="color: gray; font-size: 18px;">kuppernickel@gmail.com</div>
                <div style="color: gray; font-size: 18px;">인사말 : <br> Dobby is free, Adobe is not free.</div>
            </span>

        </div>
        <div class="fullsection full8" pageNum="8"
            style="background-image: url(./이미지/introimg4.jpg); background-size: 100%;"><span>THANK YOU!</span></div>
    </div>


    <footer class="foot-container" style="display:none; z-index: 999; position: absolute; bottom: 0; width:100%;">
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
                        <li><a href="http://scanfcode.com/category/front-end-development/">소 개</a></li>
                        <li><a href="http://scanfcode.com/category/back-end-development/">커뮤니티</a></li>
                        <li><a href="http://scanfcode.com/category/java-programming-language/">자료실</a></li>
                        <li><a href="http://scanfcode.com/category/android/">Q & A</a></li>
                    </ul>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6 style="color: #5b5b5b;">Quick Links</h6>
                    <ul class="footer-links">
                        <li><a href="https://www.notion.so/SMALLPLANET-1448bed7cc404ec8b351574e2049d10a">Notion</a>
                        </li>
                        <li><a href="https://github.com/jdb1593/SmallPlanet">GitHub</a></li>

                    </ul>
                </div>
            </div>
            <hr>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <p style="color: #5b5b5b; font-size: 12px;" class="copyright-text">Copyright &copy; 2022 All
                        Rights
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
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script>$(document).ready(function () {
            fullset();
            quickClick();
        });
        function fullset() {
            var pageindex = $("#fullpage > .fullsection").size(); //fullpage 안에 섹션이(.fullsection) 몇개인지 확인하기
            for (var i = 1; i <= pageindex; i++) {
                $("#fullpage > .quick > ul").append("<li></li>");
            }
            $("#fullpage .quick ul :first-child").addClass("on"); //일단 화면이 로드 되었을때는 퀵버튼에 1번째에 불이 들어오게
            //마우스 휠 이벤트
            $(window).bind("mousewheel", function (event) {
                var page = $(".quick ul li.on");
                //alert(page.index()+1);  // 현재 on 되어있는 페이지 번호
                if ($("body").find("#fullpage:animated").length >= 1) return false;
                //마우스 휠을 위로
                if (event.originalEvent.wheelDelta >= 0) {
                    var before = page.index();
                    if (page.index() >= 0) page.prev().addClass("on").siblings(".on").removeClass("on");//퀵버튼옮기기
                    var pagelength = 0;
                    $(".foot-container").css("display", "none");
                    for (var i = 1; i < (before); i++) {
                        pagelength += $(".full" + i).height();
                    }
                    if (page.index() > 0) { //첫번째 페이지가 아닐때 (index는 0부터 시작임)
                        page = page.index() - 1;
                        $("#fullpage").animate({ "top": -pagelength + "px" }, 1000, "swing");
                    } else {
                        console.log("첫번째페이지 입니다.");
                    }
                } else { // 마우스 휠을 아래로	
                    var nextPage = parseInt(page.index() + 1); //다음페이지번호
                    var lastPageNum = parseInt($(".quick ul li").size()); //마지막 페이지번호
                    //현재페이지번호 <= (마지막 페이지 번호 - 1)
                    //이럴때 퀵버튼옮기기
                    if (page.index() <= $(".quick ul li").size() - 1) {
                        page.next().addClass("on").siblings(".on").removeClass("on");
                    }

                    if (nextPage < lastPageNum) { //마지막 페이지가 아닐때만 animate !
                        var pagelength = 0;
                        for (var i = 1; i < (nextPage + 1); i++) {
                            //총 페이지 길이 구하기
                            //ex) 현재 1번페이지에서 2번페이지로 내려갈때는 1번페이지 길이 + 2번페이지 길이가 더해짐
                            pagelength += $(".full" + i).height();
                        }
                        $("#fullpage").animate({ "top": -pagelength + "px" }, 1000, "swing");
                    }
                    else { // 현재 마지막 페이지 일때는
                        $(".foot-container").css("display", "block");
                        console.log("마지막페이지입니다.")
                    };
                }
            });
            $(window).resize(function () {
                //페이지가 100%이기때문에 브라우저가 resize 될때마다 스크롤 위치가 그대로 남아있는것을 방지하기 위해
                var resizeindex = $(".quick ul li.on").index() + 1;

                var pagelength = 0;
                for (var i = 1; i < resizeindex; i++) {
                    //총 페이지 길이 구하기
                    //ex) 현재 1번페이지에서 2번페이지로 내려갈때는 1번페이지 길이 + 2번페이지 길이가 더해짐
                    pagelength += $(".full" + i).height();
                }

                $("#fullpage").animate({ "top": -pagelength + "px" }, 0);
            });
        }
        // 사이드 퀵버튼 클릭 이동
        function quickClick() {
            $(".quick li").click(function () {
                var gnbindex = $(this).index() + 1;
                var length = 0;
                for (var i = 1; i < (gnbindex); i++) {
                    length += $(".full" + i).height();
                }
                if ($("body").find("#fullpage:animated").length >= 1) return false;
                $(this).addClass("on").siblings("li").removeClass("on");

                $("#fullpage").animate({ "top": -length + "px" }, 800, "swing");
                return false;
            });
        }
    </script>



    <script src="index-sub.js"></script>
</body>

</html>