package action;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Genre_RankDAO;
import dto.Genre_RankDTO;
import dto.Week_RDTO;
import dto.Week_RankDTO;


public class RankingAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   ArrayList<Genre_RankDTO> list =  new Genre_RankDAO().selectGenre_RankDTO(1);
		   ArrayList<Week_RankDTO> wrd = new Genre_RankDAO().weekRankDto(5);
		   ArrayList<Week_RDTO> wr = new Genre_RankDAO().weekRDto(5);
		   request.setAttribute("list", list);
		   request.setAttribute("wrd", wrd);
		   request.setAttribute("wr", wr);
		   request.getRequestDispatcher("/ticketlink/Ranking_MainP/weekly_ranking3.jsp").forward(request, response);
	}

}
