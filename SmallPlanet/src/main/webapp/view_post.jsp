<%@page import="boardPack.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="userPack.UserVO" %>
<jsp:useBean id="bDAO" class="boardPack.BoardDAO" />
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

	int seq = Integer.parseInt(request.getParameter("seq"));
	String boardName = request.getParameter("boardName");
	BoardVO bVO = bDAO.getBoard(boardName, seq);
	String title = bVO.getTitle();
	String writer = bVO.getWriter();
	String subject = bVO.getSubject();
	String content = bVO.getContent();
	int ref = bVO.getRef();
	String fileName = bVO.getFileName();
	int fileSize = bVO.getFileSize();
	String uploadDate = bVO.getUploadDate();
	String updateDate = bVO.getUpdateDate();
	int cnt = bVO.getCnt();
	session.setAttribute("board", bVO);//게시물을 세션에 저장
	
	int listSize = 0;
	Vector<BoardVO> vlist = null;
	
	uVO = uDAO.getUser(writer);
    String writerName = uVO.getName();
    String authority = uVO.getAuthority();
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
            <!-- 말머리 -->
            <div class="notice_category"><b><%=subject %></b></div>
            <div class="notice_title">
                <!-- 제목 -->
                <h2><%=title %></h2>        
                <!-- 조회수 -->
                <p style="font-size: 12px;">조회수 <%=cnt %></p>
            </div>
            
            <%if(writer.equals(user) || userAuthority.equals("admin")){ %>
            <div class="button-group" style="position: relative; top: -53px; left: 643px;">
                <a href="delete_post.jsp?boardName=<%=boardName%>&seq=<%=seq%>">삭제</a>
                <a href="post.jsp?boardName=<%=boardName%>&seq=<%=seq%>">수정</a>
            </div>
            <%} %>
            
            <div class="member_info" style="display: flex;">
                <div><a href=""><img style="margin: 0px 10px;" class="rounded-circle"
                            src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></a></div>
                <div style="display:flex; ">
                    <div style="display: block; padding-top: 5px;">
                        <!-- 작성자 -->
                        <div class="member_name"><a href="" style="text-decoration: none;"><%=writerName %></a></div>
                        <!-- 작성일 -->
                        <div class="write_date">작성일 <%=uploadDate %></div>
                        <%if(updateDate!=null){ %>
                        <!-- 수정일 -->
                        <div class="write_date">수정일 <%=updateDate %></div>
                        <%} %>
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
            
            <div style="margin-left: 30px; padding-top: 30px; padding-bottom: 20px;">
                <span>좋아요수</span><button style="margin: 0px 15px;"><img src="" alt=""></button>
                <span>댓글수</span><button style="margin: 0px 15px;"><img src="" alt=""></button>
                <%if(boardName.equals("qnaBoard")){
                	if(userAuthority.equals("admin")){ %>
                <a href="post.jsp?boardName=<%=boardName%>&ref=<%=ref%>">답글</a>
                	<%} %>
                <%}else{ %>
                <a href="post.jsp?boardName=<%=boardName%>&ref=<%=ref%>">답글</a>
                <%} %>
            </div>
        </div>
        <!-- 댓글 -->
        <section class=" mb-5" style="width: 50%;">
            <div class="card bg-light">
                <div class="card-body">
                <%if(user!=null){ %>
                    <!-- Comment form-->
                    <form class="mb-4" style="display: flex" method=post action="comment.jsp">
                    	<input type="hidden" name="board" value="<%=boardName%>">
                    	<input type="hidden" name="ref" value="<%=ref%>">
                    	<input type="hidden" name="writer" value="<%=user%>">
                        <!-- 댓글 쓰는 공간 -->
                        <textarea name="content" class="form-control" rows="2" placeholder="댓글을 입력해주세요" required></textarea>                        
                        <input type="submit" value="댓글" style="border: 0px solid gray; border-radius: 10px; background-color: #5180d8; color: white; margin-left: 5px;"><br/>
                    </form>
                <%} %>

                    <%
	                    vlist = bDAO.getCommentList(boardName, ref);
		                listSize = vlist.size();
                    	for(int i=0;i<listSize;i++){ 
    	                    BoardVO vo = vlist.get(i);
    	                    int cmt_seq = vo.getSeq();
    	                    String cmt_writer = vo.getWriter();
    	                    String cmt_content = vo.getContent();
    	                    String cmt_uploadDate = vo.getUploadDate();
    	                    String cmt_updateDate = vo.getUpdateDate();
    	                    
    	                    uVO = uDAO.getUser(cmt_writer);
    	                    String cmt_writerName = uVO.getName();
                    %>
                    <!-- Single comment-->
                    <div class="d-flex">
                        <div class="flex-shrink-0"><img class="rounded-circle"
                                src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
                        <div class="ms-3">
                            <div class="fw-bold"><%=cmt_writerName %></div>
                            <%=cmt_content %>
                            <p><%=cmt_uploadDate %></p>
                        </div>
                    </div>
                    <%} %>
                </div>
            </div>
        </section>
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
                        <li><a href="http://scanfcode.com/category/front-end-development/">menu1</a></li>
                        <li><a href="http://scanfcode.com/category/back-end-development/">menu2</a></li>
                        <li><a href="http://scanfcode.com/category/java-programming-language/">menu3</a></li>
                        <li><a href="http://scanfcode.com/category/android/">menu4</a></li>
                    </ul>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6 style="color: #5b5b5b;">Quick Links</h6>
                    <ul class="footer-links">
                        <li><a href="http://scanfcode.com/about/">Notion</a></li>
                        <li><a href="http://scanfcode.com/contact/">GitHub</a></li>
                    </ul>
                </div>
            </div>
            <hr>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <p style="color: #5b5b5b;" class="copyright-text">Copyright &copy; 2022 All Rights Reserved by
                        <a href="노션 주소">Small Planet</a>.
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
    <script src="script/community_list.js"></script>

</body>

</html>