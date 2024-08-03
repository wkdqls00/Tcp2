package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TicketlinkMainDao;
import dto.SearchResultDTO;

/**
 * Servlet implementation class SearchResult
 */
@WebServlet("/SearchResult")
public class SearchResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		TicketlinkMainDao dao = new TicketlinkMainDao();
		String input = request.getParameter("search");
		ArrayList<SearchResultDTO> list = dao.getSearchResult(input);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/ticketlink/searchResult.jsp").forward(request, response);
	}
}