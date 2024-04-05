<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.board.commentDAO" %>
<%@ page import="com.board.commentDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
   
	int comment_Id = Integer.parseInt(request.getParameter("comment_id"));
   // commentDAO를 호출하여 댓글을 삭제합니다.
   commentDAO dao = new commentDAO();
   dao.deleteComment(comment_Id);

   response.sendRedirect("studentBoard.jsp");
%>
