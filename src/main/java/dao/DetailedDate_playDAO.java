package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import dto.DetailedDate_playDTO;
import project.DatabaseUtil;

public class DetailedDate_playDAO {
    public static void main(String[] args) {
        ArrayList<DetailedDate_playDTO> ddpd = new DetailedDate_playDAO().detailedDateDTO_play(486, "2024년 4월 5일");
        for (DetailedDate_playDTO dpdto : ddpd) System.out.println(dpdto);
    }

    private String getDayOfWeek(String date) {
        Map<Integer, String> dayOfWeekMap = new HashMap<>();
        dayOfWeekMap.put(1, "일");
        dayOfWeekMap.put(2, "월");
        dayOfWeekMap.put(3, "화");
        dayOfWeekMap.put(4, "수");
        dayOfWeekMap.put(5, "목");
        dayOfWeekMap.put(6, "금");
        dayOfWeekMap.put(7, "토");

        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(date);
            Calendar cal = Calendar.getInstance();
            cal.setTime(d);
            int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
            return dayOfWeekMap.get(dayOfWeek);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public ArrayList<DetailedDate_playDTO> detailedDateDTO_play(int play_idx, String date) {
        ArrayList<DetailedDate_playDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
            "SELECT play_date, start_time " +
            "FROM playinfo " +
            "WHERE play_idx = ? " +
            "AND play_date LIKE ? " +
            "ORDER BY playinfo_idx";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        try {
            pstmt.setInt(1, play_idx);
            pstmt.setString(2, "%" + date + "%");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        ResultSet rs = d.getRs(pstmt);

        try {
            while (rs.next()) {
                String playDate = rs.getString("play_date");
                String startTime = rs.getString("start_time");

                DetailedDate_playDTO detailedDate_play = new DetailedDate_playDTO(playDate, startTime, startTime);
                list.add(detailedDate_play);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            d.close(conn, pstmt, rs);
        }
        return list;
    }

  

    
}
