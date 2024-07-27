import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import dao.DetailedInfo_playDAO;
import dao.Exp_RatingDAO;
import dao.Exp_RatinglistDAO;
import dto.DetailedInfo_playDTO;
import dto.Exp_RatingDTO;



public class Text {
	public static void main(String[] args) {
//	
//		int playhall_idx= 697;
//		ArrayList<PlayHallLocationDTO> phldto = new PlayHallLocationDAO().playHallLocationDto(playhall_idx);
////		System.out.println(phldto.size());
//		System.out.println(phldto.get(0).getPhone_No());
//		System.out.println(phldto.get(0).getAddress());
//		System.out.println(phldto.get(0).getPlayHallName());
		
//		int play_idx = 486;
//		
//		ArrayList<DetailedInfo_playDTO> dipd = new DetailedInfo_playDAO().DetailedInfoDTO_play(play_idx);
//		
//		 String[] startDate = dipd.get(0).getStartDate().split(" ");
//		 String[] endDate = dipd.get(0).getEndDate().split(" ");
//		
//		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMdd");
//		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 M월 d일 (E)");
//
//		String[] selectstartDate = dipd.get(0).getStartDate().split("");
//		String[] selectendDate = dipd.get(0).getEndDate().split("");
//
//	       try {
//	            // 원본 날짜 문자열을 얻습니다.
//	            String startDateStr = dipd.get(0).getStartDate();
//	            String endDateStr = dipd.get(0).getEndDate();
//	            
//	            // 문자열을 날짜 객체로 변환합니다.
//	            Date startDateObj = inputFormat.parse(startDateStr);
//	            Date endDateObj = inputFormat.parse(endDateStr);
//	            
//	            // 원하는 형식으로 날짜를 변환합니다.
//	            String formattedStartDate = outputFormat.format(startDateObj);
//	            String formattedEndDate = outputFormat.format(endDateObj);
//	            
//	            // 변환된 날짜를 출력합니다.
//	            System.out.println(formattedStartDate);
//	            System.out.println(formattedEndDate);
//	            
//	        } catch (ParseException e) {
//	            e.printStackTrace();
//	        }
//	    }
//	
		
		int play_idx = 486;
//
		ArrayList<DetailedInfo_playDTO> dipd = new DetailedInfo_playDAO().DetailedInfoDTO_play(play_idx);

		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 M월 d일 (E)");

//		try {
		    // 원본 날짜 문자열을 배열로 얻습니다.
		    String[] startDateStr = dipd.get(0).getStartDate().split("");
		    String[] endDateStr = dipd.get(0).getEndDate().split("");

//		    System.out.println(.toString());
		    
		    
		    // 배열을 문자열로 결합합니다.
//		    String startDateString = String.join("", startDateStr);
//		    String endDateString = String.join("", endDateStr);
//
//		    // 문자열을 날짜 객체로 변환합니다.
//		    Date startDateObj = inputFormat.parse(startDateString);
//		    Date endDateObj = inputFormat.parse(endDateString);
//
//		    // 원하는 형식으로 날짜를 변환합니다.
//		    String formattedStartDate = outputFormat.format(startDateObj);
//		    String formattedEndDate = outputFormat.format(endDateObj);
//
//		    // 변환된 날짜를 출력합니다.
//		    System.out.println(formattedStartDate);
//		    System.out.println(formattedEndDate);
//
//		} catch (ParseException e) {
//		    e.printStackTrace();
//		}
		
		
		
//		ArrayList<Exp_RatingDTO> erd = new Exp_RatinglistDAO().exp_RatinglistDto(play_idx);
//		
//		System.out.println(erd.get(0).getContent());
//		
		
//	       System.out.println(Arrays.toString(selectstartDate));
//	        System.out.println(Arrays.toString(selectendDate));
	 
	               
	   

	        // DetailedInfo_playDTO와 DetailedInfo_playDAO 클래스는 다른 곳에 정의되어 있다고 가정합니다.

//		Date sd, ed;
//		try {
//			sd = inputFormat.parse(String.join("", selectstartDate));
//		    ed = inputFormat.parse(String.join("", selectendDate));
//		    String formattedstartDate = outputFormat.format(sd);
//		    String formattedendDate = outputFormat.format(ed);
//		    System.out.println(formattedstartDate);			
//		    System.out.println(formattedstartDate);			
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
		
//		int area_idx = 1;
//		String date = "20240416";
////		
//		
//
//		
//		System.out.println(list.get(0).getStartDate());
//		String[] startDate = list.get(0).getStartDate().split(" ");
//		String[] endDate = list.get(0).getEndDate().split(" ");
//		
//		System.out.println(s[0]);
//				
		
//		
//		Area_RankDAO ardao = new Area_RankDAO();
//		ArrayList<Area_RankDTO> list = new ArrayList<>();
//		
//		 list = ardao.selectAreaRankDTO(area_idx, date);
//		ArrayList<Area_RankDTO> list = new Area_RankDAO().selectAreaRankDTO(area_idx, date);
		
		
		
		
		
//		 
//		System.out.println(list.get(0).getAreaName());	
//
//		System.out.println(list.get(0).getBookingRate());
//		System.out.println(list.get(0).getEndDate());
//		System.out.println(list.get(0).getPlayHallName());
//		System.out.println(list.get(0).getPlayName());
//		System.out.println(list.get(0).getPosterUrl());
//		System.out.println(list.get(0).getRegDate());
//		System.out.println(list.get(0).getStartDate());
//		
//		list.get(0).getAreaName();
//		
//		list.get(0).getPlayName();
//		list.get(0).getPlayHallName();		
//		list.get(0).getStartDate();
//		list.get(0).getEndDate();
//		list.get(0).getBookingRate();
//		
//		
//		list.get(0).getPosterUrl();
//		list.get(0).getRegDate();
//		
//		int play_idx = 486;
//		String date = "4월 5일";
//	
//		ArrayList<Detailed_playDTO> dpd = new Detailed_playDAO().DetailedDTO_play(play_idx, date);
//		
//		for(Detailed_playDTO d : dpd) System.out.println(d);
		
		
//		ArrayList<DetailedInfo_playDTO> dipd = new DetailedInfo_playDAO().DetailedInfoDTO_play(play_idx);
//		
//		System.out.println(dipd.get(0).getCast());
//		System.out.println(dipd.get(0).getCrew());
//		dipd.get(0).getCast();
//		dipd.get(0).getCrew();
		
//	    Detailed_playDAO dao = new Detailed_playDAO();
//	    ArrayList<Detailed_playDTO> playList = dao.DetailedDTO_play(1, "20240405");
//	    
//	    
//		String date = "2024년 4월 5일";
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 M월 d일");
//		Calendar cal = Calendar.getInstance();
//		try {
//			cal.setTime(sdf.parse(date));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
//		String[] days = {"", "일", "월", "화", "수", "목", "금", "토"};
//		String dayOfWeekString = days[dayOfWeek];
//		
//		System.out.println(dayOfWeekString);
//		
	}
	
}
