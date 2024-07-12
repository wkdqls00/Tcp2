package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class UpdateBandDAO {
	public static void main(String[] args) {
		UpdateBandDAO updateDAO = new UpdateBandDAO();
		updateDAO.updateJoinWait(1, 2);
	}
    public void updateJoinWait(int member_idx, int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet_member "
        		+ "SET join_wait = 'N' "
        		+ "WHERE member_idx = ? "
        		+ "AND meet_idx = ?";
        		
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
			pstmt.setInt(1, member_idx);
			pstmt.setInt(2, meet_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
