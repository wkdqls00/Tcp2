package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class BandDeleteDAO {
	public static void main(String[] args) {
		BandDeleteDAO bddao = new BandDeleteDAO();
		bddao.bandDelete(8);
	}

    public void bandDelete(int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        

        String sql = 
        		"DELETE FROM meet "
        		+ "WHERE meet_idx = ?";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setInt(1, meet_idx);
        	
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
