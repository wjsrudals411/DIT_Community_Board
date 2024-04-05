<%@page import="com.board.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
request.setCharacterEncoding("UTF-8");
String pass = request.getParameter("pass");


LoginDAO loginDAO = new LoginDAO();
boolean loginResult = loginDAO.admincheckLogin(pass);

System.out.println("비밀번호: " + pass);

//학번을 사용하여 데이터베이스에서 이름을 가져옵니다.

if (loginResult) {
    // 이름을 세션에 저장합니다.
		response.sendRedirect("admin_sign_up.jsp");
} 
else {  
	 %>
     <script>
         alert("관리자가 아닙니다.");
         window.location.href = "admin_pass.jsp";
     </script>
     <%
 }
%>