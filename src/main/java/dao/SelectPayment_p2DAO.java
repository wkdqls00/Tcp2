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

import dto.SelectPayment_p2DTO;
import project.DatabaseUtil;

public class SelectPayment_p2DAO {

	public static void main(String[] args) {
		ArrayList<SelectPayment_p2DTO> list = new SelectPayment_p2DAO().Selectpayment_p2(29661);
		for(SelectPayment_p2DTO s : list) System.out.println(s);
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
    
   
}
