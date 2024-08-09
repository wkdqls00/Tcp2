package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dto.DetailedInfo_playDTO;
import dto.Exp_RatingDTO;
import dto.Exp_RatingcountDTO;
import dto.GetDateDTO;
import dto.PlayHallLocationDTO;
import dto.Play_DetailedInfoDTO;
import dto.PlayhallMapDTO;
import dto.RecommandPDTO;
import dto.ScriptwritecountDTO;
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
    
    //공연장 위치정보
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
	
	//관람후기댓글수
	public int scriptwritecountDto(int play_idx)  {
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		String sql = 
					"SELECT count(*) FROM script "
					+ "WHERE play_idx = ? "
					+ "AND del_ok = 'N'";
		PreparedStatement pstmt = d.getPstmt(conn, sql);		
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
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	public int exp_ratingcountDto(int play_idx)  {
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"SELECT count(*) FROM Exp_rating "
					+ "WHERE play_idx = ? "
					+ "AND del_ok = 'N'";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
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
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	//기대평댓글불러오기
	public ArrayList<Exp_RatingDTO> exp_RatinglistDto(int play_idx) {
		
		ArrayList<Exp_RatingDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"SELECT m.email, er.reg_date, er.content, del_ok, er.exp_rating_idx "
					+ "FROM exp_rating er "
					+ "JOIN member m ON er.member_idx = m.member_idx "
					+ "WHERE play_idx = ? "
					+ "AND del_ok = 'N' "
					+ "ORDER BY er.reg_date DESC";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);
		
		try {
			while(rs.next()) {
				  String email = rs.getString(1);
				  String regDate = rs.getString(2);
				  String content = rs.getString(3);
				  String del_ok = rs.getString(4);
				  int exp_rating_idx = rs.getInt(5);
			Exp_RatingDTO exp_RatinglistDto	= new Exp_RatingDTO(email, regDate, content, del_ok, exp_rating_idx);
			list.add(exp_RatinglistDto);
				  
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	}
	
	//관람후기 별점평균
	public double getstarRatingavg(int play_idx) {
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		String sql = "SELECT star_rating "
				   + "FROM script "
				   + "WHERE play_idx = ?"
				   + "AND del_ok = 'N' ";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);
		
		double result = 0;
		int count = 0;
		try {
			while(rs.next()) {
				result += rs.getInt(1);
				count++;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
		result /= count; 
		result = Math.round(result * 10) / 10. ;		
		return result;
	}
	
	// 공연장 위도 경도값 저장
	public ArrayList<PlayhallMapDTO> playhallMap (int play_idx) {
		ArrayList<PlayhallMapDTO> listRet = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = "SELECT ph.longitude, ph.latitude, ph.playhall_idx "
				   + "FROM playhall ph INNER JOIN play p ON ph.playhall_idx = p.playhall_idx  "
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
				double longitude = rs.getDouble(1);
				double latitude = rs.getDouble(2);
				int playhall_idx = rs.getInt(3);
				PlayhallMapDTO phmd = new PlayhallMapDTO(longitude, latitude, playhall_idx);
				listRet.add(phmd);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
		return listRet;
	}
	
	//공연 일정
	public ArrayList<GetDateDTO> getPlayinfo(int play_idx){
		DatabaseUtil d = new DatabaseUtil();
		
		Connection conn = d.getConn();
		
		String sql = "SELECT playinfo_idx, start_time, play_date "
				   + "FROM playinfo "
				   + "WHERE TO_DATE(play_date, 'YYYY\"년\" MM\"월\" DD\"일\"') >= SYSDATE-1  "
				   + "AND play_idx = ? "
				   + "ORDER BY TO_DATE(play_date, 'YYYY\"년\" MM\"월\" DD\"일\"') ,start_time ";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);
		ArrayList<GetDateDTO> list = new ArrayList<GetDateDTO>();
		try {
			while(rs.next()) {
				int playinfo_idx = rs.getInt(1);
				String start_time = rs.getString(2);
				String play_date = rs.getString(3);
				list.add(new GetDateDTO(playinfo_idx, start_time, play_date));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
		if (list.size() == 0) {
			list.add(new GetDateDTO(0, "0", "0"));
		}
		return list;
		
	}
	
	public ArrayList<RecommandPDTO> recommendPDto() {

		ArrayList<RecommandPDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();

		String sql = "SELECT p.poster_url, a.name, p.name, TO_CHAR(p.start_date,'YYYY-MM-DD'), TO_CHAR(p.end_date,'YYYY-MM-DD'), p.play_idx "
				+ "FROM rank r JOIN play p ON r.play_idx = p.play_idx "
				+ "            JOIN playhall ph ON ph.playhall_idx = p.playhall_idx "
				+ "            JOIN area a ON ph.area_idx = a.area_idx ";

		PreparedStatement pstmt = d.getPstmt(conn, sql);

		ResultSet rs = d.getRs(pstmt);

		try {
			while (rs.next()) {
				String poster_url = rs.getString(1);
				String areaName = rs.getString(2).substring(0, 2);
				String playName = rs.getString(3);
				String startDate = rs.getString(4);
				String endDate = rs.getString(5);
				int play_idx = rs.getInt(6);
				list.add(new RecommandPDTO(poster_url, areaName, playName, startDate, endDate, play_idx));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		List result = list;
		Collections.shuffle(result);
		list = new ArrayList<RecommandPDTO>(result);
		return list;
	}
	
}
