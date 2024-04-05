<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
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
	<title>DCSC</title>
	<style>
		.jobs {
			padding: 0px 50px 0px 50px;
			background-color: #F8F9FC;
			border-radius: 20px
		}
		
		.job_tit {
			margin-top: 40px;
		}
		
		.saramin {
			border: 1px solid #ddd;
			border-radius: 20px;
			padding: 20px;
		}
		
		.job-list {
			marign-top: 50px;
		}
		
		 button, .toolTip, .area_btn, .icon_scrap_star{
			display: none;
		}
		
		.navbar-toggler {
			display: block;
		}
		
		.job_sector, .corp_name, .job_condition{
			pointer-events: none;
		}
		

    @media (max-width: 800px) {

        footer {
            display: none;
        }

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

</head>
<body>
<%
	Document doc = Jsoup.connect("https://www.saramin.co.kr/zf_user/search?searchword=%EC%8B%A0%EC%9E%85+%EA%B0%9C%EB%B0%9C%EC%9E%90&go=&flag=n&searchMode=1&searchType=search&search_done=y&search_optional_item=n").get();
	Elements content = doc.select(".item_recruit");

	for (Element element : content) {
	    Element link = element.select("a").first();
	    if (link != null) {
	        String href = link.attr("href");
	        // Update the href value.
	        href = "https://www.saramin.co.kr" + href;
	        link.attr("href", href);
	    }
	}
%>

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
    
   	<div class="px-4 pt-5 my-5 text-center border-bottom">
        <h1 class="display-4 fw-bold">개발자 채용 정보 찾으시나요?</h1>
        <div class="col-lg-6 mx-auto">
        	<img src="images/saramin.png" class="saramin">
            <p class="lead mb-4">사람인 신입개발자 채용공고</p>
        </div>
    </div>
    
	<div class="d-flex justify-content-center job-list">
	    <div class="jobs">
	    	<%=content %>
	    </div>
	</div>

</body>
</html>

<!--  
		https://www.saramin.co.kr/zf_user/jobs/relay/view?isMypage=no&rec_idx=45462298&recommend_ids=eJxNjrkRw0AMA6txzg8gGbsQ9d%2BFdZaGdyFmsRgEEGaZV5l%2B8hug885X6RPhjRWt%2F1H6hnJTPmVjBMd1UfMY12GI2lNRAGYqymu5L6WSUkPBhvZ2yeBalvdkmtbhRokMhThQc9ISlGOqmepTjso%2BPker5HbJLrdV%2FgFfiEBO&view_type=search&searchword=%EA%B0%9C%EB%B0%9C%EC%9E%90&searchType=search&gz=1&paid_fl=n&search_uuid=c4ce0207-df26-4e4a-9dfc-9232afb0aa05#seq=0 
		http://localhost:8080/zf_user/jobs/relay/view?view_type=search&rec_idx=45444896&location=ts&searchword=%EA%B0%9C%EB%B0%9C%EC%9E%90&searchType=search&paid_fl=n&search_uuid=c4ce0207-df26-4e4a-9dfc-9232afb0aa05
-->