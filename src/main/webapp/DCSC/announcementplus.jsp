<%@page import="com.board.adminwritingDao" %>
<%@page import="com.board.adminwritingDto" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>
    
<%
	// 함수 호출 
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	
	adminwritingDao dao = new adminwritingDao();
	adminwritingDto dto = dao.getOne(num);
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

		button {
	  background-color: #F0F6FA;
	  border: none;
	  cursor: pointer;
	  padding: 5px;
	  border-radius: 5px;
	}
	
	button i {
	  color: #3366cc;
	  font-size: 24px;
	}
	
	button i.bi-trash3-fill {
	  color: red;
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
        <h3 class="fw-normal text-start">공지사항</h3>
       <div class="second_container">
          <h5><%=dto.gettitle() %></h5>
	          <div class="info_text">
	             <span>
	                <span><%=dto.getname() %></span>
	                <span> | </span>
	 
	                <span><%=dto.getdate() %></span>
	             </span>
	          </div>
          </div>
          <hr>
            <div class="text_container">
               <img src="<%=dto.getimg() %>" class="rounded img-fluid d-block">

               <p class="text-muted"><%=dto.getcontent() %></p>     
               
           </div>
        	
        	
	<hr>
        <footer class="py-3 my-4">
        <img src="images/dit.png" alt="" class="dit-img">
        <ul>
            <li class="nav-item">
                <a class="nav-link" href="https://github.com/kimsinyoung2" target="_blank"> <i class="bi bi-github"></i>
                    김신영</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://github.com/K1mHyoM1n" target="_blank"> <i class="bi bi-github"></i>
                    김효민</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://github.com/SeungJin051" target="_blank"> <i class="bi bi-github"></i>
                    임승진</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://github.com/wjsrudals411" target="_blank"> <i class="bi bi-github"></i>
                    전경민</a>
            </li>
        </ul>
        <br>
        <br>
        <br>
        <div class="footer-info">
            <p class="text-center text-muted">주소 | (47230) 부산광역시 부산진구 양지로 54
                TEL : 051-852-0011~3 FAX : 051-860-3270</p>
            <p class="text-center text-muted">&copy; 2023 DONG-EUI INSTITUTE OF TECHNOLOGY. ALL RIGHTS RESERVED.
            </p>
        </div>
    </footer>
</body>

</html>