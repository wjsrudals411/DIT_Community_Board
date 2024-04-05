<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%@page import="com.board.noteDto"%>
<%@page import="com.board.noteDao"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
	String toname = (String) session.getAttribute("NAME");
%>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String date = request.getParameter("date");
	
	
	noteDto dto = new noteDto(num, name, content, toname, date);
	noteDao dao = new noteDao();
	dao.Boardchange(dto, "i");
	
	response.sendRedirect("main.jsp");
	
	

%>
