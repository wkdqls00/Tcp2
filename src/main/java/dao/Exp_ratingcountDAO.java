package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Exp_RatingcountDTO;
import dto.ScriptwriteDTO;
import dto.ScriptwritecountDTO;
import project.DatabaseUtil;

public class Exp_ratingcountDAO {

	public static void main(String[] args) {
		
	ArrayList<Exp_RatingcountDTO> ercd = new Exp_ratingcountDAO().exp_ratingcountDto(486);	
	for (Exp_RatingcountDTO exprcountDto : ercd) {
		System.out.println(exprcountDto);
		}
	}
	
	public ArrayList<Exp_RatingcountDTO> exp_ratingcountDto(int play_idx)  {
		
		ArrayList<Exp_RatingcountDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"SELECT count(*) FROM Exp_rating "
					+ "WHERE play_idx = ? "
					+ "AND del_ok = 'N'";
		
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

				
		ResultSet rs = d.getRs(pstmt);
		
		try {
		while (rs.next()) {
			  int expratingcount = rs.getInt(1);
			  Exp_RatingcountDTO exp_ratingcountDto = new Exp_RatingcountDTO(expratingcount);
			  list.add(exp_ratingcountDto);
		}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	}
}