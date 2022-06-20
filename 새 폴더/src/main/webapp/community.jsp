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
		
	String boardName = "community";
	int start = 0;
	int end = 10;
	int listSize = 0;
	Vector<BoardVO> vlist = null;
%>
<!DOCTYPE html>
<jsp lang="KO">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/index-sub.css">
    <link rel="stylesheet" href="./css/community_list.css">
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
    <!-- 게시글 제목 클릭시 해당 게시물로 이동 -->
    <script>
        function read(boardName,seq){
            document.readFrm.seq.value=seq;
            document.readFrm.action="view_post.jsp";
            document.readFrm.submit();
        }
    </script>
</head>

<body>
    <header style="z-index: 1;">
        <!-- Logo -->
        <nav class="navbar">
            <div class="navbar_logo">
                <a style="color: #5180d8; border-bottom: 2px solid transparent;" href="index.jsp" class="navbar_logotext" >SMALLPLANET</a>
            </div>

            <!-- nav 메뉴 -->
            <div class="menu">
                <ul class="navbar_menu">
                    <li><a class="menuNum" href="introduce.jsp">소 개</a></li>
                    <li><a class="menuNum" href="community.jsp" style="border-bottom: 2px solid #5180d8; padding-bottom: 42px;" >커뮤니티</a></li>
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
    <!-- 본문 -->
    <main>        
        <h1>자유게시판</h1>
        <form action="get" action="" style="padding-top:50px;"></form>
        <table class="list-form">
            
            <thead>
                <tr>
                    <th>No.</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회</th>                
                </tr>
            </thead>
            <tbody>
	            <%
	                vlist = bDAO.getBoardList(boardName, start, end);
	                listSize = vlist.size();
	                for(int i=0;i<10;i++){
	                    if(i==listSize) break;
	                    BoardVO vo = vlist.get(i);
	                    int seq = vo.getSeq();
	                    int ref = vo.getRef();
	                    String subject = vo.getSubject();
	                    String title = vo.getTitle();
	                    String writer = vo.getWriter();
	                    String uploadDate = vo.getUploadDate();
	                    int cnt = vo.getCnt();
	                    
	                    uVO = uDAO.getUser(writer);
	                    String writerName = uVO.getName();
	                    String w_authority = uVO.getAuthority();
	            %>
                <tr class="list-under-line">
                    <td><%=seq %></td>
                    <td style="text-align:left;"><a style="color:black; text-decoration:none;" href="javascript:read('<%=boardName %>','<%=seq %>')">
                    	<%if(seq!=ref){ %>
                    	<span class="" width: 30px; height: 30px; display: inline-block;"><svg  style="color:blue; "xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
</svg></span>
                    	<%} %>
                    	[<%=subject %>]<%=title %></a></td>
                    <td><%=writerName %></td>
                    <td><%=uploadDate %></td>
                    <td><%=cnt %></td>
                </tr>      
                <%	} %>
            </tbody>
        </table>
        <!-- 게시글 읽을때 필요한 정보값을 넘겨주기 위한 폼 -->
        <form name="readFrm" method="get">
            <input type="hidden" name="seq">
            <input type="hidden" name="boardName" value="<%=boardName %>" readonly>
        </form>

        <div style="display: flex; position: relative; top: 120px; right: -46px;">
            <select name="" id="" style="margin-right: 10px; border-radius: 10px; border: 1px solid #5180d8;">
                <option value="">카테고리</option>
            </select>
            <select name="" id="" style="margin-right: 100px; border-radius: 10px; border: 1px solid #5180d8;">
                <option value="">게시글+제목</option>
                <option value="">제목만</option>
                <option value="">글작성자</option>
            </select>          
            <!-- 검색창 -->  
            <div class="search_mode">
                <div class="search-box">
                    <input type="text" onkeyup="if(window.event.keyCode==13)" />
                    <span></span>
                </div>
            </div>
        </div>
        
        
        
        <div class="location">
            <a class="button" style="float: left;">PREV</a>
            <a href="" style="float: left; padding: 5px 30px 0px 30px;">1</a>
            <a class="button"style="float: left;">NEXT</a>
        </div>
        <a href="post.jsp?boardName=<%=boardName %>" class="button list-write">Write</a>
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
    <script src="./script/community_list.js"></script>
    
</body>

</html>