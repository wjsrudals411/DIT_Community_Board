<%@page import="com.board.LoginDAO"%>
<%@page import="com.board.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
   
     	String name = request.getParameter("name"); 
     	String studentNumber = request.getParameter("studentNumber");
     	String pwd = request.getParameter("pwd");
     	String email = request.getParameter("email"); 
     	String grade = request.getParameter("grade"); 
     	String position = request.getParameter("position"); 
  	
  		LoginDTO dto = new LoginDTO(name, studentNumber, pwd, email, grade, position);
		LoginDAO dao = new LoginDAO();
  	
		dao.insertLogin(dto);
    
    	// 회원 가입이 성공했을 때에만 리디렉션을 수행
    	response.sendRedirect("index.jsp");
	%>
  
</body>
</html>
