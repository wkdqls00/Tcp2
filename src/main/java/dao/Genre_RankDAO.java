package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.Genre_RankDTO;
import project.DatabaseUtil;

public class Genre_RankDAO {

	public static void main(String[] args) {
		
		Genre_RankDAO grdto = new Genre_RankDAO();
		ArrayList<Genre_RankDTO> list = null; 
		list = grdto.selectGenre_RankDTO(1, "20240416");
		for (Genre_RankDTO genre_Rank : list) {
			System.out.println(genre_Rank);
		}
	}
	
	public ArrayList<Genre_RankDTO> selectGenre_RankDTO(int genre_idx, String date) {
		
		ArrayList<Genre_RankDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
				"SELECT r.r_date, p.name, start_date, end_date, r.booking_rate, poster_url, ph.name "
				+ "FROM rank r, play p, genre g, playhall ph "
				+ "WHERE r.play_idx = p.play_idx  "
				+ "AND p.playhall_idx = ph.playhall_idx "
				+ "AND p.genre_idx = g.genre_idx "
				+ "AND g.genre_idx = ? "
				+ "AND r_date = to_date( ? , 'YYYY-MM-DD') "
				+ "ORDER BY r.genre_rank";
				
	  PreparedStatement pstmt = d.getPstmt(conn, sql);
	  
	  try {
		pstmt.setInt(1, genre_idx);
		pstmt.setString(2, date);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	  
	  
	  ResultSet rs = d.getRs(pstmt);
	 
	  try {
		while (rs.next()) {
				String regDate = rs.getString(1);
			    String playName = rs.getString(2);
				String playStartDate = rs.getString(3);
				String playEndDate = rs.getString(4);
				double playBookRate = rs.getDouble(5);
				String poster_URL = rs.getString(6); 
				String playHallName = rs.getString(7);
				Genre_RankDTO genre_Rank = new Genre_RankDTO(regDate, playName, playStartDate, playEndDate, playBookRate, poster_URL, playHallName);
				list.add(genre_Rank);
			
		  }
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		d.close(conn, pstmt, rs);

	}
		return list;		

	}
	

	
}
