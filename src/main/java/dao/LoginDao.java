package dao;

import java.sql.*;

import project.DatabaseUtil;

public class LoginDao {
	
	public int responseIdx(String paramId, String paramPw) {
		
		DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int userIdx = -1;
		
		try {
			
			String sql = "SELECT member_idx, name FROM member WHERE id = ? AND pw = ? AND withdrawal = 'N'";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paramId);
			pstmt.setString(2, paramPw);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				userIdx = rs.getInt(1);
			}
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
	
public int cookieIdx(String paramId) {
		
		DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int userIdx = -1;
		
		try {
			
			String sql = "SELECT member_idx, name FROM member WHERE id = ? AND withdrawal = 'N'";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paramId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				userIdx = rs.getInt(1);
			}
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
