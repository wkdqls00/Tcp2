package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MeetInfoWriteDTO;
import dto.NoJoinMeetDTO;
import project.DatabaseUtil;

public class MeetInfoWriteDAO {
	public static void main(String[] args) {
		MeetInfoWriteDAO miwdao = new MeetInfoWriteDAO();
        try {
        	System.out.println(miwdao.selectMeetInfoWriteDTO(1));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	// 모든 지역 시군구 select
	public ArrayList<MeetInfoWriteDTO> meetInfoAreaListDTO() throws SQLException {
        ArrayList<MeetInfoWriteDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT ma.area_detail, a.area_idx, ma.meet_area_idx "
        		+ "FROM meet_area ma, area a "
        		+ "WHERE ma.area_idx = a.area_idx";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	String area_detail = rs.getString(1);
            	int area_idx = rs.getInt(2);
            	int meet_area_idx = rs.getInt(3);
            	MeetInfoWriteDTO meetInfoAreaListDTO = new MeetInfoWriteDTO(area_detail, area_idx, meet_area_idx); // 저장한 값으로 SeatStatus 객체 생성
                list.add(meetInfoAreaListDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
	
	public ArrayList<MeetInfoWriteDTO> meetInfoWriteListDTO() throws SQLException {
        ArrayList<MeetInfoWriteDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT name, area_idx "
        		+ "FROM area "
        		+ "ORDER BY name";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	String name = rs.getString(1);
            	int area_idx = rs.getInt(2);
            	MeetInfoWriteDTO meetInfoWriteListDTO = new MeetInfoWriteDTO(name, area_idx); // 저장한 값으로 SeatStatus 객체 생성
                list.add(meetInfoWriteListDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
	
    public MeetInfoWriteDTO selectMeetInfoWriteDTO(int meet_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT r.title, ma.area_detail, a.name, a.area_idx, m.meet_area_idx "
        		+ "FROM meet_rec_write r, meet m, area a, meet_area ma "
        		+ "WHERE r.meet_idx = m.meet_idx "
        		+ "AND m.meet_area_idx = ma.meet_area_idx "
        		+ "AND a.area_idx = ma.area_idx "
        		+ "AND m.meet_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        pstmt.setInt(1, meet_idx);

        ResultSet rs = pstmt.executeQuery();
        MeetInfoWriteDTO meetInfoWriteDTO = null;
        
	    if (rs.next()) {
	    	String title = rs.getString(1); 
	    	String area_detail = rs.getString(2); 
	    	String name = rs.getString(3);
	    	int area_idx = rs.getInt(4);
	    	int meet_area_idx = rs.getInt(5);
	    	meetInfoWriteDTO = new MeetInfoWriteDTO(title, area_detail, name, area_idx, meet_area_idx); // 저장한 값으로 SeatStatus 객체 생성
	    }
	    
	    return meetInfoWriteDTO;
    }
}
