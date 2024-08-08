package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TicketlinkMainDao;
import dto.RecommandPDTO;
import dto.SearchResultDTO;


public class MainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TicketlinkMainDao dao = new TicketlinkMainDao();
		ArrayList<SearchResultDTO> list = dao.getPopular();
		ArrayList<RecommandPDTO> list2 = dao.recommandPDao();
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.getRequestDispatcher("/ticketlink/main.jsp").forward(request, response);
	}
}
