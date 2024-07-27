package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import project.DatabaseUtil;

public class ScriptDeleteDAO {
	
	public static void main(String[] args) throws SQLException {
		
		ScriptDeleteDAO sdd = new ScriptDeleteDAO();	
		sdd.updateScriptDelete(3);
	
	}

	public void updateScriptDelete(int script_idx) throws SQLException {
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"UPDATE script "
					+ "SET del_ok = 'Y' "
					+ "WHERE script_idx = ? ";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, script_idx);
			int result = pstmt.executeUpdate();
			 System.out.println(result + "행 성공적으로 업데이트됨.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}

		
	}
	

}
