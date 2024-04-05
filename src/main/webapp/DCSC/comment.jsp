<%@page import="com.board.commentDAO"%>
<%@page import="com.board.Dao"%>
<%@page import="com.board.Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    int num = Integer.parseInt(request.getParameter("num"));
    String comment = request.getParameter("comment");
    String writer = (String) session.getAttribute("NAME");
    String userimg = (String) session.getAttribute("USERIMG");
    System.out.println(writer);
   	commentDAO dao = new commentDAO();
    dao.insertComment(num, comment, writer,userimg);
    
    response.sendRedirect("studentWritingInfo.jsp?num=" + num);
%>
