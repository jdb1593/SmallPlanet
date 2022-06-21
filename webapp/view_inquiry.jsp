<%@page import="boardPack.InquiryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="userPack.UserVO" %>
<jsp:useBean id="iDAO" class="boardPack.InquiryDAO" />
<jsp:useBean id="uDAO" class="userPack.UserDAO" />
<%
	request.setCharacterEncoding("utf-8");
	String user = (String)session.getAttribute("user");
	UserVO uVO = new UserVO();
	String userName = "";
	String userAuthority = "";
	if(user!=null){
		uVO = uDAO.getUser(user);
		userName = uVO.getName();
		userAuthority = uVO.getAuthority();
	}
	
	if(!userAuthority.equals("admin")){
%>
	<script>
		alert("관리자 전용 페이지입니다.");
		location.href="index.jsp";
	</script>
<%
	}

	int seq = Integer.parseInt(request.getParameter("seq"));
	InquiryVO iVO = iDAO.getInquiry(seq);
	String title = iVO.getTitle();
	String writer = iVO.getWriter();
	String email = iVO.getEmail();
	String content = iVO.getContent();
	String fileName = iVO.getFileName();
	int fileSize = iVO.getFileSize();
	String uploadDate = iVO.getUploadDate();
	String phoneNumber = iVO.getPhoneNumber();
	session.setAttribute("inquiry", iVO);//게시물을 세션에 저장
	
	int listSize = 0;
	Vector<InquiryVO> vlist = null;
%>
<!DOCTYPE html>
<html lang="KO">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index-sub.css">
    <link rel="stylesheet" href="css/community_list.css">
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
        .notice_category {
            padding-left: 68px;
            padding-bottom: 10px;
        }

        .notice_title {
            padding-left: 65px;
        }

        .member_wrap {
            width: 50%;
            display: flex;
            flex-direction: column;
            align-items: left;
            margin-bottom: 30px;
            margin-top: 20px;
        }

        .write_date {
            font-size: 11px;
        }
        
        .button-group a {
            color: white;
            background-color: #5180d8;
            text-decoration: none;
            border: 2px solid #5180d8;
            border-radius: 10px;
            padding: 2px;
        }
    </style>
</head>

<body>
    <header style="z-index: 1;">
        <!-- Logo -->
        <nav class="navbar">
            <div class="navbar_logo">
                <a style="color: #5180d8; border-bottom: 2px solid transparent;" href="index-sub.html"
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
                    </div>
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
        <!-- 회원정보 -->
        <div class="member_wrap">
        	<div class="notice_title">
                <!-- 제목 -->
                <h2><%=title %></h2>        
            </div>
            
            <div class="button-group" style="position: relative; top: -53px; left: 643px;">
                <a href="delete_post.jsp?boardName=inquiryBoard&seq=<%=seq%>">삭제</a>
            </div>
            
            <div class="member_info" style="display: flex;">
                <div><a href=""><img style="margin: 0px 10px;" class="rounded-circle"
                            src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></a></div>
                <div style="display:flex; ">
                    <div style="display: block; padding-top: 5px;">
                        <!-- 작성자 -->
                        <div class="member_name"><a href="" style="text-decoration: none;"><%=writer %></a></div>
                        <div class=""><%=email %></div>
                        <div class=""><%=phoneNumber %></div>
                        <!-- 작성일 -->
                        <div class="write_date">작성일 <%=uploadDate %></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 본문 -->
        <div style="justify-content: center; width: 50%;">
            <div style="width: 90%; text-align: left; margin-left: 30px; padding: 30px 0px;">
                <!-- 게시글 내용 -->
                <p><%=content %></p>
            </div>
            <%if(fileName!=null){ %>
            <div style="border-bottom: 1px solid #5180d8; width: auto ;">
                <!-- 첨부파일 이름 -->
                <span>첨부파일 <%=fileName %>(<%=fileSize %>byte)</span>
            </div>
            <%} %>
            
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
    <script src="script/community_list.js"></script>

</body>

</html>