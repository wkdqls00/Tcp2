package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.GetDateDTO;
import project.DatabaseUtil;

public class GetDateDAO {
	
	public static void main(String[] args) {
		
		ArrayList<GetDateDTO> gdd = new GetDateDAO().getPlayinfo(3074);             
		for (GetDateDTO 지수 : gdd )
			System.out.println(지수);
	}

	public ArrayList<GetDateDTO> getPlayinfo(String date, int play_idx){
		DatabaseUtil d = new DatabaseUtil();
		
		Connection conn = d.getConn();
		
		String sql = "SELECT playinfo_idx, start_time "
				   + "FROM playinfo "
				   + "WHERE play_date = ? and play_idx = ? "
				   + "ORDER BY start_time";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setString(1, date);
			pstmt.setInt(2, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);
		ArrayList<GetDateDTO> list = new ArrayList<GetDateDTO>();
		try {
			while(rs.next()) {
				int playinfo_idx = rs.getInt(1);
				String start_time = rs.getString(2);
				list.add(new GetDateDTO(playinfo_idx, start_time, null));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
		
		return list;
		
	}

	public ArrayList<GetDateDTO> getPlayinfo(int play_idx){
		DatabaseUtil d = new DatabaseUtil();
		
		Connection conn = d.getConn();
		
		String sql = "SELECT playinfo_idx, start_time, play_date "
				   + "FROM playinfo "
				   + "WHERE TO_DATE(play_date, 'YYYY\"년\" MM\"월\" DD\"일\"') >= SYSDATE-1  "
				   + "AND play_idx = ? "
				   + "ORDER BY TO_DATE(play_date, 'YYYY\"년\" MM\"월\" DD\"일\"') ,start_time ";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);
		ArrayList<GetDateDTO> list = new ArrayList<GetDateDTO>();
		try {
			while(rs.next()) {
				int playinfo_idx = rs.getInt(1);
				String start_time = rs.getString(2);
				String play_date = rs.getString(3);
				list.add(new GetDateDTO(playinfo_idx, start_time, play_date));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
		if (list.size() == 0) {
			list.add(new GetDateDTO(0, "0", "0"));
		}
		return list;
		
	}
	
	
	
}
