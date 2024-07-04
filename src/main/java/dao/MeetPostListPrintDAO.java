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
        		"SELECT m.nickname, m_m.profile, p.content, p.reg_date, p.views, p.file_url "
        		+ "FROM post p, meet_member m_m, member m "
        		+ "WHERE p.meet_member_idx = m_m.meet_member_idx "
        		+ "AND m_m.member_idx = m.member_idx "
        		+ "AND p.meet_idx = ? "
        		+ "ORDER BY p.reg_date DESC";
        		

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	
            	String nickname  = rs.getString(1);
            	String profile = rs.getString(2);
            	String content = rs.getString(3);
            	String reg_date = rs.getString(4);
            	int views = rs.getInt(5);
            	String file_url = rs.getString(6);
            	MeetPostListPrintDTO meetPostListPrintDTO = new MeetPostListPrintDTO(nickname, profile, content, reg_date, views, file_url); // 저장한 값으로 SeatStatus 객체 생성
                list.add(meetPostListPrintDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
}
