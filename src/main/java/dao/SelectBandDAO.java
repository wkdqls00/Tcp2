package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.JoinConditionPrintDTO;
import dto.SelectBandAreaDTO;
import dto.SelectMeetAreaIdxDTO;
import project.DatabaseUtil;

public class SelectBandDAO {
	public static void main(String[] args) {
		SelectBandDAO selectDAO = new SelectBandDAO();
        ArrayList<SelectBandAreaDTO>  list = null;        
        try {
        	list = selectDAO.selectBandAreaDTO(2);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (SelectBandAreaDTO selectBandAreaDTO : list) {
        	System.out.println(selectBandAreaDTO);
        }
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
        		"SELECT area_detail "
        		+ "FROM meet_area "
        		+ "WHERE meet_area_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_area_idx);

        ResultSet rs = pstmt.executeQuery();
        
        SelectBandAreaDTO selectAreaDetailDTO = null;
        
        if (rs.next()) {
        	
    			String area_detail = rs.getString(1);
    			
    			selectAreaDetailDTO = new SelectBandAreaDTO(area_detail); // 저장한 값으로 SeatStatus 객체 생성
        }
    
		return selectAreaDetailDTO;
    }
    
    public SelectBandAreaDTO selectAreaMeetIdxDTO(int meet_area_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT area_detail "
        		+ "FROM meet_area "
        		+ "WHERE meet_area_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_area_idx);

        ResultSet rs = pstmt.executeQuery();
        
        SelectBandAreaDTO selectAreaDetailDTO = null;
        
        if (rs.next()) {
        	
    			String area_detail = rs.getString(1);
    			
    			selectAreaDetailDTO = new SelectBandAreaDTO(area_detail); // 저장한 값으로 SeatStatus 객체 생성
        }
    
		return selectAreaDetailDTO;
    }
}
