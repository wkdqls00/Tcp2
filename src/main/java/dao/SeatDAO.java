package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.SeatDTO;
import project.DatabaseUtil;

public class SeatDAO {

	public static void main(String[] args) {
		ArrayList<SeatDTO> list = new SeatDAO().getSeatlist(1);
		for (SeatDTO dto : list) System.out.println(dto);
		System.out.println(list.size());
	}
	public ArrayList<SeatDTO> getSeatlist(int playhall_idx){
		DatabaseUtil d = new DatabaseUtil();
		ArrayList<SeatDTO> list = new ArrayList<>();
		Connection conn = d.getConn();
		String sql = 
				"SELECT RANK, seat_chart, start_x, start_y, seat_idx FROM seat WHERE playhall_idx = ?";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, playhall_idx);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);
		try {
			while(rs.next()) {
				String rank = rs.getString(1);
				String seat_chart = rs.getString(2);
				int x = rs.getInt(3);
				int y = rs.getInt(4);
				int seat_idx = rs.getInt(5);
				list.add(new SeatDTO(playhall_idx, rank, seat_chart, x, y, seat_idx));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		
		return list;
	}
}
