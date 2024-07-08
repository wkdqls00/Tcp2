package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.SeatStatusDTO;
import project.DatabaseUtil;

public class SeatStatusDAO {

    public static void main(String[] args) {
    	SeatStatusDAO sa = new SeatStatusDAO();
//        ArrayList<SeatStatusDTO>  list = null;
//       	list = sa.selectSeatStatus(1, 1);
//        System.out.println(
//        		list.get(0).getRank() + "석" +
//        		list.get(0).getCount() + "석" +
//        		list.get(1).getRank() + "석" +
//        		list.get(1).getCount() + "석" +
//        		list.get(2).getRank() + "석" +
//        		list.get(2).getCount() + "석" +
//        		list.get(3).getRank() + "석" +
//        		list.get(3).getCount() + "석"
//        		);
//        for (SeatStatusDTO seatStatusDTO : list) {
//        	System.out.println(seatStatusDTO);
//        }
    	ArrayList<String> list = sa.selectSeatChart(1);
    	System.out.println(list);
    }

    public ArrayList<SeatStatusDTO> selectSeatStatus(int play_idx, int playinfo_idx) {
        ArrayList<SeatStatusDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql =
                "SELECT s.rank, count(CASE WHEN p.play_idx = ? THEN 1 END) - count(CASE WHEN ps.playinfo_idx = ? THEN 1 END) " +
                "FROM play p JOIN playhall ph ON p.playhall_idx = ph.playhall_idx " +
                "JOIN seat s ON ph.playhall_idx = s.playhall_idx " +
                "LEFT JOIN paymentseat ps ON s.seat_idx = ps.seat_idx " +
                "GROUP BY s.rank " +
                "ORDER BY " +
                "CASE " +
                "WHEN s.rank = 'VIP' THEN 1 " +
                "WHEN s.rank = 'R' THEN 2 " +
                "WHEN s.rank = 'S' THEN 3 " +
                "WHEN s.rank = 'A' THEN 4 " +
                "ELSE 5 " +
                "END";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        try {
			pstmt.setInt(1, play_idx);
			pstmt.setInt(2, playinfo_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
                String rank = rs.getString(1);
                int count = rs.getInt(2);
                SeatStatusDTO seatStatusDTO = new SeatStatusDTO(rank, count);
                list.add(seatStatusDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
    public ArrayList<String> selectSeatChart(int playinfo_idx) {
        ArrayList<String> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql =
                "SELECT s.seat_chart " + 
                "FROM paymentseat ps JOIN seat s ON ps.seat_idx = s.seat_idx " + 
                "WHERE playinfo_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        try {
			pstmt.setInt(1, playinfo_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
                String seat_chart = rs.getString(1);
                list.add(seat_chart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
}