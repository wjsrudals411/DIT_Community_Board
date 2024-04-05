<%@page import="com.board.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 승인 또는 취소 액션 값 받기
    String action = request.getParameter("action");
    // 학번 값 받기
    String studentNumber = request.getParameter("studentNumber");

    // LoginDAO 인스턴스 생성
    LoginDAO loginDAO = new LoginDAO();

    // 액션 값에 따라 승인 또는 취소 처리
    if (action != null && studentNumber != null) {
        if (action.equals("approve")) {
            // 회원가입 신청 승인 처리
            loginDAO.approveJoinRequest(studentNumber);
        } else if (action.equals("cancel")) {
            // 회원가입 신청 취소 처리
            loginDAO.cancelJoinRequest(studentNumber);
        }
    }

    // 승인 또는 취소 처리 후, 회원가입 신청 목록 페이지로 이동
    response.sendRedirect("admin_member.jsp");
%>