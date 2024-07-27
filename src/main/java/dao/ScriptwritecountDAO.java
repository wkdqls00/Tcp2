package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dto.ScriptwriteDTO;
import dto.ScriptwritecountDTO;
import project.DatabaseUtil;

public class ScriptwritecountDAO {

	public static void main(String[] args) {
		
	ArrayList<ScriptwritecountDTO> swcd = new ScriptwritecountDAO().scriptwritecountDto(486);	
	for (ScriptwritecountDTO scriptwritecountDto : swcd) {
		System.out.println(scriptwritecountDto);
		}
	}
	
	public ArrayList<ScriptwritecountDTO> scriptwritecountDto(int play_idx)  {
		
		ArrayList<ScriptwritecountDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"SELECT count(*) FROM script "
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
			  int scriptwritecount = rs.getInt(1);
			  ScriptwritecountDTO scriptwritecountDto = new ScriptwritecountDTO(scriptwritecount);
			  list.add(scriptwritecountDto);
		}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	}
}