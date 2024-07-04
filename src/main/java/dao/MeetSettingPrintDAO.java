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
        ArrayList<MeetSettingPrintDTO>  list = null;        
        try {
        	list = msp.selectMeetSettingPrintDTO(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (MeetSettingPrintDTO meetSettingPrintDTO : list) {
        	System.out.println(meetSettingPrintDTO);
        }
    }
    
    public ArrayList<MeetSettingPrintDTO> selectMeetSettingPrintDTO(int meet_idx) throws SQLException {
        ArrayList<MeetSettingPrintDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT name, url, color "
        		+ "FROM meet  "
        		+ "WHERE meet_idx = ?";
        		

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	String name = rs.getString(1);
            	String url = rs.getString(2);
            	String color = rs.getString(3);

            	MeetSettingPrintDTO meetSettingPrintDTO = new MeetSettingPrintDTO(name, url, color); // 저장한 값으로 SeatStatus 객체 생성
                list.add(meetSettingPrintDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
}
