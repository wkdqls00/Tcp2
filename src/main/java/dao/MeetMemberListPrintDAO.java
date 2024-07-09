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
        		"SELECT nickname, admin_ok, profile "
        		+ "FROM meet_member "
        		+ "WHERE meet_idx = ? ";
        		

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
    
    public boolean adminCheck(int member_idx, int meet_idx) throws Exception {
    	DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        
    	String sql = "SELECT COUNT(*) "
    			+ "FROM meet_member "
    			+ "WHERE admin_ok = 'Y' "
    			+ "AND member_idx = ? "
    			+ "AND meet_idx = ?";
    	
    	PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, member_idx);
		pstmt.setInt(2, meet_idx);
		
		// 실행 --> return true / false
		ResultSet rs = pstmt.executeQuery();
		int result = 0;	// 0 : 초기값 (사실, 1이 아닌 모든 값이면 오케이)
		if (rs.next()) {
			result = rs.getInt(1);	// 첫 번째 컬럼의 값.
		}
		
		rs.close();
		pstmt.close();
		conn.close();
    	
		return result == 1;
    	
    }
}
