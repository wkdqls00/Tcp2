package dao;

import java.sql.*;
import java.util.ArrayList;


import dto.SearchResultDTO;
import project.DatabaseUtil;

public class TicketlinkMainDao {

	public static void main(String[] args) {
		TicketlinkMainDao dao = new TicketlinkMainDao();
		ArrayList<SearchResultDTO> list = dao.getSearchResult("%시카고%");
		System.out.println(list.size());
		for(SearchResultDTO a : list)System.out.println(a);
	}
	
	public ArrayList<SearchResultDTO> getSearchResult(String input){
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		String sql = 
				"SELECT p.play_idx, p.poster_url, p.name, ph.name,  " + 
				"TO_CHAR(start_date, 'YYYY.MM.DD') || ' ~ ' || TO_CHAR(end_date, 'YYYY.MM.DD') " + 
				"FROM play p JOIN playhall ph ON p.playhall_idx = ph.playhall_idx " + 
				"WHERE p.name LIKE ?";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setString(1, "%" + input + "%");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);
		ArrayList<SearchResultDTO> list = new ArrayList<SearchResultDTO>();
		try {
			while(rs.next()) {
				int play_idx = rs.getInt(1);
				String poster_url = rs.getString(2);
				String playName = rs.getString(3);
				String playhallName = rs.getString(4);
				String period = rs.getString(5);
				list.add(new SearchResultDTO(play_idx, poster_url, playName, playhallName, period));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<SearchResultDTO> getPopular(){
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		String sql = 
				"SELECT p.play_idx, p.poster_url, p.name, ph.name,  " + 
				"TO_CHAR(start_date, 'YYYY.MM.DD') || ' ~ ' || TO_CHAR(end_date, 'YYYY.MM.DD') " + 
				"FROM play p JOIN playhall ph ON p.playhall_idx = ph.playhall_idx " + 
				"JOIN rank r ON p.play_idx = r.play_idx " + 
				"ORDER BY r.booking_rate desc";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		ResultSet rs = d.getRs(pstmt);
		ArrayList<SearchResultDTO> list = new ArrayList<SearchResultDTO>();
		try {
			int count = 0;
			while(rs.next()) {
				if (count > 15) break;
				int play_idx = rs.getInt(1);
				String poster_url = rs.getString(2);
				String playName = rs.getString(3);
				String playhallName = rs.getString(4);
				String period = rs.getString(5);
				list.add(new SearchResultDTO(play_idx, poster_url, playName, playhallName, period));
				System.out.println(new SearchResultDTO(play_idx, poster_url, playName, playhallName, period));
				count++;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	}
	
}
