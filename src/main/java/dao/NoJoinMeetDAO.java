package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.RowSetInternal;

import dto.NoJoinMeetDTO;
import project.DatabaseUtil;

public class NoJoinMeetDAO {
	public static void main(String[] args) {
		NoJoinMeetDAO njdao = new NoJoinMeetDAO();
        ArrayList<NoJoinMeetDTO>  list = null;        
        try {
        	list = njdao.selectNoJoinMeetDTO("Y", "%서울%", 34);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (NoJoinMeetDTO noJoinMeetDTO : list) {
        	System.out.println(noJoinMeetDTO);
        }
    }
    
    public ArrayList<NoJoinMeetDTO> selectNoJoinMeetDTO(String public_ok, String area, int member_idx) throws SQLException {
        ArrayList<NoJoinMeetDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT m.name, m.url, r.title, m.age "
        		+ "FROM meet_rec_write r, meet m, meet_member b "
        		+ "WHERE r.meet_idx(+) = m.meet_idx "
        		+ "AND m.meet_idx = b.meet_idx(+) "
        		+ "AND public_ok = ? "
        		+ "AND m.area LIKE ? "
        		+ "AND b.meet_idx NOT IN (SELECT distinct meet_idx "
        		+ "FROM meet_member where member_idx=?) "
        		+ "ORDER BY m.meet_idx";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setString(1, public_ok);
        pstmt.setString(2, area);	
        pstmt.setInt(3, member_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	String name = rs.getString(1);
            	String url = rs.getString(2);
            	String title = rs.getString(3);
            	int age = rs.getInt(4);
            	NoJoinMeetDTO noJoinMeetDTO = new NoJoinMeetDTO(name, url, title, age); // 저장한 값으로 SeatStatus 객체 생성
                list.add(noJoinMeetDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
    
    public boolean noJoinOk(int meet_idx, int member_idx) throws Exception {
    	DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        
        String sql = "SELECT COUNT(*) "
        		+ "FROM meet_member "
        		+ "WHERE member_idx = ? "
        		+ "AND meet_idx = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        pstmt.setInt(1, meet_idx);
        pstmt.setInt(2, member_idx);
        
        ResultSet rs = pstmt.executeQuery();
        
        int result = 0;
        
        if (rs.next()) {
        	result = rs.getInt(1);
        }
        
        rs.close();
		pstmt.close();
		conn.close();
		
		return result == 1;
    }
}