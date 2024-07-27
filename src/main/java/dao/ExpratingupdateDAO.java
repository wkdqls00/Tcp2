package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dto.ScriptwriteDTO;
import project.DatabaseUtil;

public class ExpratingupdateDAO {

	public static void main(String[] args) {
		
		ExpratingupdateDAO swd = new ExpratingupdateDAO();	
		swd.Expratingupdate(5);

	}
	
	public void Expratingupdate(int Exp_rating_idx)  {
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"UPDATE Exp_rating "
					+ "SET del_ok = 'Y' "
					+ "WHERE Exp_rating_idx = ? ";
		
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, Exp_rating_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result+ "행 성공적으로 업데이트됨.");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt);
		}
		
	}
}