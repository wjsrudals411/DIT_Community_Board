package com.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class commentDAO {
	private Connection getConnection() throws Exception{
		
		InitialContext initCtx = new InitialContext();
		
		DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/sin");
		
		Connection con = ds.getConnection();
		return con;	
	}
	
	
	public void insertComment(int postId, String content, String writer,String userimg) {
	    try {
	        // DB 연결 및 쿼리 실행
	        Connection conn = getConnection();
	        String sql = "INSERT INTO comments (post_id, content, writer,userimg) VALUES (?, ?, ?, ?)";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, postId);
	        pstmt.setString(2, content);
	        pstmt.setString(3, writer);
	        pstmt.setString(4, userimg);
	        pstmt.executeUpdate();

	        // 리소스 반환
	        pstmt.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	public List<commentDTO> selectComments(int postId) {
	    List<commentDTO> comments = new ArrayList<>();
	    try {
	        // DB 연결 및 쿼리 실행
	        Connection conn = getConnection();
	        String sql = "SELECT * FROM comments WHERE post_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, postId);
	        ResultSet rs = pstmt.executeQuery();

	        // 결과 처리
	        while (rs.next()) {
	            int commentId = rs.getInt("comment_id");
	            String content = rs.getString("content");
	            String writer = rs.getString("writer");
	            String userimg = rs.getString("userimg");
	            // 댓글 DTO 생성 및 리스트에 추가
	            commentDTO commentDto = new commentDTO(commentId, postId, content, writer, userimg);
	            comments.add(commentDto);
	        }

	        // 리소스 반환
	        rs.close();
	        pstmt.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return comments;
	}
	
	
	public int getCommentCount(int postId) throws Exception {
        int commentCount = 0;
        
        try { 
        	Connection conn = getConnection();
            String sql = "SELECT COUNT(*) AS comment_count FROM comments WHERE post_id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, postId);
            
            ResultSet result = statement.executeQuery();
            
            if (result.next()) {
                commentCount = result.getInt("comment_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return commentCount;
    }
	public void deleteComment(int commentId) {
	    try {
	        // DB 연결 및 쿼리 실행
	        Connection conn = getConnection();
	        String sql = "DELETE FROM comments WHERE comment_id  = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, commentId );
	        pstmt.executeUpdate();

	        // 리소스 반환
	        pstmt.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	public void updateComment(String content, int commentId) {
	    try {
	        // DB 연결 및 쿼리 실행
	        Connection conn = getConnection();
	        String sql = "UPDATE comments SET content = ? WHERE comment_id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, content);
	        pstmt.setInt(2, commentId);
	        pstmt.executeUpdate();

	        // 리소스 반환
	        pstmt.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	



}
