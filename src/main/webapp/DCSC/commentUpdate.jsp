<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List, com.board.commentDTO, com.board.commentDAO" %>
<!DOCTYPE html>
<html>
<head>
<title>댓글 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/NavFooter.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .container {
        margin-top: 50px;
    }
</style>
</head>
<body>
<%
int comment_Id = Integer.parseInt(request.getParameter("comment_id"));

%>
    <nav class="navbar navbar-expand-lg navbar-light">
        <!-- Navbar content -->
    </nav>
    <div class="container">
        <h3>댓글 수정</h3>
        <form action="commentUpdatePro.jsp" >
            <div class="mb-3">
                <label for="content" class="form-label">댓글 내용</label>
                <textarea class="form-control" id="content" name="content" rows="3" required></textarea>
            </div>
            <input type="hidden" name="comment_Id" value="<%= comment_Id%>">
            
            <button type="submit" class="btn btn-primary">수정</button>
        </form>
    </div>
    <footer class="py-3 my-4">
        <!-- Footer content -->
    </footer>
</body>
</html>
