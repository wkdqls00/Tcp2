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
        SeatPriceDAO spdao = new SeatPriceDAO();
        ArrayList<SeatPriceDTO>  list = null;        
        list = spdao.selectSeatPrice(1);
        list.get(0).getPrice();
        list.get(0).getRank();
        for (SeatPriceDTO seatPrice : list) {
        	System.out.println(seatPrice);
        }
    }
    
    public ArrayList<SeatPriceDTO> selectSeatPrice(int play_idx) {
        ArrayList<SeatPriceDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql =
        		"SELECT seat_rank, ticket_price " + 
        		"FROM price pr " + 
        		"WHERE play_idx = ? " + 
        		"ORDER BY pr.ticket_price DESC";
        
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
                int price = rs.getInt(2);
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