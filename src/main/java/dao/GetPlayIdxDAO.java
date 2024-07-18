package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.GetPlayIdxDTO;
import project.DatabaseUtil;

public class GetPlayIdxDAO {
	public static void main(String[] args) {
		ArrayList<GetPlayIdxDTO> idxlist = new GetPlayIdxDAO().getidxlist(8877);
		for(GetPlayIdxDTO a : idxlist) System.out.println(a);
	}
	public ArrayList<GetPlayIdxDTO> getidxlist(int playinfo_idx){
		ArrayList<GetPlayIdxDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		String sql = 
				"SELECT p.play_idx, p.playhall_idx " + 
				"FROM playinfo pi JOIN play p ON p.play_idx = pi.play_idx " + 
				"WHERE pi.playinfo_idx = ?";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, playinfo_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);
		try {
			while(rs.next()) {
				list.add(new GetPlayIdxDTO(rs.getInt(2), rs.getInt(1)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
		
	}

}
