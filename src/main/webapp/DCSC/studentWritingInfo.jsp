<%@page import="com.board.commentDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.board.commentDAO"%>
<%@page import="com.board.Dao" %>
<%@page import="com.board.Dto" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>
    
<%
   // 함수 호출 
   request.setCharacterEncoding("utf-8");
String name = (String) session.getAttribute("NAME");
request.setCharacterEncoding("utf-8");
String numStr = request.getParameter("num");
int num = Integer.parseInt(numStr);
Dao dao = new Dao();
Dto dto = dao.getOne(num);
commentDAO dao2 = new commentDAO();
// 해당 게시글의 댓글 목록을 가져옴
	List<commentDTO> commentList = dao2.selectComments(num);
	int commentCount = dao2.getCommentCount(num);
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

   footer {
   	  background-color: white;
   }
   
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
   
   .user-topik {
	  	background-color:#F0F6FA;
	  	padding: 6px;
	    border-radius: 10px;
	  	color: #8AB9E8;
	  	margin-rigth: 5px;
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
    .icon-group {
        display: flex;
        align-items: center;
    }

    .icon-group button {
        margin-right: 10px;
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
        <h3 class="fw-normal text-start">학생게시판</h3>
       <div class="second_container">
          <h5><%=dto.gettitle() %></h5>
	          <div class="info_text">
	             <span>
	                <span><%=dto.getwriter() %></span>
	                <span> | </span>
	 
	                <span><%=dto.getdate() %></span>
	             </span>
	             <span class="icon-group">
    <% if (name.equals(dto.getwriter())) { %>
        <!-- 수정 -->
        <form action="studentUpdate.jsp">
            <input type="hidden" name="num" value="<%=dto.getnum()%>">
            <input type="hidden" name="name" value="<%=name%>">
            <button type="button" onclick="updatePost()"><i class="bi bi-pencil-square"></i></button>
        </form>
        <!-- 삭제 -->
        <form action="studentDelete.jsp">
            <input type="hidden" name="num" value="<%=dto.getnum()%>">
            <input type="hidden" name="name" value="<%=name%>">
            <button type="button" onclick="deletePost()"><i class="bi bi-trash3-fill"></i></button>
        </form>
    <% } %>
    <span class="user-topik"><%=dto.gettopik() %></span>
    <i class="bi bi-chat"></i>
    <span><%=commentCount %></span>
</span>
	          </div>
          </div>
          <hr>
            <div class="text_container">
               <img src="<%=dto.getimg() %>" class="rounded img-fluid d-block">

               <p class="text-muted"><%=dto.getcontent() %></p>     
               
           </div>
           <div class="text_container">
       
            <!-- 댓글 -->
            <div class="hr">
                <%-- 댓글 목록 출력 --%>
                <% for (commentDTO comment : commentList) { %>
    <div>
        <h6>
            <img src="<%=comment.getuserimg() %>" alt="Avatar" class="img-fluid my-2" style="width: 30px; margin: 0px; border-radius: 50%;" />
            <%= comment.getWriter() %>
        </h6>
        <span><%= comment.getContent() %></span>
        <%-- 댓글 작성자와 세션 이름이 일치하는 경우 수정 및 삭제 버튼을 표시합니다 --%>
        <% if (comment.getWriter().equals(name)) { %>
            <div class="icon-group">
            
                <button type="button" onclick="editComment('<%= comment.getComment_id() %>')"><i class="bi bi-pencil-square"></i></button>
               <button type="button" onclick="deleteComment('<%= comment.getComment_id() %>')"><i class="bi bi-trash3-fill"></i></button>
               
            </div>
        <% } %>
    </div>
    <hr>
<% } %>

                
                <!-- 댓글 작성 -->
                <form action="comment.jsp?num=<%=dto.getnum()%>">
                    <input type="hidden" name="num" value="<%=dto.getnum()%>">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="댓글을 작성해주세요." name="comment">
                        <button class="btn btn-outline-secondary" type="submit" id="button-addon2">작성</button>
                    </div>
                </form>

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
    <script>
    function deletePost() {
        var confirmation = confirm("게시글을 삭제하시겠습니까?");
        
        if (confirmation) {
            window.location.href = "studentDelete.jsp?num=<%=dto.getnum()%>";
        }
    }
    
    function updatePost() {
        var confirmation = confirm("게시글을 수정하시겠습니까??");
        
        if (confirmation) {
            window.location.href = "studentUpdate.jsp?num=<%=dto.getnum()%>";
        }
    }
    
    function editComment(commentId) {
        var confirmation = confirm("댓글을 수정하시겠습니까??");

        if (confirmation) {
            window.location.href = "commentUpdate.jsp?name=<%=name%>&comment_id=" + commentId;
        }
    }

    
    function deleteComment(commentId) {
        var confirmation = confirm("댓글을 삭제하시겠습니까?");
        if (confirmation) {
            window.location.href = "commentDelete.jsp?name=<%=name%>&comment_id=" + commentId;
        }
    }

    
    
</script>
</body>

</html>