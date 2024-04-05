<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<%
   // 함수 호출 
   request.setCharacterEncoding("utf-8");
   
   String NAME = (String) session.getAttribute("NAME");
   String studentNumber = request.getParameter("studentNumber");

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
<style>
     	.is-invalid:required {
	        border-color: #dc3545 !important;
	    }
	    
	    .is-invalid:required+.invalid-feedback {
	        display: block;
	    }
	    
        .input-form {


            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }
</style>
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
    

<div class="container">
    <div class="container mx-3 p-5 ">
        <h1 class="fw-normal text-start fs-2">기술 궁금증 해결하기</h1>
        <p class="text-muted m-lg-1">
            <b><%=NAME%></b>님 지식공유 미래 개발자들과 함께 궁금증을 해결하세요.
        </p>
    </div>
            
<form action="writingPro.jsp" method="post" enctype="multipart/form-data" class="validation-form" novalidate >
	    <div class="input-group mb-3">
	        <select name="topik" class="form-select" required>
	            <option>토픽을 선택하세요.</option>
	            <option value="#과제">과제</option>
	            <option value="#정보">정보</option>
	            <option value="#기타">기타</option>
	        </select>
	    </div>
	    <div class="mb-3">
	        <label for="exampleFormControlInput1" class="form-label">제목</label>
	        <input class="form-control" id="exampleFormControlInput1" name="title" placeholder="제목을 입력하세요" required placeholder="비밀번호를 입력해주세요." >
	    </div>
	    <div>
	        <label for="formFileLg" class="form-label">이미지 업로드</label> 
	        <input class="form-control form-control-lg" id="formFileLg" type="file" name="img" onchange="readURL(this);" required> <!-- required -->
	        <img id="preview" src="#" width="300" height="250" alt="선택된 이미지 없음"
	             style="align-content: flex-end; margin: 20px 0px 20px 0px;">
	    </div>
	    <div class="mb-3">
	        <label for="exampleFormControlTextarea1" class="form-label">내용</label>
	        <textarea class="form-control" id="exampleFormControlTextarea1" rows="20"
	                  name="content" placeholder="내용을 입력하세요." required></textarea>
	    </div>
	    <div class="text-end">
	        <button type="submit" class="btn btn-primary"><i class="bi bi-pencil-fill"></i> 작성</button>
	        <button type="button" class="btn btn-light" onclick="location.href='free.jsp'">뒤로가기</button>
	    </div>
</form>
 
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
    window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');

        Array.prototype.filter.call(forms, (form) => {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);
        });
    }, false);
</script>

</html>