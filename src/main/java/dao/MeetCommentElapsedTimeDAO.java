package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MeetCommentElapsedTimeDTO;
import project.DatabaseUtil;

public class MeetCommentElapsedTimeDAO {
	public static void main(String[] args) {
		MeetCommentElapsedTimeDAO mcedao = new MeetCommentElapsedTimeDAO();
        try {
        	System.out.println(mcedao.selectMeetCommentElapsedTimeDTO(11));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public MeetCommentElapsedTimeDTO selectMeetCommentElapsedTimeDTO(int comment_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT "
        		+ "TRUNC(sysdate) - TO_DATE(TO_CHAR(reg_date, 'YYYYMMDD'), 'YYYYMMDD') AS 일, "
        		+ "TRUNC((TO_DATE(TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(TO_CHAR(reg_date, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS')) * 24) AS 시간, "
        		+ "TRUNC((TO_DATE(TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(TO_CHAR(reg_date, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS')) * 24 * 60) AS 분 "
        		+ "FROM meet_comment "
        		+ "WHERE meet_comment_idx = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        pstmt.setInt(1, comment_idx);

        ResultSet rs = pstmt.executeQuery();
        MeetCommentElapsedTimeDTO meetCommentElapsedTimeDTO = null;
        
        if (rs.next()) {
        	String day = rs.getString(1);
        	String time = rs.getString(2);
        	String minute = rs.getString(3);
        	
        	meetCommentElapsedTimeDTO = new MeetCommentElapsedTimeDTO(day, time, minute); // 저장한 값으로 SeatStatus 객체 생성
        }
        
        d.close(conn, pstmt, rs);
        
        return meetCommentElapsedTimeDTO;
    }
}
