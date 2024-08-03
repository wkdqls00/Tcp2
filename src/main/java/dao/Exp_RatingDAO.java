package dao;

import java.sql.*;
import java.util.ArrayList;
import dto.Exp_RatingDTO;
import project.DatabaseUtil;


public class Exp_RatingDAO {

	public static void main(String[] args) throws SQLException {
	
		Exp_RatingDAO erd = new Exp_RatingDAO();
//		ArrayList<Exp_RatingDTO> list = null; 
//		try {
//		list = erd.exp_RatingDto(1);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} catch (NullPointerException e) {
//			e.printStackTrace();
//		}
//		
////		for (Exp_RatingDTO exp_RatingDto : list) {
////			System.out.println(exp_RatingDto);
////		}
		erd.insertExp_Rating(34, "이 영화 시발임!", 3);
//		erd.updateExp_Rating(4);
		
	}	
	 
	public void insertExp_Rating(int member_idx, String content, int play_idx) {
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql =
				 	"INSERT INTO EXP_RATING (EXP_RATING_IDX, MEMBER_IDX, CONTENT, REG_DATE, PLAY_IDX)  "
				 	+ "VALUES (SEQ_exp_rating.nextval, ? , ? , sysdate, ? )";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, member_idx);
			pstmt.setString(2, content);
			pstmt.setInt(3, play_idx);
			System.out.println(pstmt.executeUpdate() + "행 성공적으로 업데이트됨.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
		
		
	}
	
	public void updateExp_Rating(int script_idx) {
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"UPDATE Exp_rating "
					+ "SET del_ok = 'Y' "
					+ "WHERE Exp_rating_idx = ? ";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, script_idx);
			System.out.println(pstmt.executeUpdate() + "행 성공적으로 업데이트됨.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
		
	}
	
	
	
	

}
