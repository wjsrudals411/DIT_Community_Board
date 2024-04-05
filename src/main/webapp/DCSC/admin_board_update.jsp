<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- 부트스트랩  -->
<style>
    @media (max-width: 800px) {

        footer {
            display: none;
        }

    }
    .member{
        margin-top: 100px;
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
                        <a class="nav-link" href="admin_board.jsp">게시글관리</a>
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

</head>
<body>

   

    <div class="container update">
        <br>
        <h2 class="text-center font-weight-bold">게시글 관리</h2>
        <hr/>
        <form action="boardUpdatePro.jsp" method="post">
            <div class="form-group">
            <label for="글번호">글번호</label>
            <input type="text" class="form-control" id="num" name="num" value="1" readonly>
          </div>
          <div class="form-group">
              <label for="SUBJECT">제목</label>
              <input type="text" class="form-control" id="SUBJECT" name="SUBJECT"  value="취업후기" readonly>
          </div>
          <div class="form-group">
          <label for="CONTENT">내용</label>
        </div>
        <textarea class="form-control col-sm-5" name="CONTENT" id="CONTENT" cols="30" rows="10"></textarea>
        <div class="form-group">
        <label for="WRITER">작성자</label>
        <input type="text" class="form-control" id="WRITER" name="WRITER" value="김신영" readonly>
      </div>
        <div class="form-group">
        <label for="stnum">학번</label>
        <input type="text" class="form-control" id="stnum" name="stnum" value="202231747" readonly>
      </div>
        <div class="form-group">
          <label for="REGDATE">날짜</label>
          <input type="date" class="form-control" id="REGDATE" name="REGDATE" value="" readonly>
        </div>
        <br>
        <div class="text-center">
                    <input type="button" value="삭제" class="btn btn-danger btn-lg btn" onclick="location.href='graduateboard.jsp'">
                    <input type="button" value="목록" class="btn btn-secondary btn-lg btn" onclick="location.href='graduateboard.jsp'">
            </div>
        </form>
    </div>
    
</body>
</html>