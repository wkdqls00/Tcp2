package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Locale;

import dto.GetPlayIdxDTO;
import dto.ReservedSeatInfoDTO;
import dto.SeatDTO;
import dto.SeatPriceDTO;
import dto.SeatStatusDTO;
import dto.SelectPayment_p2DTO;
import dto.Selectpayment_p1DTO;
import project.DatabaseUtil;

public class PayDao {
	public static void main(String[] args) {
		
	}
	public ArrayList<GetPlayIdxDTO> getidxlist(int playinfo_idx){ //playinfo_idx -> play_idx, playinfo_idx
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
	public ArrayList<SeatStatusDTO> getSeatStatus(int playhall_idx, int playinfo_idx) {//좌석별로 남은좌석수 출력
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
	
	
    public ArrayList<String> selectSeatChart(int playinfo_idx) {//해당 회차의 공연에 대한 예약된 좌석 리스트 출력
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
    
    public ArrayList<SeatPriceDTO> selectSeatPrice(int play_idx) {// 해당 공연의 가격 출력 
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
	public ArrayList<SeatDTO> getSeatlist(int playhall_idx){//좌석 좌표와 등급구분, 좌석번호 가져오는 메서드
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
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		
		return list;
	}
    public ArrayList<Selectpayment_p1DTO> Selectpayment_p1(int playinfo_idx) {
        ArrayList<Selectpayment_p1DTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql =
        		"SELECT p.name, ph.name, pi.play_date, pi.start_time ,p.poster_url " + 
        		"FROM playinfo pi INNER JOIN play p ON p.play_idx = pi.play_idx " + 
        		"INNER JOIN playhall ph ON p.playhall_idx = ph.playhall_idx " + 
        		"WHERE pi.playinfo_idx = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        try {
			pstmt.setInt(1, playinfo_idx);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
                String play_name = rs.getString(1);
                String playhall_name = rs.getString(2);
                String date = rs.getString(3);
                String time = rs.getString(4);
                String poster_url = rs.getString(5);
                Selectpayment_p1DTO selectpayment_p1DTO = new Selectpayment_p1DTO(play_name, playhall_name, date, time, poster_url);
                list.add(selectpayment_p1DTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	d.close(conn, pstmt, rs);
        }
        return list;	
    }
	public String getSeatImg(int playhall_idx) {
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		String sql = "SELECT image_url FROM playhall WHERE playhall_idx = ?";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, playhall_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);
		String image_url = "";
		try {
			while (rs.next()) {
				image_url = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return image_url;
	}
    public ArrayList<SelectPayment_p2DTO> Selectpayment_p2(int playinfo_idx) {
        ArrayList<SelectPayment_p2DTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql =
        		"SELECT pi.play_date, pi.start_time, p.name, p.poster_url " +
        		"FROM playinfo pi INNER JOIN play p ON pi.play_idx = p.play_idx " + 
        		"WHERE playinfo_idx = ?";
        
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        try {
			pstmt.setInt(1, playinfo_idx);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
                String play_date = rs.getString(1);
                String start_time = rs.getString(2);
                String name = rs.getString(3);
                String poster_url = rs.getString(4);
                
                //날짜 시간 형식변경
                DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy년 M월 d일");
                LocalDate date = LocalDate.parse(play_date, inputFormatter);
                DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
                String formattedDate = date.format(outputFormatter);
                String dayOfWeek = date.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.KOREAN);
                play_date = formattedDate + "(" + dayOfWeek.charAt(0) + ")";
                inputFormatter = DateTimeFormatter.ofPattern("a h시 m분").withLocale(Locale.KOREAN);
                LocalTime time = LocalTime.parse(start_time, inputFormatter);
                start_time = time.format(DateTimeFormatter.ofPattern("HH:mm"));                
                list.add(new SelectPayment_p2DTO(play_date, start_time, name, poster_url));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	d.close(conn, pstmt, rs);
        }
        return list;
    }
    public ArrayList<ReservedSeatInfoDTO> selectSeat(int payment_idx) {
        ArrayList<ReservedSeatInfoDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql =
        		"SELECT s.seat_idx, s.rank, s.seat_chart " + 
        		"FROM seat s JOIN paymentseat ps ON s.seat_idx = ps.seat_idx " + 
        		"WHERE ps.payment_idx = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        try {
			pstmt.setInt(1, payment_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
                int seat_idx = rs.getInt(1);
                String rank = rs.getString(2);
                String seat_chart = rs.getString(3);
                list.add(new ReservedSeatInfoDTO(seat_idx, rank, seat_chart));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	d.close(conn, pstmt, rs);
        }
        return list;
    }
    public String getTimeLimit(int payment_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql =
        		"SELECT TO_CHAR(time_limit + (8 / 1440), 'YYYY-MM-DD HH24:MI') " + 
        		"FROM PAYMENT " + 
        		"WHERE PAYMENT_IDX = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        try {
			pstmt.setInt(1, payment_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

        ResultSet rs = d.getRs(pstmt);
        String time_limit = "";
        try {
            while (rs.next()) {
                time_limit = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	d.close(conn, pstmt, rs);
        }
        return time_limit;
    }
}
