package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MeetMemberSettingPrintDTO;
import project.DatabaseUtil;

public class MeetMemberSettingPrintDAO {
	public static void main(String[] args) {
		MeetMemberSettingPrintDAO mmsp = new MeetMemberSettingPrintDAO();
        ArrayList<MeetMemberSettingPrintDTO>  list = null;        
        try {
        	list = mmsp.selectMeetMemberSettingPrintDTO(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (MeetMemberSettingPrintDTO meetMemberSettingPrintDTO : list) {
        	System.out.println(meetMemberSettingPrintDTO);
        }
    }
    
    public ArrayList<MeetMemberSettingPrintDTO> selectMeetMemberSettingPrintDTO(int meet_idx) throws SQLException {
        ArrayList<MeetMemberSettingPrintDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT sub_q, join_ok, sub_qok "
        		+ "FROM meet "
        		+ "WHERE meet_idx = ?";
        		

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	String sub_q = rs.getString(1);
            	String join_ok = rs.getString(2);
            	String sub_qok = rs.getString(3);

            	MeetMemberSettingPrintDTO meetMemberSettingPrintDTO = new MeetMemberSettingPrintDTO(sub_q, join_ok, sub_qok); // 저장한 값으로 SeatStatus 객체 생성
                list.add(meetMemberSettingPrintDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
}

