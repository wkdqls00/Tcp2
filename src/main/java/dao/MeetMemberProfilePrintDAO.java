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
        ArrayList<MeetMemberProfilePrintDTO>  list = null;        
        try {
        	list = mmpp.selectMeetMemberProfilePrintDTO(1,1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (MeetMemberProfilePrintDTO meetMemberProfilePrintDTO : list) {
        	System.out.println(meetMemberProfilePrintDTO);
        }
    }
    
    public ArrayList<MeetMemberProfilePrintDTO> selectMeetMemberProfilePrintDTO(int meet_idx, int member_idx) throws SQLException {
        ArrayList<MeetMemberProfilePrintDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT profile, nickname "
        		+ "FROM meet_member  "
        		+ "WHERE meet_idx = ? "
        		+ "AND member_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_idx);
        pstmt.setInt(2, member_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	
    			String profile = rs.getString(1);
    			String nickname = rs.getString(2);
    			MeetMemberProfilePrintDTO meetMemberProfilePrintDTO = new MeetMemberProfilePrintDTO(profile, nickname); // 저장한 값으로 SeatStatus 객체 생성
                list.add(meetMemberProfilePrintDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
}
