import java.util.ArrayList;

import dao.Play_DetailedInfoDAO;
import dao.ScriptwriteDAO;
import dao.SeatPriceDAO;
import dao.SeatStatusDAO;
import dto.Play_DetailedInfoDTO;
import dto.ScriptwriteDTO;
import dto.SeatPriceDTO;
import dto.SeatStatusDTO;

public class Test1 {

	public static void main(String[] args) {
		
//	int play_idx = Integer.parseInt(request.getParameter("play_idx"));
//		int play_idx = 1;
//		
//		ArrayList<Play_DetailedInfoDTO> list = new Play_DetailedInfoDAO().play_DetailedInfoDTO(play_idx);
//		
//		System.out.println(list.get(0).getStartDate());
//		System.out.println();
//		System.out.println(list.get(0).getEndDate());
//		System.out.println();
//		System.out.println(list.get(0).getGenreName());
//		System.out.println();
//		System.out.println(list.get(0).getPlayName());
//		System.out.println();
//
//		System.out.println(list.get(0).getInfo());
//		System.out.println();
//		System.out.println(list.get(0).getPosterUrl());
//		
		int play_idx = 486;
		int playinfo_idx = 29645;
		
		ArrayList<SeatStatusDTO> seatstatuslist = new SeatStatusDAO().getSeatStatus(play_idx, playinfo_idx);
		ArrayList<SeatPriceDTO> pricelist = new SeatPriceDAO().selectSeatPrice(play_idx);
			
		for (int i = 0; i < pricelist.size(); i++) {
			int leftseat[] = new int[4];
			   if(pricelist.size() == 1){
			      for(int j = 0; j < seatstatuslist.size(); j++){
			         leftseat[0] += seatstatuslist.get(j).getCount();
			      }
			   }
			   else if(pricelist.size() == 2){
			      leftseat[0] = seatstatuslist.get(0).getCount();
			      for(int j = 1; j < seatstatuslist.size(); j++){
			         leftseat[1] += seatstatuslist.get(j).getCount();
			      }
			   }
			   else if(pricelist.size() == 3){
			      leftseat[0] = seatstatuslist.get(0).getCount();
			      leftseat[1] = seatstatuslist.get(1).getCount();
			      for(int j = 2; j < seatstatuslist.size(); j++){
			         leftseat[2] += seatstatuslist.get(j).getCount();
			      }
			   }
			   else if(pricelist.size() == 4){
			      leftseat[0] = seatstatuslist.get(0).getCount();
			      leftseat[1] = seatstatuslist.get(1).getCount();
			      leftseat[2] = seatstatuslist.get(2).getCount();
			      for(int j = 3; j < seatstatuslist.size(); j++){
			         leftseat[3] += seatstatuslist.get(j).getCount();
			      }
			   }
	

		}		
	
    }
}