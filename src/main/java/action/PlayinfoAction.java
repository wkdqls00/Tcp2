package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DetailedInfo_playDAO;
import dao.Exp_RatinglistDAO;
import dao.Exp_ratingcountDAO;
import dao.Genre_RankDAO;
import dao.GetDateDAO;
import dao.PlayHallLocationDAO;
import dao.Play_DetailedInfoDAO;
import dao.PlayinfoDetailDao;
import dao.ScriptwriteInDAO;
import dao.ScriptwritecountDAO;
import dao.SeatPriceDAO;
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

public class PlayinfoAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PlayinfoDetailDao dao = new PlayinfoDetailDao();
		
		//공연idx
		int play_idx = Integer.parseInt(request.getParameter("play_idx"));
		//공연장idx
		int playhall_idx = dao.getplayhall_idx(play_idx);
		//공연이름 장르 포스터url 날짜정보 
		ArrayList<Play_DetailedInfoDTO> list = dao.play_DetailedInfoDTO(play_idx);
	    //공연장이름 공연상세정보 얻는 메서드
		ArrayList<DetailedInfo_playDTO> dipd = dao.DetailedInfoDTO_play(play_idx);
	    //공연 좌석별 가격
		ArrayList<SeatPriceDTO> spdto = dao.selectSeatPrice(play_idx);
	    //공연장 위치정보
		ArrayList<PlayHallLocationDTO> phldto = dao.playHallLocationDto(playhall_idx);
		//관람후기댓글수
		int scriptCount = dao.scriptwritecountDto(play_idx);
		//기대평댓글수
		int expCount = dao.exp_ratingcountDto(play_idx);
		//기대평댓글불러오기
		ArrayList<Exp_RatingDTO> erd = dao.exp_RatinglistDto(play_idx);
		//관람후기 별점평균
		double staravg = dao.getstarRatingavg(play_idx);
		// 공연장 위도 경도값 저장
		ArrayList<PlayhallMapDTO> phmd = dao.playhallMap(play_idx);
		//공연 일정
		ArrayList<GetDateDTO> gdd = dao.getPlayinfo(play_idx);
		//추천공연
		ArrayList<RecommandPDTO> rpd = dao.recommendPDto();
		
		request.setAttribute("play_idx", play_idx);
		request.setAttribute("playhall_idx", playhall_idx);
		request.setAttribute("list", list);
		request.setAttribute("dipd", dipd);
		request.setAttribute("spdto", spdto);
		request.setAttribute("phldto", phldto);
		request.setAttribute("scriptCount", scriptCount);
		request.setAttribute("expCount", expCount);
		request.setAttribute("erd", erd);
		request.setAttribute("expCount", expCount);
		request.setAttribute("staravg", staravg);
		request.setAttribute("phmd", phmd);
		request.setAttribute("gdd", gdd);
		request.setAttribute("rpd", rpd);
	
		request.getRequestDispatcher("/ticketlink/Ranking_MainP/Ranking.jsp").forward(request, response);
	}

}
