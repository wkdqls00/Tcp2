package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dto.ScriptwriteDTO;
import project.DatabaseUtil;

public class ScriptwriteDAO {

	public static void main(String[] args) {
		
	ArrayList<ScriptwriteDTO> swd = new ScriptwriteDAO().scriptwriteDto(486);	
	for (ScriptwriteDTO scriptwriteDto : swd) {
		System.out.println(scriptwriteDto);
		}
	}
	
	public ArrayList<ScriptwriteDTO> scriptwriteDto(int play_idx)  {
		
		ArrayList<ScriptwriteDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"SELECT m.email, s.content, s.star_rating, s.title, TO_CHAR(s.reg_date, 'YYYY-MM-DD HH24:MM'), s.del_ok, s.script_idx "
					+ "FROM script s "
					+ "JOIN member m ON m.member_idx = s.member_idx "
					+ "WHERE s.del_ok = 'N' "
					+ "AND s.play_idx = ? "
					+ "ORDER BY s.reg_date DESC";
		
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		ResultSet rs = d.getRs(pstmt);
		
		try {
		while (rs.next()) {
			  String email = rs.getString(1);
			  String content = rs.getString(2);
			  String starRating = rs.getString(3);
			  String title = rs.getString(4);
			  String regDate = rs.getString(5);
			  String delOk = rs.getString(6);
			  int script_idx = rs.getInt(7);
			  ScriptwriteDTO scriptwriteDto = new ScriptwriteDTO(email, content, starRating, title, regDate, delOk, script_idx);
			  list.add(scriptwriteDto);
		}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	}
}