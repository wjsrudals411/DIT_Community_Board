<%@page import="java.util.List"%>
<%@page import="com.board.commentDAO"%>
<%@page import="com.board.commentDTO"%>
<%@page import="com.board.Dao" %>
<%@page import="com.board.Dto" %>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>

<%
    String name = (String) session.getAttribute("NAME");
    request.setCharacterEncoding("utf-8");
    String numStr = request.getParameter("num");
    int num = Integer.parseInt(numStr);
    Dao dao = new Dao();
    Dto dto = dao.getOne(num);
    commentDAO dao2 = new commentDAO();
    
    // 해당 게시글의 댓글 목록을 가져옴
    List<commentDTO> commentList = dao2.selectComments(num);
    int commentCount = dao2.getCommentCount(num);
%>

<!DOCTYPE html>
<html>
<head>
<title>DCSC</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/NavFooter.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    img {
        width: 500px;
        margin-bottom: 5px;
    }
    
    .hr {
        border-top: 3px solid #29367c;
        padding: 10px;
        background-color: rgb(159, 159, 159, 0.1);
        
    }
    
    .fw-normal {
        border-bottom: 3px solid #29367c;
        color: #A4C7FC;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }
    
    .frist_container {
        width: 65%;
        margin-left: 30%;
        margin-top: 30px;
    }
    
    .info_text {
        display: flex;
        justify-content: space-between;    
    }
    
</style>
</head>
<script>
    function w3_open() {
        document.getElementById("main").style.marginLeft = "25%";
        document.getElementById("mySidebar").style.width = "25%";
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("openNav").style.display = 'none';
    }
    function w3_close() {
        document.getElementById("main").style.marginLeft = "0%";
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("openNav").style.display = "inline-block";
    }
</script>

<body>
         <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a href="main.jsp"><img src="images/dit.png" alt="" class="dit-img"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="free.jsp">자유게시판</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="studentBoard.jsp">학생게시판</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="shop.jsp">중고장터</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="announcement.jsp">공지사항</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link nav-job" href="job.jsp">|&nbsp; &nbsp; &nbsp; 채용공고 &nbsp; &nbsp; &nbsp;|</a>
                    </li>
                </ul>
               
                <ul class="navbar-nav mb-lg-1 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            정보
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="profile.jsp">프로필</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="logout.jsp">로그아웃</a></li>
                            <li><a class="dropdown-item" href="admin_pass.jsp">관리자메뉴</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mx-auto frist_container">
        <h3 class="fw-normal text-start">자유게시판</h3>
        <div class="second_container">
            <h5><%=dto.gettitle() %></h5>
            <div class="info_text">
                <span>
                    <span><%= dto.getwriter() %></span>
                    <span> | </span>	
                    <span><%=dto.getdate() %></span>
                </span>
              
                
               
            </div>
            <hr>
            <div class="text_container">
                <form action="studentUpdatePro.jsp" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="num" value="<%=dto.getnum()%>">
                	
                	
                    <div class="mb-3">
                        <label for="title" class="form-label">토픽</label>
                        <input type="text" class="form-control" id="title" name="topik" value="<%=dto.gettopik()%>">
                    </div>
                    
                    
                    <input type="hidden" name="num" value="<%=dto.getnum()%>">
                    <div class="mb-3">
                        <label for="title" class="form-label">제목</label>
                        <input type="text" class="form-control" id="title" name="title" value="<%=dto.gettitle()%>">
                    </div>
                    <div class="mb-3">
                        <label for="content" class="form-label">내용</label>
                        <textarea class="form-control" id="content" name="content" rows="5"><%=dto.getcontent()%></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="image" class="form-label">이미지 URL</label>
                        <input class="form-control form-control-lg" id="formFileLg" type="file" name="img" value="<%=dto.getimg()%>" >                      
                        
                    </div>
                    <button type="submit" class="btn btn-primary">수정하기</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
