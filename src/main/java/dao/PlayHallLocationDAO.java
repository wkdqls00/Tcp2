package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.PlayHallLocationDTO;
import project.DatabaseUtil;


public class PlayHallLocationDAO {

	public static void main(String[] args) throws SQLException {
		ArrayList<PlayHallLocationDTO> phldto = new PlayHallLocationDAO().playHallLocationDto(123);
		for (PlayHallLocationDTO playHallLocationDto : phldto) {
			System.out.println(playHallLocationDto);
		}
		
	}
	
	public ArrayList<PlayHallLocationDTO> playHallLocationDto (int playhall_idx) {
		ArrayList<PlayHallLocationDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"SELECT ph.name, a.latitude, a.longitude, a.name, image_url, address, phone_no "
					+ "FROM playhall ph JOIN area a ON ph.area_idx = a.area_idx "
					+ "WHERE ph.playhall_idx = ? ";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, playhall_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);
		
		try {
			while(rs.next()) {
				  String playHallName = rs.getString(1);
				  String latitude = rs.getString(2);
				  String longitude = rs.getString(3);
				  String areaName = rs.getString(4);
				  String image_Url = rs.getString(4);
				  String address = rs.getString(6);
				  String phone_No = rs.getString(7) == null ? " " : rs.getString(7);
				  
				  PlayHallLocationDTO playHallLocationDto = new PlayHallLocationDTO(playHallName, latitude, longitude, areaName, image_Url, address, phone_No);
				  list.add(playHallLocationDto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
		
		
	}
	
}
