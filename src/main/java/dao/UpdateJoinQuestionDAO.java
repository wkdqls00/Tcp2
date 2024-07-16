package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class UpdateJoinQuestionDAO {
	public static void main(String[] args) {
		UpdateJoinQuestionDAO ujqdao = new UpdateJoinQuestionDAO();
		ujqdao.updateJoinQuestion("Y", "평소 영화나 공연을 즐겨보시나요?", 3);
	}

    public void updateJoinQuestion(String sub_qok, String sub_q, int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet "
        		+ "SET sub_qok = ? "
        		+ ", sub_q = ?  "
        		+ "WHERE meet_idx = ?";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setString(1, sub_qok);
			pstmt.setString(2, sub_q);
			pstmt.setInt(3, meet_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
    
}
