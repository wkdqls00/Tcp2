package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.DetailedInfo_playDTO;
import dto.Detailed_playDTO;
import dto.Play_DetailedInfoDTO;
import project.DatabaseUtil;


public class DetailedInfo_playDAO {
    // 메인 메서드
    public static void main(String[] args) {
 
    }

    public ArrayList<DetailedInfo_playDTO> DetailedInfoDTO_play(int play_idx) { // 데이터베이스에서 좌석등급별 가격 출력
        ArrayList<DetailedInfo_playDTO> list = new ArrayList<>(); // 남은 좌석 상태를 저장할 ArrayList 선언
        DatabaseUtil d = new DatabaseUtil(); // DatabaseUtil 객체 생성
        Connection conn = d.getConn(); // 데이터베이스 연결 얻기

        String sql = // 좌석 등급별로 남은 좌석 수를 계산
        		"SELECT p.name, ph.name, p.start_date, p.end_date, p.view_age, p.time, p.poster_url, p.img_detail1, p.crew, p.cast "
        		+ "FROM play p INNER JOIN playhall ph ON p.playhall_idx = ph.playhall_idx "
        		+ "WHERE play_idx = ? ";
        		
        
        PreparedStatement pstmt = d.getPstmt(conn, sql); // PreparedStatement 생성
        
        try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		} // 쿼리 파라미터 설정
    
        ResultSet rs = d.getRs(pstmt); // 쿼리 실행 및 ResultSet 얻기
        try {
            while (rs.next()) { // ResultSet을 반복하면서 결과 처리
            	  String playName = rs.getString(1);
            	  String playhallName = rs.getString(2);
            	  String startDate = rs.getString(3);
            	  String endDate = rs.getString(4);
            	  String viewage = rs.getString(5);
            	  String time = rs.getString(6);
            	  String poster_url = rs.getString(7);
            	  String img_detail1 = rs.getString(8);
            	  String crew = rs.getString(9);
            	  String cast = rs.getString(10);
            	  DetailedInfo_playDTO detailedInfoDTO_play = new DetailedInfo_playDTO(playName, playhallName, time, startDate, endDate, viewage, poster_url, img_detail1, crew, cast);
                list.add(detailedInfoDTO_play);
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