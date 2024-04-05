<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <title>DCSC</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
    .login {
        width: 150px;
    }

    img {
        margin-bottom: 30px;
    }
    

    .box {
        width: 500px;
    }
</style>

<body>

    <div class="container-fluid p-5 bg-primary bg-gradient text-white text-center">
        <h1><span style="color:rgb(254, 68, 68)">D</span><span style="color:rgb(0, 0, 0)">IT</span> Computer Software
            Department
        </h1>
        <p>동의과학대학교 컴퓨터소프트웨어과 커뮤니티에 오신걸 환영합니다!!</p>
    </div>

    <div class="box container">
        <div class=" container">
            <div class="container">
                <img src="images/indexBanner.png" alt="" width="460px">
            </div>
            <form action="loginPro.jsp" method="get">
                <div class="mb-3">
                    <label for="studentNumber" class="form-label">학번</label>
                    <input type="text" class="form-control" id="studentNumber" placeholder="학번" name="studentNumber" maxlength="10"
                        required>
                </div>
                <div class="mb-3">
                    <label for="pwd" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pwd" required
                        maxlength="16">
                </div>
                <button type="submit" class="btn btn-primary bg-gradient login">로그인</button>
                    
                <button type="button" class="btn btn-danger bg-gradient"
                    onclick="location.href='signUp.jsp'">회원가입</button>
        </form>
    </div>
    </div>

</body>
</html>