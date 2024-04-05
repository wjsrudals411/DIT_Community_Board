<%@page import="com.board.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
request.setCharacterEncoding("UTF-8");
String studentNumber = request.getParameter("studentNumber");
String pwd = request.getParameter("pwd");


LoginDAO loginDAO = new LoginDAO();
boolean loginResult = loginDAO.checkLogin(studentNumber, pwd);

System.out.println("학번: " + studentNumber);
System.out.println("비밀번호: " + pwd);

//학번을 사용하여 데이터베이스에서 이름을 가져옵니다.
String nameFromDB = loginDAO.getName(studentNumber);
String gradeFromDB = loginDAO.getGrade(studentNumber);
String emailFromDB = loginDAO.getemail(studentNumber);
String positionFromDB = loginDAO.getposition(studentNumber);
String userimgFromDB = loginDAO.getuserimg(studentNumber);
String studentNumberFromDB = loginDAO.getstudentNumber(nameFromDB);


if (loginResult) {
    // 이름을 세션에 저장합니다.
    session.setAttribute("NAME", nameFromDB);
    session.setAttribute("GRADE", gradeFromDB);
    session.setAttribute("STUDENTNUMBER", studentNumberFromDB);
    session.setAttribute("EMAIL", emailFromDB);
    session.setAttribute("POSITION", positionFromDB);
    session.setAttribute("USERIMG", userimgFromDB);
    response.sendRedirect("main.jsp");
} 
else {  
	 %>
     <script>
         alert("승인되어있지 않습니다.");
         window.location.href = "index.jsp";
     </script>
     <%
 }
%>