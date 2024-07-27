package dao;

import java.sql.*;
import java.util.ArrayList;
import dto.Exp_RatingDTO;
import project.DatabaseUtil;


public class Exp_RatinglistDAO {

	public static void main(String[] args) throws SQLException {
		int play_idx = 486;
		ArrayList<Exp_RatingDTO> list = new Exp_RatinglistDAO().exp_RatinglistDto(play_idx); 
		for (Exp_RatingDTO erd : list) 
			System.out.println(erd);
	}	
	 
	public ArrayList<Exp_RatingDTO> exp_RatinglistDto(int play_idx) {
		
		ArrayList<Exp_RatingDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"SELECT m.email, er.reg_date, er.content, del_ok, er.exp_rating_idx "
					+ "FROM exp_rating er "
					+ "JOIN member m ON er.member_idx = m.member_idx "
					+ "WHERE play_idx = ? "
					+ "AND del_ok = 'N' "
					+ "ORDER BY er.reg_date DESC";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);
		
		try {
			while(rs.next()) {
				  String email = rs.getString(1);
				  String regDate = rs.getString(2);
				  String content = rs.getString(3);
				  String del_ok = rs.getString(4);
				  int exp_rating_idx = rs.getInt(5);
			Exp_RatingDTO exp_RatinglistDto	= new Exp_RatingDTO(email, regDate, content, del_ok, exp_rating_idx);
			list.add(exp_RatinglistDto);
				  
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		
		return list;
		
		
	}
	
}
