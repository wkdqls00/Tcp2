package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MeetMemberListPrintDTO;
import project.DatabaseUtil;

public class MeetMemberListPrintDAO {
	public static void main(String[] args) {
		MeetMemberListPrintDAO mmlp = new MeetMemberListPrintDAO();
        ArrayList<MeetMemberListPrintDTO>  list = null;        
        try {
        	list = mmlp.selectMeetMemberListPrintDTO(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (MeetMemberListPrintDTO meetMemberListPrintDTO : list) {
        	System.out.println(meetMemberListPrintDTO);
        }
    }
    
    public ArrayList<MeetMemberListPrintDTO> selectMeetMemberListPrintDTO(int meet_idx) throws SQLException {
        ArrayList<MeetMemberListPrintDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT m.nickname, m_m.admin_ok, m_m.profile "
        		+ "FROM member m, meet_member m_m "
        		+ "WHERE m.member_idx = m_m.member_idx "
        		+ "AND m_m.meet_idx = ?";
        		

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	
            	String nickname = rs.getString(1);
            	String admin_ok = rs.getString(2);
            	String profile = rs.getString(3);

            	MeetMemberListPrintDTO meetMemberListPrintDTO = new MeetMemberListPrintDTO(nickname, admin_ok, profile); // 저장한 값으로 SeatStatus 객체 생성
                list.add(meetMemberListPrintDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
}
