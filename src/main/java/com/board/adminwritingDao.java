package com.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class adminwritingDao {
	
	private Connection getConnection() throws Exception{
		
		InitialContext initCtx = new InitialContext();
		
		DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/sin");
		
		Connection con = ds.getConnection();
		return con;	
	}
	
	public int deleteOne(String num) {
	    String sql = "DELETE FROM admin_writing WHERE num=?";
	    
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql);
	    ) {
	        pstmt.setString(1, num);
	        int rowsAffected = pstmt.executeUpdate();
	        
	        return rowsAffected;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return 0;
	}
	
	public adminwritingDto getOne(String num) {
		String sql = "SELECT * FROM admin_writing where num=?";
		adminwritingDto dto = new adminwritingDto();
		
		try (Connection con = getConnection();
				 PreparedStatement pstmt = con.prepareStatement(sql);
				) {
				pstmt.setString(1, num);
				ResultSet rs = pstmt.executeQuery();
				
				if (rs.next()) {	
					String title = rs.getString("title");
					String name = rs.getString("name");
					String img = rs.getString("img");
					String content = rs.getString("content");
					String date = rs.getString("date");
					
					dto = new adminwritingDto(num, name, title, img, content, date);
				}
				
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}
	
	public void Boardchange(adminwritingDto dto, String flag) {
		PreparedStatement pstmt = null;
		
		try (Connection con = getConnection();) {
			if (flag.equals("i")) {
				String sql = "INSERT INTO admin_writing (num, name, title, img, content, date) VALUES (?, ?, ?, ?, ?, NOW())";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, dto.getnum());
	            pstmt.setString(2, dto.getname());
	            pstmt.setString(3, dto.gettitle());
	            pstmt.setString(4, dto.getimg());
	            pstmt.setString(5, dto.getcontent());
	            
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
	
public ArrayList<adminwritingDto> list() {
		
		String sql = "SELECT * FROM admin_writing";
		ArrayList<adminwritingDto> dtos = new ArrayList<adminwritingDto>();
		
		try (Connection con = getConnection();
				Statement stmt = con.createStatement();
				) {
			ResultSet rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				String num = rs.getString("num");
				String name = rs.getString("name");
				String title = rs.getString("title");
				String img = rs.getString("img");
				String content = rs.getString("content");
				String date = rs.getString("date");
				
				adminwritingDto dto = new adminwritingDto(num, name, title, img, content, date);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
}
