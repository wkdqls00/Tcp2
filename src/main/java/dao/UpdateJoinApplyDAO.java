package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class UpdateJoinApplyDAO {
	public static void main(String[] args) {
		UpdateJoinApplyDAO ujadao = new UpdateJoinApplyDAO();
		ujadao.updateJoinApply("Y", 9);
	}

    public void updateJoinApply(String join_ok, int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet "
        		+ "SET join_ok = ?  "
        		+ "WHERE meet_idx = ?";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setString(1, join_ok);
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
