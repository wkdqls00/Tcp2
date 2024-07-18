package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.ReservedSeatInfoDTO;
import project.DatabaseUtil;

public class ReservedSeatInfoDAO {
	public static void main(String[] args) {
    	ArrayList<ReservedSeatInfoDTO> list = new ReservedSeatInfoDAO().selectSeatPrice(210);//등급별가격 
    	for(ReservedSeatInfoDTO s : list) System.out.println(s);
    }
    
    public ArrayList<ReservedSeatInfoDTO> selectSeatPrice(int payment_idx) {
        ArrayList<ReservedSeatInfoDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql =
        		"SELECT s.seat_idx, s.rank, s.seat_chart " + 
        		"FROM seat s JOIN paymentseat ps ON s.seat_idx = ps.seat_idx " + 
        		"WHERE ps.payment_idx = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        try {
			pstmt.setInt(1, payment_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
                int seat_idx = rs.getInt(1);
                String rank = rs.getString(2);
                String seat_chart = rs.getString(3);
                list.add(new ReservedSeatInfoDTO(seat_idx, rank, seat_chart));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	d.close(conn, pstmt, rs);
        }
        return list;
    }
}