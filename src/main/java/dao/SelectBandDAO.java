package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.SelectAllBandDTO;
import dto.SelectBandAreaDTO;
import dto.SelectMeetAreaIdxDTO;
import dto.SelectNicknameDTO;
import project.DatabaseUtil;

public class SelectBandDAO {

    // 모든 밴드 리스트 출력
    public ArrayList<SelectAllBandDTO> selectAllBandDTO() throws SQLException {
        ArrayList<SelectAllBandDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT a.name, ma.area_detail, m.url, m.name, m.sub_q, mrw.title, m.meet_idx "
        		+ "FROM meet m, area a, meet_area ma, meet_rec_write mrw "
        		+ "WHERE m.meet_area_idx = ma.meet_area_idx "
        		+ "AND a.area_idx = ma.area_idx "
        		+ "AND mrw.meet_idx = m.meet_idx "
        		+ "AND public_ok = 'Y' "
        		+ "ORDER BY m.meet_idx";
        		
        PreparedStatement pstmt = d.getPstmt(conn, sql);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	
            	String areaName = rs.getString(1);
            	String areaDetail = rs.getString(2);
            	String url = rs.getString(3);
            	String meetName = rs.getString(4);
            	String sub_q = rs.getString(5);
            	String title = rs.getString(6);
            	int meet_idx = rs.getInt(7);

            	SelectAllBandDTO selectAllBandDTO = new SelectAllBandDTO(areaName, areaDetail, url, meetName, sub_q, title, meet_idx); // 저장한 값으로 SeatStatus 객체 생성
                list.add(selectAllBandDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
    public ArrayList<SelectBandAreaDTO> selectBandAreaDTO(int meet_area_idx) throws SQLException {
        ArrayList<SelectBandAreaDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT a.name, ma.area_detail, m.url, m.name, mrw.title, m.meet_idx "
        		+ "FROM meet m, area a, meet_area ma, meet_rec_write mrw "
        		+ "WHERE ma.meet_area_idx = m.meet_area_idx "
        		+ "AND a.area_idx = ma.area_idx "
        		+ "AND mrw.meet_idx = m.meet_idx "
        		+ "AND ma.meet_area_idx = ?";
        		

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_area_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	
            	String area_name = rs.getString(1);
            	String area_detail = rs.getString(2);
            	String url = rs.getString(3);
            	String name = rs.getString(4);
            	String title = rs.getString(5);
            	int meet_idx = rs.getInt(6);

            	SelectBandAreaDTO selectBandAreaDTO = new SelectBandAreaDTO(area_name, area_detail, url, name, title, meet_idx); // 저장한 값으로 SeatStatus 객체 생성
                list.add(selectBandAreaDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
    
    public SelectMeetAreaIdxDTO selectMeetAreaIdxDTO(int member_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT ma.meet_area_idx "
        		+ "FROM meet_area ma, member m "
        		+ "WHERE m.meet_area_idx = ma.meet_area_idx "
        		+ "AND m.member_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, member_idx);

        ResultSet rs = pstmt.executeQuery();
        
        SelectMeetAreaIdxDTO selectMeetAreaIdxDTO = null;
        
        if (rs.next()) {
        	
    			int meet_area_idx = rs.getInt(1);
    			
    			selectMeetAreaIdxDTO = new SelectMeetAreaIdxDTO(meet_area_idx); // 저장한 값으로 SeatStatus 객체 생성
        }
    
		return selectMeetAreaIdxDTO;
    }
    
    public SelectBandAreaDTO selectAreaDetailDTO(int meet_area_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT ma.area_detail, a.name "
        		+ "FROM meet_area ma, area a "
        		+ "WHERE ma.area_idx = a.area_idx "
        		+ "AND ma.meet_area_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_area_idx);

        ResultSet rs = pstmt.executeQuery();
        
        SelectBandAreaDTO selectAreaDetailDTO = null;
        
        if (rs.next()) {
        	
    			String area_detail = rs.getString(1);
    			String name = rs.getString(2);
    			
    			selectAreaDetailDTO = new SelectBandAreaDTO(area_detail, name); // 저장한 값으로 SeatStatus 객체 생성
        }
    
		return selectAreaDetailDTO;
    }
    
    public SelectNicknameDTO selectNicknameDTO(int member_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT nickname "
        		+ "FROM member "
        		+ "WHERE member_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, member_idx);

        ResultSet rs = pstmt.executeQuery();
        
        SelectNicknameDTO selectNicknameDTO = null;
        
        if (rs.next()) {
        	
    			String nickname = rs.getString(1);
    			
    			selectNicknameDTO = new SelectNicknameDTO(nickname); // 저장한 값으로 SeatStatus 객체 생성
        }
    
		return selectNicknameDTO;
    }
}
