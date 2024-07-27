package dao;

import java.sql.*;

import project.DatabaseUtil;

public class Exp_ratingDeleteDAO {
	
	public static void main(String[] args) throws SQLException  {
		Exp_ratingDeleteDAO erdd = new Exp_ratingDeleteDAO();
		
		erdd.updateExp_ratingDelete(6);
		}
	
	public void updateExp_ratingDelete(int Exp_rating_idx) throws SQLException {
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = "UPDATE Exp_rating "
				   + "SET del_ok = 'Y' "
				   + "WHERE Exp_rating_idx = ? ";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
	
		try {
			pstmt.setInt(1, Exp_rating_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt);
		}
		
	}
	
}
