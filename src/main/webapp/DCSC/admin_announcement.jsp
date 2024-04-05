<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.adminwritingDao" %>
<%@page import="com.board.adminwritingDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
   // 함수 호출 
   adminwritingDao dao = new adminwritingDao();
   ArrayList<adminwritingDto> dtos = dao.list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DCSC</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/NavFooter.css">
<!-- 부트스트랩  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
	  a {
			text-decoration-line: none;
			color: black;
	  }
		
	  a:hover { 
			text-decoration:none !important;
			color: black;
	  }
		
	  .user-img {
			min-height: 80px;
			min-width: 80px;
			max-height: 80px;
			max-width: 80px;
			border-radius: 10%;
	  }
	
	  .btn-custom-color {
	    background-color: #b1f4cf;
	    border-color: #b1f4cf;
	    color: #fff;
	    margin-bottom: 25px;
	  }
	  
	  .btn-custom-color:hover {
	    background-color: #b1f4cf;
	    border-color: #b1f4cf;
	  }

	  .user-topik {
	  	background-color:#F0F6FA;
	  	padding: 6px;
	    border-radius: 10px;
	  	color: #8AB9E8;
	  	margin-right: 5px;
	  }
</style>

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
            <a href="admin_sign_up.jsp"><img src="images/dit.png" alt="" class="dit-img"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="admin_sign_up.jsp">회원가입관리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin_member.jsp">회원관리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin_freeboard.jsp">자유게시판관리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin_studentboard.jsp">학생게시판관리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin_shop.jsp">장터관리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin_announcement.jsp">공지사항</a>
                    </li>
             
                    <li class="nav-item">
                        <a class="nav-link nav-job" href="main.jsp">나가기</a>
                    </li>
                </ul>
  
            </div>
        </div>
    </nav>

    <main>
        <div class="mx-5pricing-header p-5 pb-md-4 text-start"
            style="background-image: linear-gradient(to top, #9890e3 0%, #b1f4cf 100%); border-radius: 20px; margin: 35px 100px 35px 100px;">
            <h1 class=" fw-normal">공지사항</h1>
            <p class="fs-5 text-white m-lg-3">
                <strong>컴퓨터소프트웨어학과</strong>의 최신 뉴스, 이벤트 및 정보를 공유하는 공간입니다.
            </p>
        </div>
<div class="container d-flex justify-content-center">
	  <div class="row">
	    <div class="col-6">
	      <a href="admin_writing.jsp">
	        <button class="btn btn-custom-color btn-lg btn-block" style="width: 250px;">
	          <i class="bi bi-pencil-fill"></i> 작성하기
	        </button>
	      </a>
	    </div>
	  </div>
	</div>        <hr>
	
	<%
            for(adminwritingDto dto : dtos) {
  %>
			
        <ul class="container">
            <li>
            <a href="admin_announcementplus.jsp?num=<%=dto.getnum()%>">
                <div>
                    <i class="bi bi-person-circle"></i>
                    <span><%=dto.getname() %></span>
                    <span><%=dto.getdate() %></span> <br> <br>
                    <h4><%=dto.gettitle() %></h4>
                    <p class="text-muted"><%=dto.getcontent() %></p>
                    <hr>
                </div>
            </li>
        </ul>
        <% } %>
     </main>


    
        
</body>

</html>