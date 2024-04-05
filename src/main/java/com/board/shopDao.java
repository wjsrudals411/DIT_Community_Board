package com.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;


public class shopDao {

	private Connection getConnection() throws Exception{
			
		InitialContext initCtx = new InitialContext();
		
		DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/sin");
		
		Connection con = ds.getConnection();
		return con;	
	}
	
	public int deleteOne(String num) {
	    String sql = "DELETE FROM shop_writing WHERE num=?";
	    
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
	
	public void Boardchange( String flag) {
		PreparedStatement pstmt = null;
		shopDto dto = new shopDto();
		try (Connection con = getConnection();) {
			if (flag.equals("i")) {
				String sql = "INSERT INTO shop_writing (num, pay, title, img, content, name,upload_date) VALUES (?, ?, ?, ?, ?, ?,CURDATE())";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getnum());
				pstmt.setString(2, dto.getpay());
				pstmt.setString(3, dto.gettitle());
				pstmt.setString(4, dto.getimg());
				pstmt.setString(5, dto.getcontent());
				pstmt.setString(6, dto.getname());
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
	
	public ArrayList<shopDto> list() {
		
		String sql = "SELECT * FROM shop_writing";
		ArrayList<shopDto> dtos = new ArrayList<shopDto>();
		
		try (Connection con = getConnection();
				Statement stmt = con.createStatement();
			) {
			ResultSet rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				String num = rs.getString("num");
				String pay = rs.getString("pay");
				String title = rs.getString("title");
				String img = rs.getString("img");
				String content = rs.getString("content");
				String name = rs.getString("name");
				String upload_date = rs.getString("upload_date");
				
				shopDto dto = new shopDto(num, pay, title, img, content, name , upload_date);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public shopDto getOne(String num) {
		String sql = "SELECT * FROM shop_writing WHERE num=?";
		shopDto dto = new shopDto();
		
		try (Connection con = getConnection();
			 PreparedStatement pstmt = con.prepareStatement(sql);
			) {
			pstmt.setString(1, num);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {	
				String pay = rs.getString("pay");
				String title = rs.getString("title");
				String img = rs.getString("img");
				String content = rs.getString("content");
				String name = rs.getString("name");
				String upload_date = rs.getString("upload_date");
				
				dto = new shopDto(num, pay, title, img, content, name, upload_date);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
