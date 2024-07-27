package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dto.Detailed_playDTO;
import project.DatabaseUtil;

public class Detailed_playDAO {
public static void main(String[] args) {
	  	
		ArrayList<Detailed_playDTO> dpd = new Detailed_playDAO().DetailedDTO_play(1,"20240405");
    	for (Detailed_playDTO dpdto : dpd) System.out.println(dpdto);
	}
	
	
	public ArrayList<Detailed_playDTO> DetailedDTO_play (int play_idx, String date) {
    	ArrayList<Detailed_playDTO> list = new ArrayList<>();
    	DatabaseUtil d = new DatabaseUtil();
    	Connection conn = d.getConn();
    	
    	String sql = 
    			"SELECT start_time "
    			+ "FROM playinfo "
    			+ "WHERE play_idx = ? "
    			+ "AND play_date LIKE ? "
    			+ "ORDER BY playinfo_idx ";
    	
    	PreparedStatement pstmt = d.getPstmt(conn, sql);
    	
    	try {
    		pstmt.setInt(1, play_idx);
    		pstmt.setString(2,"%"+ date + "%");
    	}catch (SQLException e) {
    		e.printStackTrace();
    	}
    	
    	ResultSet rs = d.getRs(pstmt);
    	
    	try {
    		while(rs.next()) {
    			String start_time = rs.getString(1);
    			Detailed_playDTO detailed_play = new Detailed_playDTO(start_time);
    			list.add(detailed_play);
    		}
    	}catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 자원 정리
        	d.close(conn, pstmt, rs);
        }
        return list;
    	
    	
    }
		
    										
	
}
