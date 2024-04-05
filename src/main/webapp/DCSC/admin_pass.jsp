<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Document</title>

<style>
    .DSCS::first-letter {
        color: #ff0000;
    }
    .DSCS{
      text-align: center;
    }
    .DSC{
      text-align: center;
    }

    .btn {
      margin-bottom: 20px;
    }
</style>
    
    </head>
    <body>
        <div class="container col-xl-10 col-xxl-8 px-4 py-5">
            <div class="row align-items-center g-lg-5 py-5">
              <div class="col-lg-7 text-center text-lg-start">
                <h1 class="display-4 fw-bold lh-1 mb-3 DSCS">DCSC</h1>
                <h1 class="display-6 fw-bold lh-1 mb-3 DSC">관리자 로그인</h1>

              </div>
              <div class="col-md-10 mx-auto col-lg-5">
                <form class="p-4 p-md-5 border rounded-3 bg-light" action="admin_passPro.jsp" method="get">
                  
                  <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="pass" name="pass">
                    <label for="pass">비밀번호</label>
                  </div>
                  <div class="d-grid gap-2 d-md-block btn" role="group" aria-label="Basic example">

                  <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
                  <button class="w-100 btn btn-lg btn-danger" type="button" onclick="location.href='main.jsp'">나가기</button>
                </div>
                  <hr class="my-4">
                  <small class="text-muted">DSCS 관리자만 로그인할 수 있습니다.</small>
                </form>
              </div>
            </div>
          </div>
    </body>
  </html>
