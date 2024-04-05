<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.shopDao" %>
<%@page import="com.board.shopDto" %>
<%@page import="com.board.LoginDTO"%>
<%@page import="com.board.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DCSC</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/NavFooter.css">
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
		
</style>
<%
	// 함수 호출 
	shopDao dao = new shopDao();
    ArrayList<shopDto> dtos = dao.list();
%>

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

        <section class="py-5 text-center container">
            <div class="row py-lg-5">
                <div class="col-lg-6 col-md-8 mx-auto">
                    <h1 class="fw-light">
                        중고장터 관리
                    </h1>       
                </div>
            </div>
        </section>
        
 			<%
			int cardCount = 0; // 한 줄에 있는 카드 수를 추적하기 위한 변수
			
			for (shopDto dto : dtos) {
			    if (cardCount == 0) {
			%>
			<div class="album py-5 bg-light"> <!-- 한 줄에 대한 영역 시작 -->
			    <div class="container">
			        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"> <!-- 카드들이 들어갈 열 생성 -->
			    <% } %>
			
			    <div class="col">
			        <div class="card shadow-sm">
            			<img src="<%= dto.getimg() %>" class="img-thumbnail" style="max-width: 400px; max-height: 400px;">
			            <div class="card-body">
			            		<p class="fw-bold">작성자 | <%=dto.getname() %></p>
			                <h4><%= dto.gettitle() %></h4>
			                <br>
			                <div class="d-flex justify-content-between align-items-center">
			                    <div class="btn-group">
			                        <button type="button" class="btn btn-sm btn-outline-secondary">
			                            <a href="admin_shopInfo.jsp?num=<%=dto.getnum()%>">보기</a> <!-- 링크를 포함한 버튼 -->
			                        </button>
			                    </div>
			                    <div class="text-end">
			                        <span class="card-text fw-bold m-1"><%= dto.getpay() %>원</span> <br>
                                    <span class="text-muted"><%= dto.getupload_date() %></span> <!-- 업로드 날짜 표시 -->
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			
			<%
			    cardCount++;
			    if (cardCount == 3) {
			        cardCount = 0; // 다음 줄을 위해 카드 수 초기화
			%>
			        </div> <!-- 열 닫기 -->
			    </div>
			</div> <!-- 한 줄에 대한 영역 닫기 -->
			<%
			    }
			}
			
			// 남은 닫지 않은 div 태그 닫기
			if (cardCount > 0) {
			%>
			    </div>
			</div>
			<%
			}
			%>	
    </main>

</body>

</html>