package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.SeatPriceDTO;
import project.DatabaseUtil;

public class SeatPriceDAO {

    // 메인 메서드
    public static void main(String[] args) {
    	ArrayList<SeatPriceDTO> pricelist = new SeatPriceDAO().selectSeatPrice(697);//등급별가격 
    	for(SeatPriceDTO s : pricelist) System.out.println(s);
    }
    
    public ArrayList<SeatPriceDTO> selectSeatPrice(int play_idx) {
        ArrayList<SeatPriceDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql =
        		"SELECT seat_rank, ticket_price " + 
        		"FROM price pr " + 
        		"WHERE play_idx = ? " + 
        		"ORDER BY  " + 
        		"    CASE  " + 
        		"        WHEN seat_rank = 'VIP' THEN 1 " + 
        		"        WHEN seat_rank = 'R' THEN 2 " + 
        		"        WHEN seat_rank = 'S' THEN 3 " + 
        		"        WHEN seat_rank = 'A' THEN 4 " + 
        		"        ELSE 5 " + 
        		"	END";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
                String rank = rs.getString(1);
                String price = rs.getString(2);
                SeatPriceDTO seatPriceDTO = new SeatPriceDTO(rank, price);
                list.add(seatPriceDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	d.close(conn, pstmt, rs);
        }
        return list;
    }
}