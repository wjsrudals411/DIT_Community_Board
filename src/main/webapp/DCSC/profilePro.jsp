<%@ page import="com.board.LoginDTO" %>
<%@ page import="com.board.LoginDAO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.board.Dto" %>
<%@ page import="com.board.Dao" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.security.interfaces.RSAKey" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%
String studentNumber = (String) session.getAttribute("STUDENTNUMBER");
String uploadsPath = getServletContext().getRealPath("/DCSC/profile_img");
String defaultImgPath = getServletContext().getRealPath("/DCSC/profile_img/profile.png");

MultipartRequest mr = new MultipartRequest(request, uploadsPath, 1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());
request.setCharacterEncoding("utf-8");

String fileName = mr.getFilesystemName("img"); // 프로필 이미지 파일 이름 가져오기
String filePath = "profile_img/" + (fileName != null ? fileName : "profile.png"); // 프로필 이미지 파일 경로 가져오기

LoginDAO dao = new LoginDAO();
LoginDTO dto = dao.getStudentProfile(studentNumber);

if (dto == null) {
    // Handle the case where the profile information is not found
    dto = new LoginDTO();
}

if (fileName != null && !fileName.equals("profile.png")) {
    // 이미지가 선택된 경우이며, 선택한 이미지가 "profile.png"가 아닌 경우에만 저장합니다.
    dto.setImg(filePath);
} else if (dto.getImg() == null || dto.getImg().isEmpty()) {
    // 이미지를 선택하지 않거나 선택한 이미지가 "profile.png"인 경우, 이전에 업로드한 이미지를 사용합니다.
    dto.setImg(defaultImgPath);
}

dao.profile(studentNumber, dto.getImg());
session.setAttribute("PROFILE_IMAGE_PATH", dto.getImg());

response.sendRedirect("index.jsp");
%>