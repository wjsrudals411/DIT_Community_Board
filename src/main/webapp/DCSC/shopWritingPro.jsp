<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.board.shopDto"%>
<%@page import="com.board.shopDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>

<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
	String NAME = (String) session.getAttribute("NAME");
%>

<%
String uploadsPath = getServletContext().getRealPath("/DCSC/TestShopimages"); // 웹 애플리케이션 컨텍스트 경로를 가져온 후, 상대 경로인 "/DCSC/uploads"를 추가
MultipartRequest mr = new MultipartRequest(request, uploadsPath, 1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());
    		//로컬C:Users/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/프로젝트명/uploads(이미지폴더 생성)
    		
	//MultipartRequest에서 나머지 파라미터 값 가져오기
    request.setCharacterEncoding("utf-8");
    String num = request.getParameter("num");
    String pay = mr.getParameter("pay"); 
    String title = mr.getParameter("title");
    String content = mr.getParameter("content");
    String fileName = mr.getFilesystemName("img"); // 이미지 파일 이름 가져오기
    String filePath =  "TestShopimages/" + mr.getFilesystemName("img"); //이미지의 파일 경로 가져오기
    String upload_date = request.getParameter("upload_date");



    shopDto dto = new shopDto(num, pay, title, filePath, content, NAME, upload_date);
    shopDao dao = new shopDao();
    dao.Boardchange("i" );

    response.sendRedirect("shop.jsp");
%>