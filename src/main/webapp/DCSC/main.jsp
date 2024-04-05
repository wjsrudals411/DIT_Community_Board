<%@page import="com.board.LoginDAO" %>
<%@page import="com.board.LoginDTO" %>
<%@page import="com.board.noteDto"%>
<%@page import="com.board.noteDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
   // 함수 호출 
   request.setCharacterEncoding("utf-8");
   String name = request.getParameter("name");
   String studentNumber = request.getParameter("studentNumber");
   
   LoginDAO dao = new LoginDAO();
   LoginDTO dto = dao.getOne(name);
   
   String NAME = (String) session.getAttribute("NAME");
   String GRADE = (String) session.getAttribute("GRADE");
   
   noteDao notedao = new noteDao();
   List<noteDto> allNotes = notedao.getAll(NAME);
   
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/NavFooter.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35fd48b615e5a4b7d75de965feed2452"></script>
<!-- 부트스트랩  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- 부트스트랩  -->
<title>DCSC</title>
	
<style>
	.container {
	  padding: 0;
	}

	@media (max-width: 400px) {
	  #map,
	  iframe {
		max-width: 400px;	  
		}
		
	  #map {
	  	padding-bottom: 20px;
	  }
	}
	
	.map_video {
		border-bottom: 1px solid #ddd;
		padding-bottom: 30px;
		margin-bottom: 30px;
	}
	
	.frist_view {
		padding-bottom: 40px;
		border-bottom: 1px solid #ddd;
		margin-top: 60px;
		margin-bottom: 30px;
	}
	
	.dit_ac {
		margin-bottom: 30px;
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
        					<li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#myModal">나의 쪽지함</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="index.jsp">로그아웃</a></li>
                            <li><a class="dropdown-item" href="admin_pass.jsp">관리자메뉴</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="px-4 pt-5 text-center frist_view">
    	<img src="images/kakaoLogo.png" class="" onclick="location='https://pf.kakao.com/_gYxlVK'" style="width: 105px; margin-top: -50px; border-radius: 10px;">
        <h1 class="display-4 fw-bold">DCSC</h1>
        <p class="mb-1">안녕하세요 <b><%=GRADE%> <%=NAME%></b>님!</p>
        <div class="col-lg-6 mx-auto">
            <p class="lead mb-4">동의과학대학교 컴퓨터소프트웨어과 학생들을 위한 커뮤니티입니다.</p>
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
               <button type="button" class="btn btn-primary btn-lg px-4 me-sm-3" data-bs-toggle="modal" data-bs-target="#contactModal">
	              	쪽지 보내기
	            </button>
	            <button type="button" class="btn btn-warning btn-lg px-4 me-sm-3" data-bs-toggle="modal" data-bs-target="#chatModal">
	                익명 채팅방
	            </button>
            </div>
		</div>		
	</div>
	
	<div class="container map_video">
	  <div class="row justify-content-center">
	    <div class="col-md-6">
	      <div id="map" style="width: 550px; height: 400px;"></div>
	    </div>
	    <div class="col-md-6">
	      <iframe width="650px" height="400px" src="https://www.youtube.com/embed/pOP6scBvlOU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
	    </div>
	  </div>
	</div>
		
	<div class="container dit_ac">
	  <div class="d-flex justify-content-center">
	    <iframe width="850px" height="500px" src="https://www.dit.ac.kr/_vr/dept0606/01/tour.html" frameborder="0"></iframe>
	  </div>
	</div>
	
	<!-- 쪽지 Modal -->
	<div class="modal fade" id="contactModal" tabindex="-1" aria-labelledby="contactModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="contactModalLabel">쪽지 보내기</h5> <br>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <!-- Add your contact form here -->
	                <!-- Example: -->
	                <form action="notePro.jsp" method="get">
	                    <div class="mb-3">
	                        <label for="name" class="form-label">수신자 이름</label>
	                        <input type="text" class="form-control" id="name" name="name" placeholder="수신자 이름을 입력하세요." required>
	                    </div>

	                    <div class="mb-3">
	                        <label for="message" class="form-label">내용</label>
	                        <textarea class="form-control" id="content" name="content" rows="3"></textarea>
	                    </div>
	                    <button type="submit" class="btn btn-primary">전송</button>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
        
	<!-- Anonymous Chat Room Modal -->
	<div class="modal fade" id="chatModal" tabindex="-1" aria-labelledby="chatModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-fullscreen">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="chatModalLabel">동의과학대학교 컴퓨터소프트웨어 익명 채팅방</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <iframe src="https://service.dongledongle.com/DIT_DCSC" frameborder="0" width="100%" height="100%"></iframe>
	            </div>
	        </div>
	    </div>
	</div>
	
		<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    	<div class="modal-dialog modal-xl">
      		<div class="modal-content">
	        <div class="modal-header">
			          <h5 class="modal-title" id="exampleModalLabel">나의 쪽지내역</h5>
		          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		        </div>
	        <div class="modal-body">
				<table class="table table-striped">
					  <thead>
					    <tr>
					      <th scope="col">이름</th>
					      <th scope="col">내용</th>
					      <th scope="col">날짜</th>
					    </tr>
					  </thead>
					  <tbody>
					  <%
					  	for (noteDto note : allNotes) {
					  %>
					    <tr>
					      <td><%=note.gettoname()%></td>
					      <td><%=note.getcontent() %></td>
					      <td><%=note.getdate() %></td>
					    </tr>
					    <% } %>
					  </tbody>
				</table>
	        </div>
      </div>
    </div>
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
    
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
    	center: new kakao.maps.LatLng(35.16479652960647, 129.07126421879522), //지도의 중심좌표.
    	level: 3 //지도의 레벨(확대, 축소 정도)
    };

    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    
 	// 마커가 표시될 위치입니다 
    var markerPosition  = new kakao.maps.LatLng(35.16479652960647, 129.07126421879522); 

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
 // 커스텀 오버레이에 표시할 컨텐츠 입니다
 // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
 // 별도의 이벤트 메소드를 제공하지 않습니다 
 var content = '<div class="wrap">' + 
             '    <div class="info" style="background-color: #ffffff; background-color: rgba( 255, 255, 255, 0.7 ); color: black; padding:30px; border-radius:20px;">' + 
             '        <div class="title">' + 
             '            동의과학대학교 미래관' + 
             '            <span class="close" onclick="closeOverlay()" title="닫기">X</span>' + 
             '        </div>' + 
             '        <div class="body">' + 
             '            <div class="img">' +
             '                <img src="images/dit.png" width="73" height="70">' +
             '           </div>' + 
             '            <div class="desc">' + 
             '                <div class="ellipsis">동의과학대학교 컴퓨터소프트웨어과(미래관 5층) 501호</div>' + 
             '                <div class="jibun ellipsis">(47230) 부산 부산진구 양지로 54</div>' + 
             '                <div><a href="https://www.dit.ac.kr/cs/" target="_blank" class="link">학과 홈페이지</a></div>' + 
             '            </div>' + 
             '        </div>' + 
             '    </div>' +    
             '</div>';

 // 마커 위에 커스텀오버레이를 표시합니다
 // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
 var overlay = new kakao.maps.CustomOverlay({
     content: content,
     map: map,
     position: marker.getPosition()       
 });

	 overlay.setMap(null);     
 
 // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
 kakao.maps.event.addListener(marker, 'click', function() {
     overlay.setMap(map);
 });

 // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
 function closeOverlay() {
     overlay.setMap(null);     
 }
 
</script>

</html>
