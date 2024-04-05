package com.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class LoginDAO {
	
	private Connection getConnection() throws Exception {
		Context initCtx =  new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/sin");		
		Connection con = ds.getConnection();
		return con;
		
	}
	
	public String getuserimg(String studentNumber) throws Exception {
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    String userimg = null;

	    try {
	        conn = getConnection();
	        String query = "SELECT img FROM students WHERE studentNumber = ?";
	        stmt = conn.prepareStatement(query);
	        stmt.setString(1, studentNumber);
	        rs = stmt.executeQuery();

	        if (rs.next()) {
	            userimg = rs.getString("img"); // 수정: "img" 열로 변경
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeResultSet(rs);
	        closeStatement(stmt);
	        closeConnection(conn);
	    }

	    return userimg;
	}

	public String getposition(String studentNumber) throws Exception {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String position = null;

        try {
            conn = getConnection();  // getConnection() 메서드는 데이터베이스 연결을 수행합니다.
            String query = "SELECT position FROM students WHERE studentNumber = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, studentNumber);
            rs = stmt.executeQuery();

            if (rs.next()) {
            	position = rs.getString("position");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResultSet(rs);  // closeResultSet(), closeStatement(), closeConnection() 메서드는 자원 해제를 수행합니다.
            closeStatement(stmt);
            closeConnection(conn);
        }

        return position;
    }
	
	public String getemail(String studentNumber) throws Exception {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String email = null;

        try {
            conn = getConnection();  // getConnection() 메서드는 데이터베이스 연결을 수행합니다.
            String query = "SELECT email FROM students WHERE studentNumber = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, studentNumber);
            rs = stmt.executeQuery();

            if (rs.next()) {
            	email = rs.getString("email");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResultSet(rs);  // closeResultSet(), closeStatement(), closeConnection() 메서드는 자원 해제를 수행합니다.
            closeStatement(stmt);
            closeConnection(conn);
        }

        return email;
    }
	
	public String getstudentNumber(String name) throws Exception {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String studentNumber = null;

        try {
            conn = getConnection();  // getConnection() 메서드는 데이터베이스 연결을 수행합니다.
            String query = "SELECT studentNumber FROM students WHERE name = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            rs = stmt.executeQuery();

            if (rs.next()) {
            	studentNumber = rs.getString("studentNumber");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResultSet(rs);  // closeResultSet(), closeStatement(), closeConnection() 메서드는 자원 해제를 수행합니다.
            closeStatement(stmt);
            closeConnection(conn);
        }

        return studentNumber;
    }
	
	 public String getGrade(String studentNumber) throws Exception {
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;
	        String grade = null;

	        try {
	            conn = getConnection();  // getConnection() 메서드는 데이터베이스 연결을 수행합니다.
	            String query = "SELECT grade FROM students WHERE studentNumber = ?";
	            stmt = conn.prepareStatement(query);
	            stmt.setString(1, studentNumber);
	            rs = stmt.executeQuery();

	            if (rs.next()) {
	                grade = rs.getString("grade");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            closeResultSet(rs);  // closeResultSet(), closeStatement(), closeConnection() 메서드는 자원 해제를 수행합니다.
	            closeStatement(stmt);
	            closeConnection(conn);
	        }

	        return grade;
	    }
	
	
	 public String getName(String studentNumber) throws Exception {
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;
	        String name = null;

	        try {
	            conn = getConnection();  // getConnection() 메서드는 데이터베이스 연결을 수행합니다.
	            String query = "SELECT name FROM students WHERE studentNumber = ?";
	            stmt = conn.prepareStatement(query);
	            stmt.setString(1, studentNumber);
	            rs = stmt.executeQuery();

	            if (rs.next()) {
	                name = rs.getString("name");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            closeResultSet(rs);  // closeResultSet(), closeStatement(), closeConnection() 메서드는 자원 해제를 수행합니다.
	            closeStatement(stmt);
	            closeConnection(conn);
	        }

	        return name;
	    }
	

	private void closeConnection(Connection conn) {
		// TODO Auto-generated method stub
		
	}

	private void closeStatement(PreparedStatement stmt) {
		// TODO Auto-generated method stub
		
	}

	private void closeResultSet(ResultSet rs) {
		// TODO Auto-generated method stub
		
	}

	public LoginDTO getOne(String name) {
		String sql = "SELECT * FROM students where name=?";
		LoginDTO dto = new LoginDTO();
		
		try (Connection con = getConnection();
				 PreparedStatement pstmt = con.prepareStatement(sql);
				) {
				pstmt.setString(1, name);
				ResultSet rs = pstmt.executeQuery();
				
				if (rs.next()) {	
					 String studentNumber = rs.getString("studentNumber");
			            String password = rs.getString("password");
			            String email = rs.getString("email");
			            String grade = rs.getString("grade");
			            String position = rs.getString("position");
					
					dto = new LoginDTO(name,studentNumber,password,email,grade,position);
				}
				
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}
	
		public void insertLogin(LoginDTO dto) throws Exception {
			
			String sql = "INSERT INTO students(name, studentNumber, password, email, grade, position) values(?, ?, ?, ?, ?, ?)";
			try(Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);)
			{
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getStudentNumber());
				pstmt.setString(3, dto.getPassword());
				pstmt.setString(4, dto.getEmail());
				pstmt.setString(5, dto.getGrade());
				pstmt.setString(6, dto.getPosition());
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public boolean admincheckLogin(String pass) throws Exception {
		    String sql = "SELECT * FROM admin WHERE pass = ?";
		    try (Connection con = getConnection();
		         PreparedStatement pstmt = con.prepareStatement(sql)) {
		        pstmt.setString(1, pass);
		        try (ResultSet rs = pstmt.executeQuery()) {
		            return rs.next(); // 로그인 정보가 일치하면 true, 그렇지 않으면 false 반환
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        return false; // 예외 발생 시 로그인 실패로 처리
		    }
		}
		
		//approval_status가 승인인 회원만 로그인 가능하게함
		public boolean checkLogin(String studentNumber, String password) throws Exception {
		    String sql = "SELECT * FROM students WHERE studentNumber = ? AND password = ? AND approval_status = '승인'";
		    try (Connection con = getConnection();
		         PreparedStatement pstmt = con.prepareStatement(sql)) {
		        pstmt.setString(1, studentNumber);
		        pstmt.setString(2, password);
		        try (ResultSet rs = pstmt.executeQuery()) {
		            return rs.next(); // 로그인 정보가 일치하면 true, 그렇지 않으면 false 반환
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        return false; // 예외 발생 시 로그인 실패로 처리
		    }
		}
		
		//가입 승인 회원만 가져오는 메서드
		public List<LoginDTO> getApprovedMembers() throws Exception {
		    List<LoginDTO> joinRequests = new ArrayList<>();
		    String sql = "SELECT * FROM students WHERE approval_status = '승인'";
		    try (Connection con = getConnection();
		         PreparedStatement pstmt = con.prepareStatement(sql);
		         ResultSet rs = pstmt.executeQuery()) {
		        while (rs.next()) {
		            String name = rs.getString("name");
		            String studentNumber = rs.getString("studentNumber");
		            String password = rs.getString("password");
		            String email = rs.getString("email");
		            String grade = rs.getString("grade");
		            String position = rs.getString("position");
		            LoginDTO request = new LoginDTO(name, studentNumber, password, email, grade, position);
		            joinRequests.add(request);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return joinRequests;
		}
		
		//미승인인 회원만 가져오는 메서드
		public List<LoginDTO> getJoinRequests() throws Exception {
		    List<LoginDTO> joinRequests = new ArrayList<>();
		    String sql = "SELECT * FROM students WHERE approval_status = '미승인'";
		    try (Connection con = getConnection();
		         PreparedStatement pstmt = con.prepareStatement(sql);
		         ResultSet rs = pstmt.executeQuery()) {
		        while (rs.next()) {
		            String name = rs.getString("name");
		            String studentNumber = rs.getString("studentNumber");
		            String password = rs.getString("password");
		            String email = rs.getString("email");
		            String grade = rs.getString("grade");
		            String position = rs.getString("position");
		            LoginDTO request = new LoginDTO(name, studentNumber, password, email, grade, position);
		            joinRequests.add(request);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return joinRequests;
		}

		 // 회원가입 신청 승인 메서드
	    public void approveJoinRequest(String studentNumber) throws Exception {
	        String sql = "UPDATE students SET approval_status = '승인' WHERE studentNumber = ?";
	        try (Connection conn = getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, studentNumber);
	            pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    // 회원가입 신청 취소 메서드
	    public void cancelJoinRequest(String studentNumber) throws Exception {
	        String sql = "DELETE FROM students WHERE studentNumber = ?";
	        try (Connection conn = getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, studentNumber);
	            pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public int profile(String studentNumber, String img) throws Exception {
	    	String sql = "UPDATE students SET img = ? WHERE studentNumber = ?";
	    	try (Connection conn = getConnection();
	    	     PreparedStatement pstmt = conn.prepareStatement(sql)) {
	    	    pstmt.setString(1, img);
	    	    pstmt.setString(2, studentNumber);
	    	    pstmt.executeUpdate();
	    	} catch (SQLException e) {
	    	    e.printStackTrace();
	    	}

	        return -1; //에러 발생
	    }
	    
	    public LoginDTO getStudentProfile(String studentNumber) throws Exception {
	        LoginDTO dto = new LoginDTO(); // 기본 객체 생성

	        String sql = "SELECT * FROM students WHERE studentNumber = ?";
	        try (Connection conn = getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, studentNumber);
	            try (ResultSet rs = pstmt.executeQuery()) {
	                if (rs.next()) {
	                    dto.setName(rs.getString("name"));
	                    dto.setStudentNumber(rs.getString("studentNumber"));
	                    dto.setEmail(rs.getString("email"));
	                    dto.setImg(rs.getString("img"));
	                    // 필요한 다른 정보들도 설정해줄 수 있습니다.
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return dto;
	    }
	    

}	
