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
        		"SELECT  "
        		+ "  TRUNC(sysdate - reg_date, 0), "
        		+ "  TRUNC(sysdate - reg_date) * 24 , "
        		+ "  MOD(TRUNC((sysdate - reg_date )* 24 * 60, 0),60) "
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
