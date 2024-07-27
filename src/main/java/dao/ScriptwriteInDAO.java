package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dto.ScriptwriteDTO;
import project.DatabaseUtil;

public class ScriptwriteInDAO {
	
	public void scriptwriteIn(int play_idx, int member_idx, String title, String content, int star_rating) {
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"INSERT INTO script(script_idx, play_idx, member_idx, title, content, star_rating, reg_date)  "
					+ "VALUES (Seq_script.nextval, ?, ?, ?, ?  "
					+ "                , ?, sysdate)";
		
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, play_idx);
			pstmt.setInt(2, member_idx);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setInt(5, star_rating);
			
			int result = pstmt.executeUpdate();
			System.out.println(result+ "행 성공적으로 업데이트됨");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt);
		}

	}


}