package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.DetailedInfo_playDTO;
import dto.PlayHallLocationDTO;
import dto.Play_DetailedInfoDTO;
import dto.SeatPriceDTO;
import project.DatabaseUtil;

public class PlayinfoDetailDao {
	public static void main(String[] args) {
		PlayinfoDetailDao dao = new PlayinfoDetailDao();
		ArrayList<DetailedInfo_playDTO> list = dao.DetailedInfoDTO_play(486);
		for(DetailedInfo_playDTO a : list)System.out.println(a);
	}
	//공연장 idx 얻는 메서드
	public int getplayhall_idx(int play_idx) {

		DatabaseUtil d = new DatabaseUtil();
		Connection con = d.getConn();
		String sql = "SELECT playhall_idx  " + "FROM play " + "WHERE play_idx = ? ";
		PreparedStatement pstmt = d.getPstmt(con, sql);

		try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);
		try {
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			d.close(con, pstmt, rs);
		}

		return 0;
	}

	//공연이름 장르 포스터url 날짜정보 얻는 메서드
    public ArrayList<Play_DetailedInfoDTO> play_DetailedInfoDTO(int play_idx) { 
        ArrayList<Play_DetailedInfoDTO> list = new ArrayList<>(); 
        DatabaseUtil d = new DatabaseUtil(); 
        Connection conn = d.getConn(); 

        String sql = 
        			"SELECT p.name, g.name, poster_url,start_date , end_date, info "
        			+ "FROM play p JOIN genre g ON p.genre_idx = g.genre_idx "
        			+ "WHERE p.play_idx = ? ";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql); 
        
        try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
    
        ResultSet rs = d.getRs(pstmt); 
        try {
            while (rs.next()) {
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
        	d.close(conn, pstmt, rs);
        }
        return list;
    }
    
    //공연장이름 공연상세정보 얻는 메서드
    public ArrayList<DetailedInfo_playDTO> DetailedInfoDTO_play(int play_idx) { 
        ArrayList<DetailedInfo_playDTO> list = new ArrayList<>(); 
        DatabaseUtil d = new DatabaseUtil(); 
        Connection conn = d.getConn(); 
        String sql = 
        		"SELECT p.name, ph.name, TO_CHAR(p.start_date, 'YYYY-MM-DD'), TO_CHAR(p.end_date, 'YYYY-MM-DD'), p.view_age, p.time, p.poster_url, p.img_detail1, p.crew, p.cast "
        		+ "FROM play p INNER JOIN playhall ph ON p.playhall_idx = ph.playhall_idx "
        		+ "WHERE play_idx = ? ";
        PreparedStatement pstmt = d.getPstmt(conn, sql); 
        try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) { 
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
        	d.close(conn, pstmt, rs);
        }
        return list;
    }
    
    //공연 좌석별 가격
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
    
	public ArrayList<PlayHallLocationDTO> playHallLocationDto (int playhall_idx) {
		ArrayList<PlayHallLocationDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		String sql = 
					"SELECT ph.name, ph.latitude, ph.longitude, a.name, image_url, address, phone_no "
					+ "FROM playhall ph JOIN area a ON ph.area_idx = a.area_idx "
					+ "WHERE ph.playhall_idx = ? ";   
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, playhall_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);
		try {
			while(rs.next()) {
				  String playHallName = rs.getString(1);
				  String latitude = rs.getString(2);
				  String longitude = rs.getString(3);
				  String areaName = rs.getString(4);
				  String image_Url = rs.getString(4);
				  String address = rs.getString(6);
				  String phone_No = rs.getString(7) == null ? " " : rs.getString(7);
				  
				  PlayHallLocationDTO playHallLocationDto = new PlayHallLocationDTO(playHallName, latitude, longitude, areaName, image_Url, address, phone_No);
				  list.add(playHallLocationDto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	
	}
}
