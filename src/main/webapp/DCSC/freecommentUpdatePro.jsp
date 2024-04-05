<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List, com.board.commentDTO, com.board.commentDAO" %>
<%
    request.setCharacterEncoding("UTF-8"); // 한글 데이터를 처리하기 위해 인코딩 설정
    
    int comment_Id = Integer.parseInt(request.getParameter("comment_Id"));
    String content = request.getParameter("content");

    commentDAO commentDAO = new commentDAO(); // CommentDAO 객체 생성

    // 댓글 수정 메서드 호출
    commentDAO.updateComment(content, comment_Id);
    response.sendRedirect("free.jsp"); // 수정이 완료되면 댓글 목록 페이지로 이동
%>
