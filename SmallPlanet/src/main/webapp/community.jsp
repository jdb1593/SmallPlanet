<%@page import="common.UtilMgr"%>
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
	String userAuthority = "";
	if(user!=null){
		uVO = uDAO.getUser(user);
		userName = uVO.getName();
		userAuthority = uVO.getAuthority();
	}
		
	String boardName = "community";
	int totalRecord=0; //전체레코드수
	int numPerPage=10; // 페이지당 레코드 수 
	int pagePerBlock=5; //블럭당 페이지수 
	  
	int totalPage=0; //전체 페이지 수
	int totalBlock=0;  //전체 블럭수 
	
	int nowPage=1; // 현재페이지
	int nowBlock=1;  //현재블럭
	
	int start = 0;
	int end = 10;
	int listSize = 0;
	Vector<BoardVO> vlist = null;
	
	String keyWord = "", keyField = "", keySub = "";
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("keySub") != null) {
		keySub = request.getParameter("keySub");
	}
	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
			keySub = "";
		}
	}
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	 
	totalRecord = bDAO.getTotalBoard(boardName,keyField,keySub, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //전체페이지수
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //현재블럭 계산
	  
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //전체블럭계산
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
	    function pageing(page) {
			document.readFrm.nowPage.value = page;
			document.readFrm.action="";
			document.readFrm.submit();
		}
		
		function block(value){
			 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
			 document.readFrm.submit();
		} 
		
        function read(boardName,seq){
            document.readFrm.seq.value=seq;
            document.readFrm.action="view_post.jsp";
            document.readFrm.submit();
        }
        function check() {
	   	     if (document.searchFrm.keyWord.value == ""
	   	    		 && document.searchFrm.keySub.value == "") {
	   			alert("검색어를 입력하세요.");
	   			document.searchFrm.keyWord.focus();
	   			return;
	   	     }
		   	 document.searchFrm.submit();
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
	                vlist = bDAO.getBoardList(boardName,keyField,keySub,keyWord, start, end);
	                listSize = vlist.size();
	                for(int i=0;i<numPerPage;i++){
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
	                    String writerName = uVO.getName()==null? "탈퇴회원":uVO.getName();
	                    String w_authority = uVO.getAuthority();
	            %>
                <tr class="list-under-line">
                    <td><%=seq %></td>
                    <td><a href="javascript:read('<%=boardName %>','<%=seq %>')">
                    	<%if(seq!=ref){ %>
                        <span class="" width: 30px; height: 30px; display:
                            inline-block;"><svg style="color:blue; "
                                xmlns="http://www.w3.org/2000/svg" width="15"
                                height="15" fill="currentColor"
                                class="bi bi-arrow-return-right"
                                viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z" />
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
        
		<form  name="searchFrm"  method="get" action="community.jsp">
	        <div style="display: flex; position: relative; top: 120px; right: -46px;">
	            <select name="keySub" id="" style="margin-right: 10px; border-radius: 10px; border: 1px solid #5180d8;">
	                <option value="" <%=UtilMgr.boardSelected(keySub, "") %>>모든 카테고리</option>
	                <option value="공지사항" <%=UtilMgr.boardSelected(keySub, "공지사항") %>>공지사항</option>
	                <option value="일상" <%=UtilMgr.boardSelected(keySub, "일상") %>>일상</option>
	                <option value="도움" <%=UtilMgr.boardSelected(keySub, "도움") %>>도움</option>
	            </select>
	            <select name="keyField" id="" style="margin-right: 100px; border-radius: 10px; border: 1px solid #5180d8;">
	                <option value="content" <%=UtilMgr.boardSelected(keyField, "content") %>>내용</option>
	                <option value="title" <%=UtilMgr.boardSelected(keyField, "title") %>>제목</option>
	                <option value="writer" <%=UtilMgr.boardSelected(keyField, "writer") %>>작성자</option>
	            </select>          
	            <!-- 검색창 -->  
	            <div class="search_mode">
	                <div class="search-box">
	                    <!-- <input type="text" name="keyWord" onkeyup="javascript:check()"> -->
	                    <input type="text" name="keyWord" value="<%=keyWord%>">
	   					<input type="hidden" name="nowPage" value="1">
	                    <span></span>
	   					<input type="button" value="search" onclick="javascript:check()">
	   					<%=totalRecord%>건의 게시물
	                </div>
	            </div>
	        </div>
        </form>
        
        <!-- 게시글 읽을때 필요한 정보값을 넘겨주기 위한 폼 -->
        <form name="readFrm" method="get">
            <input type="hidden" name="seq">
            <input type="hidden" name="boardName" value="<%=boardName %>" readonly>
            <input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="keyField" value="<%=keyField%>"> 
			<input type="hidden" name="keySub" value="<%=keySub%>"> 
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
        </form>
        <!-- 게시글 검색 값 폼 -->
        <form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true"> 
			<input type="hidden" name="nowPage" value="1">
		</form>
        
        <div class="location">
            <!-- <a class="button" style="float: left;">PREV</a> -->
        <%
		  int pageStart = (nowBlock -1)*pagePerBlock + 1 ; //하단 페이지 시작번호
		  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
		  //하단 페이지 끝번호
		  if(totalPage !=0){
		  	if (nowBlock > 1) {
		%>
	  		<a class="button" href="javascript:block('<%=nowBlock-1%>')" style="float: left;">PREV</a>
			<%}//if%>
			
	  		<%
	  			for ( ; pageStart < pageEnd; pageStart++){
	  		%>
		     	<a href="javascript:pageing('<%=pageStart %>')"
		     		style="float: left; padding: 5px 30px 0px 30px;"> 
			 	<%if(pageStart==nowPage) {%><font color="blue"> <%}%>
				<%=pageStart %>
		 		<%if(pageStart==nowPage) {%></font> <%}%></a>
			<%}//for%>
			
			<%if (totalBlock > nowBlock ) {%>
			<a class="button" href="javascript:block('<%=nowBlock+1%>')" style="float: left;">NEXT</a>
			<%}//if%>  
		<%}%>
	   
            <!-- <a href="" style="float: left; padding: 5px 30px 0px 30px;">1</a> -->
            <!-- <a class="button"style="float: left;">NEXT</a> -->
        </div>
        <a href="post.jsp?boardName=<%=boardName %>&nowPage=<%=nowPage %>&keyField=<%=keyField %>&keySub=<%=keySub %>&keyWord=<%=keyWord %>" 
        	class="button list-write">Write</a>
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
    <script src="./script/community_list.js"></script>
    
</body>

</html>