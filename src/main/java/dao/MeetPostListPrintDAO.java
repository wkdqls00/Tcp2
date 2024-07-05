package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MeetPostListPrintDTO;
import project.DatabaseUtil;

public class MeetPostListPrintDAO {
	public static void main(String[] args) {
		MeetPostListPrintDAO mplp = new MeetPostListPrintDAO();
        ArrayList<MeetPostListPrintDTO>  list = null;        
        try {
        	list = mplp.selectMeetPostListPrintDTO(3);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (MeetPostListPrintDTO meetPostListPrintDTO : list) {
        	System.out.println(meetPostListPrintDTO);
        }
    }
    
    public ArrayList<MeetPostListPrintDTO> selectMeetPostListPrintDTO(int meet_idx) throws SQLException {
        ArrayList<MeetPostListPrintDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT m_m.member_idx, m_m.nickname, m_m.profile, p.content, p.reg_date, p.views, p.file_url, p.post_idx "
        		+ "FROM post p, meet_member m_m, member m "
        		+ "WHERE p.meet_member_idx = m_m.meet_member_idx "
        		+ "AND m_m.member_idx = m.member_idx "
        		+ "AND del_ok = 'N' "
        		+ "AND p.meet_idx = ? "
        		+ "ORDER BY p.reg_date DESC";
        		

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	
            	int member_idx = rs.getInt(1);
            	String nickname  = rs.getString(2);
            	String profile = rs.getString(3);
            	String content = rs.getString(4);
            	String reg_date = rs.getString(5);
            	int views = rs.getInt(6);
            	String file_url = rs.getString(7);
            	int post_idx = rs.getInt(8);
            	
            	MeetPostListPrintDTO meetPostListPrintDTO = new MeetPostListPrintDTO(member_idx, nickname, profile, content, reg_date, views, file_url, post_idx); // 저장한 값으로 SeatStatus 객체 생성
                list.add(meetPostListPrintDTO);
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
