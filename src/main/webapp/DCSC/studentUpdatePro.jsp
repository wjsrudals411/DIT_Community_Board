<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.board.Dto"%>
<%@page import="com.board.Dao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>

<%
String uploadsPath = getServletContext().getRealPath("/DCSC/uploads"); // 웹 애플리케이션 컨텍스트 경로 + "/DCSC/uploads"
MultipartRequest mr = new MultipartRequest(request, uploadsPath, 1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());

String numString = mr.getParameter("num");
int num = Integer.parseInt(numString);
String topik = mr.getParameter("topik");
String title = mr.getParameter("title");
String content = mr.getParameter("content");
String writer = mr.getParameter("name");
String fileName = mr.getFilesystemName("img"); // 업로드된 이미지 파일 이름 가져오기
String filePath = "uploads/" + fileName; // 이미지 파일 경로 가져오기

Dto dto = new Dto(topik, title, filePath, content, num);
Dao dao = new Dao();
dao.Boardchange(dto, "u");

response.sendRedirect("studentBoard.jsp");
%>
