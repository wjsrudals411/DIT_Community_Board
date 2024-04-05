<%@page import="com.board.freeDto"%>
<%@page import="com.board.freeDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<%	
request.setCharacterEncoding("utf-8");
String numString = request.getParameter("num");
int num = Integer.parseInt(numString);
String topik = request.getParameter("topik");
String title = request.getParameter("title");
String img = request.getParameter("img");
String content = request.getParameter("content");
String name = request.getParameter("name");
String userimg = request.getParameter("userimg");
String date = request.getParameter("date");

freeDto dto = new freeDto(num, topik, title, img ,content, name, userimg, date);
freeDao dao = new freeDao();
dao.getOne(num);

response.sendRedirect("freeWriting.jsp");
%>