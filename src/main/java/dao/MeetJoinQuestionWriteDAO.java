package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class MeetJoinQuestionWriteDAO {
	public static void main(String[] args) {
		MeetJoinQuestionWriteDAO mjqw = new MeetJoinQuestionWriteDAO();
		mjqw.meetJoinQuestionWrite(1, 2, "N", "N", "연극, 영화 함께 즐겨요~");
	}

    public void meetJoinQuestionWrite(int member_idx, int meet_idx, String admin_ok, String leave_ok, String sub_a) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"INSERT INTO MEET_MEMBER (MEET_MEMBER_IDX, MEMBER_IDX, MEET_IDX, ADMIN_OK, LEAVE_OK, SUB_A)  "
        		+ "VALUES (seq_meet_member.nextval, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setInt(1, member_idx);
        	pstmt.setInt(2, meet_idx);
        	pstmt.setString(3, admin_ok);
        	pstmt.setString(4, leave_ok);
        	pstmt.setString(5, sub_a);

        	int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
