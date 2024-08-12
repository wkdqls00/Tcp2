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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		TicketlinkMainDao dao = new TicketlinkMainDao();
		ArrayList<SearchResultDTO> list = dao.getPopular();
		ArrayList<RecommandPDTO> list2 = dao.recommandPDao();
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		Integer userIdx = (Integer)request.getSession().getAttribute("userIdx");
		request.setAttribute("userIdx", userIdx);
		request.getRequestDispatcher("/ticketlink/main.jsp").forward(request, response);
	}
}
