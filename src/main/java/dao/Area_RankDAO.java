package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.Area_RankDTO;
import project.DatabaseUtil;

public class Area_RankDAO {
    // 메인 메서드
    public static void main(String[] args) {
        Area_RankDAO ardto = new Area_RankDAO();
        ArrayList<Area_RankDTO>  list = null;        
        list = ardto.selectAreaRankDTO(1, "20240416"); // sst 메서드 호출하여 좌석 정보 조회 및 결과 받기
        for (Area_RankDTO area_RankDTO : list) { // 조회 결과 출력
        	System.out.println(area_RankDTO); // toString() 호출
        }
    }
    
    public ArrayList<Area_RankDTO> selectAreaRankDTO(int area_idx, String date) { // 데이터베이스에서 좌석등급별 가격 출력
        ArrayList<Area_RankDTO> list = new ArrayList<>(); // 남은 좌석 상태를 저장할 ArrayList 선언
        DatabaseUtil d = new DatabaseUtil(); // DatabaseUtil 객체 생성
        Connection conn = d.getConn(); // 데이터베이스 연결 얻기

        String sql = // 좌석 등급별로 남은 좌석 수를 계산
        			"SELECT r.r_date, p.name, p.start_date, p.end_date, r.booking_rate, p.poster_url, ph.name, a.name "
        			+ "FROM rank r, play p, playhall ph, area a "
        			+ "WHERE r.play_idx = p.play_idx "
        			+ "AND p.playhall_idx = ph.playhall_idx "
        			+ "AND ph.area_idx = a.area_idx "
        			+ "AND a.area_idx = ? "
        			//+ "AND r_date = to_date( ? , 'YYYY-MM-DD') "
        			+ "AND TO_CHAR(r_date, 'YYYYMMDD') = ? "
        			+ "ORDER BY r.area_rank";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql); // PreparedStatement 생성
        
        try {
			pstmt.setInt(1, area_idx);
			pstmt.setString(2, date);
		} catch (SQLException e) {
			e.printStackTrace();
		} // 쿼리 파라미터 설정

        ResultSet rs = d.getRs(pstmt); // 쿼리 실행 및 ResultSet 얻기
        try {
            while (rs.next()) { // ResultSet을 반복하면서 결과 처리
            	 String regDate = rs.getString(1);
            	 String playName = rs.getString(2);
            	 String startDate = rs.getString(3);
            	 String endDate = rs.getString(4);
            	 Double bookingRate = rs.getDouble(5);
            	 String posterUrl = rs.getString(6);
            	 String playHallName = rs.getString(7);
            	 String areaName = rs.getString(8);
            	Area_RankDTO area_RankDTO = new Area_RankDTO(regDate, playName, startDate, endDate, bookingRate, posterUrl, playHallName, areaName);
                list.add(area_RankDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 자원 정리
        	d.close(conn, pstmt, rs);
        }
        return list;
    }
}
