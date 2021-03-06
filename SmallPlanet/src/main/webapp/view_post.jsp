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
	
	String nowPage = request.getParameter("nowPage");
    String keyField = request.getParameter("keyField");
    String keySub = request.getParameter("keySub");
    String keyWord = request.getParameter("keyWord");
	int seq = Integer.parseInt(request.getParameter("seq"));
	String boardName = request.getParameter("boardName");
	bDAO.cntUp(boardName, seq);
	BoardVO bVO = bDAO.getBoard(boardName, seq);
	String title = bVO.getTitle();
	
	if(title==null){
	%>
		<script>
			alert("존재하지 않는 게시글입니다.");
			history.back();
		</script>
	<%	
	}else{
		
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
	String writerName = uVO.getName()==null? "탈퇴회원":uVO.getName();
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
    <script>
	    function list(){
		    document.listFrm.submit();
		 } 
	    function down(fileName){
			 document.downFrm.fileName.value=fileName;
			 document.downFrm.submit();
		}
    </script>
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
                </a>       
                <a href="logout.jsp" style="margin-left: 10px;">로그아웃</a>
                <%if(userAuthority.equals("admin")){ %>
                <div class='btn_container'>
                    <a href="admin-list.jsp" class='pulse-button'>ADMIN</a>
                </div>
                <%} %>
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
            <%if(fileName!=null && user!=null){ %>
            <div style="border-bottom: 1px solid #5180d8; width: auto ;">
                <!-- 첨부파일 이름 -->
                <span>첨부파일 <a href="javascript:down('<%=fileName%>')"><%=fileName %>(<%=fileSize %>KB)</a></span>
            </div>
            <%} %>
            <form name="downFrm" action="download.jsp" method="post">
				<input type="hidden" name="fileName">
			</form>
			
			<form name="listFrm" method="get" action="<%=boardName%>.jsp">
				<input type="hidden" name="nowPage" value="<%=nowPage%>">
				<input type="hidden" name="keySub" value="<%=keySub%>">
				<%if(!(keyWord==null || keyWord.equals(""))){ %>
				<input type="hidden" name="keyField" value="<%=keyField%>">
				<input type="hidden" name="keyWord" value="<%=keyWord%>">
				<%}%>
			</form>
            
            <div style="margin-left: 30px; padding-top: 30px; padding-bottom: 20px;">
            <%
	            vlist = bDAO.getCommentList(boardName, seq);
	            listSize = vlist.size(); 
            %>
                <span>댓글수 <%=listSize %></span>
                <%
	                if(ref==seq){
		                if(boardName.equals("qnaBoard")){
		                	if(userAuthority.equals("admin")){ %>
		                <a href="post.jsp?boardName=<%=boardName%>&ref=<%=ref%>&nowPage=<%=nowPage %>&keyField=<%=keyField %>&keySub=<%=keySub %>&keyWord=<%=keyWord %>">답글</a>
		                	<%} %>
		                <%}else if(boardName.equals("dataBoard")){%>
		                	<span></span>
		                <%}else{ %>
		                <a href="post.jsp?boardName=<%=boardName%>&ref=<%=ref%>&nowPage=<%=nowPage %>&keyField=<%=keyField %>&keySub=<%=keySub %>&keyWord=<%=keyWord %>">답글</a>
		                <%
		                }
	                } 
                %>
                <a href="javascript:list()" >목록으로</a>
            </div>
        </div>
        <!-- 댓글 -->
        <section class=" mb-5" style="width: 50%;">
            <div class="card bg-light">
                <div class="card-body">
                <%if(user!=null){ %>
                    <!-- Comment form-->
                    <form name="commentFrm" class="mb-4" style="display: flex" method=post action="comment.jsp">
                    	<input type="hidden" name="nowPage" value="<%=nowPage%>">
						<input type="hidden" name="keySub" value="<%=keySub%>">
						<%if(!(keyWord==null || keyWord.equals(""))){ %>
						<input type="hidden" name="keyField" value="<%=keyField%>">
						<input type="hidden" name="keyWord" value="<%=keyWord%>">
						<%}%>
                    	<input type="hidden" name="board" value="<%=boardName%>">
                    	<input type="hidden" name="seq" value="<%=seq%>">
                    	<input type="hidden" name="writer" value="<%=user%>">
                        <!-- 댓글 쓰는 공간 -->
                        <textarea name="content" class="form-control" rows="2" placeholder="댓글을 입력해주세요" required></textarea>                        
                        <input type="submit" value="댓글" style="border: 0px solid gray; border-radius: 10px; background-color: #5180d8; color: white; margin-left: 5px;"><br/>
                    </form>
                <%}else{ %>
                	<div>댓글을 작성하려면 로그인 해 주세요.</div>
                <%} %>

                    <%
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