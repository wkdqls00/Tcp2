package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Selectpayment_p1DTO;
import project.DatabaseUtil;

public class Selectpayment_p1DAO {

	public static void main(String[] args) {
        ArrayList<Selectpayment_p1DTO> list = new Selectpayment_p1DAO().Selectpayment_p1(72254);
		
    }
    
    public ArrayList<Selectpayment_p1DTO> Selectpayment_p1(int playinfo_idx) {
        ArrayList<Selectpayment_p1DTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql =
        		"SELECT p.name, ph.name, pi.play_date, pi.start_time " + 
        		"FROM playinfo pi INNER JOIN play p ON p.play_idx = pi.play_idx " + 
        		"INNER JOIN playhall ph ON p.playhall_idx = ph.playhall_idx " + 
        		"WHERE pi.playinfo_idx = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        try {
			pstmt.setInt(1, playinfo_idx);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
                String play_name = rs.getString(1);
                String playhall_name = rs.getString(2);
                String date = rs.getString(3);
                String time = rs.getString(4);
                Selectpayment_p1DTO selectpayment_p1DTO = new Selectpayment_p1DTO(play_name, playhall_name, date, time);
                list.add(selectpayment_p1DTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	d.close(conn, pstmt, rs);
        }
        return list;	
    }
}