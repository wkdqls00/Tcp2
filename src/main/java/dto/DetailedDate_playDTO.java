package dto;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class DetailedDate_playDTO {
    private String playDate;
    private String startTime;
    private String dayOfWeek;

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
    
    
    public DetailedDate_playDTO(String playDate, String startTime, String dayOfWeek) {
        this.playDate = playDate;
        this.startTime = startTime;
        this.dayOfWeek = dayOfWeek;
    }

    public String getPlayDate() {
        return playDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    @Override
    public String toString() {
        return "DetailedDate_playDTO [playDate=" + playDate + ", startTime=" + startTime + ", dayOfWeek=" + dayOfWeek + "]";
    }
}
