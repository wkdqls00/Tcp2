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
		//공연idx
		int play_idx = Integer.parseInt(request.getParameter("play_idx"));
		PlayinfoDetailDao dao = new PlayinfoDetailDao();
		//공연장idx
		int playhall_idx = dao.getplayhall_idx(play_idx);
		//공연이름 장르 포스터url 날짜정보 
		ArrayList<Play_DetailedInfoDTO> list = dao.play_DetailedInfoDTO(play_idx);
	    //공연장이름 공연상세정보 얻는 메서드
		ArrayList<DetailedInfo_playDTO> dipd = dao.DetailedInfoDTO_play(play_idx);
	    //공연 좌석별 가격
		ArrayList<SeatPriceDTO> spdto = dao.selectSeatPrice(play_idx);
		
		ArrayList<PlayHallLocationDTO> phldto = new PlayHallLocationDAO().playHallLocationDto(playhall_idx);

		ArrayList<ScriptwritecountDTO> swcd = new ScriptwritecountDAO().scriptwritecountDto(play_idx);

		ArrayList<Exp_RatingcountDTO> ercd = new Exp_ratingcountDAO().exp_ratingcountDto(play_idx);

		ArrayList<Exp_RatingDTO> erd = new Exp_RatinglistDAO().exp_RatinglistDto(play_idx);

		ScriptwriteInDAO swid = new ScriptwriteInDAO();
		double staravg = swid.getstarRatingavg(play_idx);

		ArrayList<PlayhallMapDTO> phmd = new PlayHallLocationDAO().playhallMap(play_idx);

		ArrayList<GetDateDTO> gdd = new GetDateDAO().getPlayinfo(play_idx);

		int rowNum = 5;

		ArrayList<RecommandPDTO> rpd = new Genre_RankDAO().recommendPDto();
		request.getRequestDispatcher("/ticketlink/Ranking_MainP/Ranking.jsp").forward(request, response);
	}

}
