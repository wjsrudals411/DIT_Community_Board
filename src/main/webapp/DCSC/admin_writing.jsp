<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
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

<div class="container">
    <div class="container mx-3 p-5 ">
        <h1 class="fw-normal text-start fs-2">공지사항 작성</h1>
    </div>
    <form action="admin_writingPro.jsp" method="post" enctype="multipart/form-data">
    
        <div class="mb-3">
            <label for="name" class="form-label">관리자이름</label>
            <input class="form-control" id="name" name="name" placeholder="이름을 입력하세요.">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">제목</label>
            <input class="form-control" id="exampleFormControlInput1" name="title" placeholder="제목을 입력하세요.">
        </div>
        <div>
            <label for="formFileLg" class="form-label">첨부파일</label>
            <input class="form-control form-control-lg" id="formFileLg" type="file" name="img"  onchange="readURL(this);"/>
            <img id="preview" src="#" width="300" height="250" alt="선택된 이미지가 없습니다"
                 style="align-content: flex-end; margin: 20px 0px 20px 0px;">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">본문</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="20"
                      name="content" placeholder="내용을 입력하세요."></textarea>
        </div>
        <div class="text-end">
            <button type="submit" class="btn btn-primary"><i class="bi bi-pencil-fill"></i>등록</button>
            <button type="button" class="btn btn-light" onclick="location.href='free.jsp'">취소</button>
        </div>
    </form>
</div>


</body>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

</html>