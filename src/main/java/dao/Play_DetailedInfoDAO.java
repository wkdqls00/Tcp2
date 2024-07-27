package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.Play_DetailedInfoDTO;
import project.DatabaseUtil;


public class Play_DetailedInfoDAO {
    // 메인 메서드
    public static void main(String[] args) {
    	Play_DetailedInfoDAO pdidao = new Play_DetailedInfoDAO();
        ArrayList<Play_DetailedInfoDTO>  list = null;        
        list = pdidao.play_DetailedInfoDTO(1); // sst 메서드 호출하여 좌석 정보 조회 및 결과 받기

        for (Play_DetailedInfoDTO play_DetailedInfoDTO : list) { // 조회 결과 출력
        	System.out.println(play_DetailedInfoDTO); // toString() 호출
        }
    }
    
    public ArrayList<Play_DetailedInfoDTO> play_DetailedInfoDTO(int play_idx) { // 데이터베이스에서 좌석등급별 가격 출력
        ArrayList<Play_DetailedInfoDTO> list = new ArrayList<>(); // 남은 좌석 상태를 저장할 ArrayList 선언
        DatabaseUtil d = new DatabaseUtil(); // DatabaseUtil 객체 생성
        Connection conn = d.getConn(); // 데이터베이스 연결 얻기

        String sql = // 좌석 등급별로 남은 좌석 수를 계산
        			"SELECT p.name, g.name, poster_url,start_date , end_date, info "
        			+ "FROM play p JOIN genre g ON p.genre_idx = g.genre_idx "
        			+ "WHERE p.play_idx = ? ";
        
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
            	  String genreName = rs.getString(2);
            	  String posterUrl = rs.getString(3);
            	  String startDate = rs.getString(4);
            	  String endDate = rs.getString(5);
            	  String info = rs.getString(6);
            	  Play_DetailedInfoDTO play_DetailedInfoDTO = new Play_DetailedInfoDTO(playName, genreName, posterUrl, startDate, endDate, info);
                list.add(play_DetailedInfoDTO);
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

