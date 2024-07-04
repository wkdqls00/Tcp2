package dao;

import java.sql.*;

public class LoginDao {
	
	public int responseIdx(String paramId, String paramPw) {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "user6";
		String pw = "1234";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int userIdx = -1;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
			
			String sql = "SELECT member_idx, name FROM member WHERE id = ? AND pw = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paramId);
			pstmt.setString(2, paramPw);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				userIdx = rs.getInt(1);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return userIdx;
		
	}
}
