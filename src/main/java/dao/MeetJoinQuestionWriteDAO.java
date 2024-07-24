package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.LikeCountDTO;
import dto.MeetJoinQuestionWriteDTO;
import project.DatabaseUtil;

public class MeetJoinQuestionWriteDAO {
	public static void main(String[] args) {
		MeetJoinQuestionWriteDAO mjqw = new MeetJoinQuestionWriteDAO();
		mjqw.meetJoinQuestionWrite(3, 1, "연극, 영화 좋아해요", "gg");
	}

    public void meetJoinQuestionWrite(int member_idx, int meet_idx, String sub_a, String nickname) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"INSERT INTO MEET_MEMBER (MEET_MEMBER_IDX, MEMBER_IDX, MEET_IDX, ADMIN_OK, LEAVE_OK, PROFILE, SUB_A, NICKNAME, JOIN_WAIT) "
        		+ "VALUES (seq_meet_member.nextval, ?, ?, 'N', 'N', null, ?, ?, 'Y')";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setInt(1, member_idx);
        	pstmt.setInt(2, meet_idx);
        	pstmt.setString(3, sub_a);
        	pstmt.setString(4, nickname);

        	int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
    
    public MeetJoinQuestionWriteDTO SelectMeetMemberWaitCount(int meet_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT COUNT(*) "
        		+ "FROM meet_member "
        		+ "WHERE join_wait = 'Y' "
        		+ "AND meet_idx = ?";
        		
        	
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        pstmt.setInt(1, meet_idx);
        
        ResultSet rs = pstmt.executeQuery();
        MeetJoinQuestionWriteDTO SelectMeetMemberWaitCount = null;
        
        if (rs.next()) {
        	int join_wait_count = rs.getInt(1);
        	
        	SelectMeetMemberWaitCount = new MeetJoinQuestionWriteDTO(join_wait_count); // 저장한 값으로 SeatStatus 객체 생성
        }
        
		d.close(conn, pstmt, rs);
    
        return SelectMeetMemberWaitCount;
    }
}
