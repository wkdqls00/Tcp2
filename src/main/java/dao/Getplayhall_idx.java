package dao;

import java.sql.*;

import project.DatabaseUtil;


public class Getplayhall_idx {

	public static void main(String[] args) {
		Getplayhall_idx gpi = new Getplayhall_idx();
		int num = gpi.getplayhall_idx(486);
		System.out.println(num);
	}	
	
	public int getplayhall_idx(int play_idx) {
	
		DatabaseUtil d = new DatabaseUtil();
		Connection con = d.getConn();
		
		String sql = "SELECT playhall_idx  "
				   + "FROM play "
				   + "WHERE play_idx = ? ";
		
		PreparedStatement pstmt = d.getPstmt(con, sql);
		
		try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);
		try {
			while(rs.next()) {
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			d.close(con, pstmt, rs);
		}
		
		return 0;
	}
	
}
