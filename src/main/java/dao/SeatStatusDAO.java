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
		ArrayList<String> list = new SeatStatusDAO().selectSeatChart(29661);
		for(String a : list) System.out.println(a);
	}
	public ArrayList<SeatStatusDTO> getSeatStatus(int playhall_idx, int playinfo_idx) {
		DatabaseUtil d = new DatabaseUtil();
		ArrayList<SeatStatusDTO> list = new ArrayList<>();
		Connection conn = d.getConn();
		String sql = 
				"SELECT COUNT(*), rank FROM seat " + 
				"WHERE playhall_idx = ? GROUP BY rank " + 
				"ORDER BY CASE " + 
				"WHEN rank = 'VIP' THEN 1 " + 
				"WHEN rank = 'R' THEN 2 " + 
				"WHEN rank = 'S' THEN 3 " + 
				"WHEN rank = 'A' THEN 4 " + 
				"ELSE 5 END";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, playhall_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);
		try {
			while(rs.next()) {
				list.add(new SeatStatusDTO(rs.getString(2), rs.getInt(1)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sql = 
				"SELECT COUNT(*), s.rank FROM paymentseat ps " + 
				"JOIN seat s ON ps.seat_idx = s.seat_idx " + 
				"WHERE playinfo_idx = ? GROUP BY s.rank";
		pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, playinfo_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		rs = d.getRs(pstmt);
		try {
			while(rs.next()) {
				String rank = rs.getString(2);
				for(int i = 0; i < list.size(); i++) {
					if(list.get(i).getRank().equals(rank)) list.get(i).setCount(list.get(i).getCount() - rs.getInt(1));
					//공연장 좌석등급별로 예약된 좌석 수 제거해서 남은좌석 출력
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	}
	
	
    public ArrayList<String> selectSeatChart(int playinfo_idx) {
        ArrayList<String> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql =
                "SELECT s.seat_idx " + 
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
