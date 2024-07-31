package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MeetSettingPrintDTO;
import project.DatabaseUtil;

public class MeetSettingPrintDAO {
	public static void main(String[] args) {
		MeetSettingPrintDAO msp = new MeetSettingPrintDAO();
        try {
        	System.out.println(msp.selectMeetSettingPrintDTO(2));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public MeetSettingPrintDTO selectMeetSettingPrintDTO(int meet_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT name, url "
        		+ "FROM meet  "
        		+ "WHERE meet_idx = ?";
        		

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_idx);

        ResultSet rs = d.getRs(pstmt);
        MeetSettingPrintDTO meetSettingPrintDTO = null;
        
        if(rs.next()) {
    		String name = rs.getString(1);
        	String url = rs.getString(2);

        	meetSettingPrintDTO = new MeetSettingPrintDTO(name, url); // 저장한 값으로 SeatStatus 객체 생성
        }
        d.close(conn, pstmt, rs);
        return meetSettingPrintDTO;
     }
}
