<%@page import="com.board.adminwritingDao" %>
<%@page import="com.board.adminwritingDto" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>
    
<%
	// 함수 호출 
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	
	adminwritingDao dao = new adminwritingDao();
	int rowDeleted = dao.deleteOne(num);
	
	response.sendRedirect("admin_announcement.jsp");
%>
