package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.PlayHallLocationDTO;
import dto.PlayhallMapDTO;
import project.DatabaseUtil;


public class PlayHallLocationDAO {

	public static void main(String[] args) throws SQLException {
		ArrayList<PlayHallLocationDTO> phldto = new PlayHallLocationDAO().playHallLocationDto(123);
		for (PlayHallLocationDTO playHallLocationDto : phldto) {
			System.out.println(playHallLocationDto);
		}
		
		ArrayList<PlayhallMapDTO> phmd = new PlayHallLocationDAO().playhallMap(486);
		for (PlayhallMapDTO playhallmapDto : phmd) {
			System.out.println(playhallmapDto);
		}
		
	}
	
	public ArrayList<PlayHallLocationDTO> playHallLocationDto (int playhall_idx) {
		ArrayList<PlayHallLocationDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"SELECT ph.name, ph.latitude, ph.longitude, a.name, image_url, address, phone_no "
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

	public ArrayList<PlayhallMapDTO> playhallMap (int play_idx) {
		ArrayList<PlayhallMapDTO> listRet = new ArrayList<>();
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = "SELECT ph.longitude, ph.latitude, ph.playhall_idx "
				   + "FROM playhall ph INNER JOIN play p ON ph.playhall_idx = p.playhall_idx  "
				   + "WHERE play_idx = ? ";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);

		try {
			while (rs.next()) {
				double longitude = rs.getDouble(1);
				double latitude = rs.getDouble(2);
				int playhall_idx = rs.getInt(3);
				PlayhallMapDTO phmd = new PlayhallMapDTO(longitude, latitude, playhall_idx);
				listRet.add(phmd);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
	
		return listRet;

	}
	
}
