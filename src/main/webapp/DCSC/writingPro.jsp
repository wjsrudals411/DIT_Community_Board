<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.board.freeDto"%>
<%@page import="com.board.freeDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
String uploadsPath = getServletContext().getRealPath("/DCSC/uploads"); // 웹 애플리케이션 컨텍스트 경로를 가져온 후, 상대 경로인 "/DCSC/uploads"를 추가
MultipartRequest mr = new MultipartRequest(request, uploadsPath, 1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());
    		//로컬C:Users/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/프로젝트명/uploads(이미지폴더 생성)
    		
//MultipartRequest에서 나머지 파라미터 값 가져오기
String numString = mr.getParameter("num");
int num = 0; // 기본값으로 초기화

if (numString != null && !numString.isEmpty()) {
    num = Integer.parseInt(numString);
}

    String topik = mr.getParameter("topik"); 
    String title = mr.getParameter("title");
    String content = mr.getParameter("content");
    String name = (String) session.getAttribute("NAME");
    String USERIMG = (String) session.getAttribute("USERIMG");
    String date = mr.getParameter("date");
    String fileName = mr.getFilesystemName("img"); // 이미지 파일 이름 가져오기
    String filePath =  "uploads/" + mr.getFilesystemName("img"); //이미지의 파일 경로 가져오기


    freeDto dto = new freeDto(num,topik, title, filePath, content, name,USERIMG, date);
    freeDao dao = new freeDao();
    dao.Boardchange(dto, "i");

    response.sendRedirect("free.jsp");
%>