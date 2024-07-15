package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MeetJoinQnAPrintDTO;
import project.DatabaseUtil;

public class MeetJoinQnAPrintDAO {
	public static void main(String[] args) {
		MeetJoinQnAPrintDAO mjqnadao = new MeetJoinQnAPrintDAO();
        try {
        	System.out.println(mjqnadao.selectMeetJoinQnAPrintDTO(1));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public MeetJoinQnAPrintDTO selectMeetJoinQnAPrintDTO(int meet_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT  m.name, m.sub_q "
        		+ "FROM meet m, meet_rec_write r "
        		+ "WHERE m.meet_idx = r.meet_idx "
        		+ "AND m.meet_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        pstmt.setInt(1, meet_idx);

        ResultSet rs = pstmt.executeQuery();
        MeetJoinQnAPrintDTO meetJoinQnAPrintDTO = null;
        
        try {
            while (rs.next()) {
            	String name = rs.getString(1);
            	String sub_q = rs.getString(2);
            	
            	meetJoinQnAPrintDTO = new MeetJoinQnAPrintDTO(name, sub_q); // 저장한 값으로 SeatStatus 객체 생성
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        
        return meetJoinQnAPrintDTO;
    }
    
    public MeetJoinQnAPrintDTO selectMeetJoinSubAPrintDTO(int meet_idx, int member_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT sub_a "
        		+ "FROM meet_member "
        		+ "WHERE meet_idx = ? "
        		+ "AND member_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        pstmt.setInt(1, meet_idx);
        pstmt.setInt(2,member_idx);

        ResultSet rs = pstmt.executeQuery();
        MeetJoinQnAPrintDTO meetJoinQnAPrintDTO = null;
        
        try {
            while (rs.next()) {
            	String sub_a = rs.getString(1);
            	
            	meetJoinQnAPrintDTO = new MeetJoinQnAPrintDTO(sub_a); // 저장한 값으로 SeatStatus 객체 생성
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        
        return meetJoinQnAPrintDTO;
    }
}
