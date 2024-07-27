package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dto.ScriptwriteDTO;
import project.DatabaseUtil;

public class ScriptwriteupdateDAO {

	public static void main(String[] args) {
		
		ScriptwriteupdateDAO swud = new ScriptwriteupdateDAO();	
		swud.scriptWriteUpdate(7);

		
	}
	
	public int scriptWriteUpdate(int script_idx)  {
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"UPDATE script "
					+ "SET del_ok = 'Y' "
					+ "WHERE script_idx = ?";
		
		int result = 0;
		

		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, script_idx);
			result = pstmt.executeUpdate();
			System.out.println(result+ "행 성공적으로 업데이트됨.");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt);
		}
	
		return result;
	}


}