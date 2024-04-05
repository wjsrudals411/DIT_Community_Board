<%@page import="java.util.List"%>
<%@page import="com.board.commentDTO"%>
<%@page import="com.board.commentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.board.Dao" %>
<%@ page import="com.board.Dto" %>

<%
    String numString = request.getParameter("num");
    int num = Integer.parseInt(numString);

    // Dao 객체 생성
    Dao dao = new Dao();
    Dto dto = dao.getOne(num);

    if (dto != null) {
        // 게시글이 존재하는 경우 삭제 여부를 확인
            dao.Boardchange(dto, "d");
            commentDAO commentDao = new commentDAO();
            List<commentDTO> commentList = commentDao.selectComments(num);
            for (commentDTO comment : commentList) {
                commentDao.deleteComment(comment.getComment_id()); // 댓글의 commentId를 기준으로 삭제
            }
            response.sendRedirect("studentBoard.jsp");
    }
%>

