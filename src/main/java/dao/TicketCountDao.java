package dao;

import java.sql.*;

import project.DatabaseUtil;


public class TicketCountDao {
			
	
	public int ticketCount(int payment_idx) {
		int tCount = 0;
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		
		String sql = 
				"SELECT COUNT(*) FROM paymentseat WHERE payment_idx = ?";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, payment_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);
		
		try {
			if(rs.next()) {
			tCount = rs.getInt(1);
			} else {
				System.out.println("구하기 실패");
			}
		
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return tCount;
	}
}
