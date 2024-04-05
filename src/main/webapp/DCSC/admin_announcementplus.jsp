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
	             <span>
                	<button><a class="dropdown-item" href="admin_announcementplusPro.jsp?num=<%=num%>"><i class="bi bi-trash3-fill"></a></i></button>
               </span>
	          </div>
          </div>
          <hr>
            <div class="text_container">
               <img src="<%=dto.getimg() %>" class="rounded img-fluid d-block">

               <p class="text-muted"><%=dto.getcontent() %></p>     
               
           </div>
        	
        	
	
</body>

</html>