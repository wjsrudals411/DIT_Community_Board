package com.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

public class noteDao {
	
	private Connection getConnection() throws Exception{
		
		InitialContext initCtx = new InitialContext();
		
		DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/sin");
		
		Connection con = ds.getConnection();
		return con;	
	}
	
	
	public void Boardchange(noteDto dto, String flag) {
		PreparedStatement pstmt = null;
		
		try (Connection con = getConnection();) {
			if (flag.equals("i")) {
				String sql = "INSERT INTO note (num, name, content, toname, date) VALUES (?, ?, ?, ?, NOW())";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, dto.getnum());
	            pstmt.setString(2, dto.getname());
	            pstmt.setString(3, dto.getcontent());
	            pstmt.setString(4, dto.gettoname());
	            pstmt.setString(5, dto.getdate());
	            
			}
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public List<noteDto> getAll(String name) {
	    String sql = "SELECT * FROM note WHERE name=?";
	    List<noteDto> noteList = new ArrayList<>();
	    
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql);
	    ) {
	        pstmt.setString(1, name);
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            String num = rs.getString("num");
	            String content = rs.getString("content");
	            String toname = rs.getString("toname");
	            String date = rs.getString("date");

	            noteDto dto = new noteDto(num, name, content, toname, date);
	            noteList.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	 return noteList;
	
	
	
}
}
