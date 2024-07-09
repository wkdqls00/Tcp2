package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.BandPublicOkDTO;
import project.DatabaseUtil;

public class BandPublicOkDAO {
    public BandPublicOkDTO selectBandPublicOkDTO(int meet_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = "SELECT public_ok FROM meet WHERE meet_idx = ?";
        		

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_idx);

        ResultSet rs = pstmt.executeQuery();
        BandPublicOkDTO bandPublicOkDTO = null;
       
        if (rs.next()) {
        	String public_ok = rs.getString(1);
        	
        	bandPublicOkDTO = new BandPublicOkDTO(public_ok); // 저장한 값으로 SeatStatus 객체 생성
        }
        
        return bandPublicOkDTO;
    }
}

