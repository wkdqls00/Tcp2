package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MeetMemberProfilePrintDTO;
import project.DatabaseUtil;

public class MeetMemberProfilePrintDAO {
	public static void main(String[] args) {
		MeetMemberProfilePrintDAO mmpp = new MeetMemberProfilePrintDAO();
        try {
        	System.out.println(mmpp.selectMeetMemberProfilePrintDTO(2, 3));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public MeetMemberProfilePrintDTO selectMeetMemberProfilePrintDTO(int meet_idx, int member_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT mm.member_idx, mm.nickname, mm.profile, m.nickname "
        		+ "FROM meet_member mm, member m "
        		+ "WHERE mm.member_idx = m.member_idx "
        		+ "AND mm.meet_idx = ? "
        		+ "AND m.member_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_idx);
        pstmt.setInt(2, member_idx);

        ResultSet rs = pstmt.executeQuery();
        MeetMemberProfilePrintDTO meetMemberProfilePrintDTO = null;
       
        try {
        	if (rs.next()) {
        		int member_idx1 = rs.getInt(1);
        		String nickname = rs.getString(2);
        		String profile = rs.getString(3);
        		String mNickname = rs.getString(4);
        		
        		meetMemberProfilePrintDTO = new MeetMemberProfilePrintDTO(member_idx1, nickname, profile, mNickname); // 저장한 값으로 SeatStatus 객체 생성
        	}
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	rs.close();
    		pstmt.close();
    		conn.close();
		}
        
        return meetMemberProfilePrintDTO;
    }
}
