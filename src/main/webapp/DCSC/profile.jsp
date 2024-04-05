<%@page import="com.board.LoginDTO"%>
<%@page import="com.board.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String name = (String) session.getAttribute("NAME");
    String grade = (String) session.getAttribute("GRADE");
    String email = (String) session.getAttribute("EMAIL");
    String studentNumber = (String) session.getAttribute("STUDENTNUMBER");
    String position = (String) session.getAttribute("POSITION");
    LoginDAO dao = new LoginDAO();
    LoginDTO dto = dao.getStudentProfile(studentNumber); // 프로필 정보 조회
    
%>
<!DOCTYPE html>
<html>
<title>DCSC</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<body>
<form action="profilePro.jsp" method="post" enctype="multipart/form-data">
    <section class="vh-100" style="background-color: #f4f5f7;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-lg-6 mb-4 mb-lg-0">
                    <div class="card mb-3" style="border-radius: .5rem;">
                        <div class="row g-0">
                            <div class="col-md-4 gradient-custom text-center text-black"
                                style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                <img src="<%=dto.getImg()%>" name="img" alt="선택된 이미지가 없습니다" class="img-fluid my-5" id="preview"
                                    width="300px" height="250px" style="align-content: flex-end; margin: 20px 0px 20px 0px" />
                                <!-- 이미지 경로를 imgPath로 변경 -->

                                <h5><%= name %></h5> <br>
                                <div style="width: 200px; margin-left: 18px;">
                                      <input class="form-control form-control-sm" id="formFileLg" type="file" name="img" />
                                     
                                </div>	
                            </div>
                            
                            <div class="col-md-8">
                                <div class="card-body p-4">
                                    <h6>프로필 정보</h6>
                                    <hr class="mt-0 mb-4">
                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h6>이메일</h6>
                                            <p class="text-muted"><%= email %></p>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <h6>학번</h6>
                                            <p class="text-muted"><%=studentNumber %></p>
                                        </div>
                                    </div>
                                    <hr class="mt-0 mb-4">
                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h6>학년</h6>
                                            <p class="text-muted"><%=grade %></p>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <h6>등급</h6>
                                            <p class="text-muted"><%=position %></p>
                                        </div>
                                        <button class="btn btn-danger bg-gradient" type="submit">저장하고 나가기</button>
                                        
                                        <!-- <div class="col-6 mb-3">
                                            <h6>Most Viewed</h6>
                                            <p class="text-muted">Dolor sit amet</p>
                                        </div> -->
                                    </div>
                                    <div class="d-flex justify-content-start">
                                        <a href="#!"><i class="fab fa-facebook-f fa-lg me-3"></i></a>
                                        <a href="#!"><i class="fab fa-twitter fa-lg me-3"></i></a>
                                        <a href="#!"><i class="fab fa-instagram fa-lg"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             
        </div>
    </section>
</form>
</body>
<script>
    
</script>
</html>
