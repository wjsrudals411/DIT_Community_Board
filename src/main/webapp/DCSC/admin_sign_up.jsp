<%@page import="java.util.List"%>
<%@page import="com.board.LoginDAO"%>
<%@page import="com.board.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>DCSC</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/NavFooter.css">
<!-- 부트스트랩  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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

    <div class="container member">
        <h1>가입관리</h1>
        <!-- 관리자 페이지 -->
        <table class="table talbe-hover">
            <tbody>
                <tr>
                    <th>학번</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>학년</th>
                    <th>직책</th>
                    <th>가입승인</th>
                </tr>
                <% 
                // 회원가입 신청 목록을 조회하고 표시합니다.
                LoginDAO loginDAO = new LoginDAO();
                List<LoginDTO> joinRequests = loginDAO.getJoinRequests();
                for (LoginDTO joinRequest : joinRequests) {
                %>
                <tr>
                    <td><%= joinRequest.getStudentNumber() %></td>
                    <td><%= joinRequest.getName() %></td>
                    <td><%= joinRequest.getEmail() %></td>
                    <td><%= joinRequest.getGrade() %></td>
                    <td><%= joinRequest.getPosition() %></td>
                    <td>
                        <form action="approval.jsp" method="post">
                            <input type="hidden" name="studentNumber" value="<%= joinRequest.getStudentNumber() %>">
                            <button type="submit" name="action" value="approve" class="btn btn-primary">승인</button>
                            <button type="submit" name="action" value="cancel" class="btn btn-danger">취소</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</body>

</html>