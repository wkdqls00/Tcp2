package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TicketCountDao;
import dao.Ticket_checkDao;
import dto.Ticket_checkDto;

/**
 * Servlet implementation class Ticket_checkServlet
 */
@WebServlet("/Ticket_checkServlet")
public class Ticket_checkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int userIdx =(int)hs.getAttribute("userIdx");
		int currP = 1;
		String currP_ = request.getParameter("currP");
		if (currP_ != null && !currP_.equals("")) {
			currP = Integer.parseInt(currP_);
		}
		
		int max = currP * 5;
		int min = 1 + (currP - 1)*5;
		
		Ticket_checkDao tcDao = new Ticket_checkDao();
		ArrayList<Ticket_checkDto> list = tcDao.checkReservationY(userIdx, max, min);
		int count = tcDao.check_countY(userIdx);
		
		TicketCountDao tCountDao = new TicketCountDao();
		ArrayList<Integer> countList = new ArrayList<>();
		for(Ticket_checkDto l : list) {
			countList.add(tCountDao.ticketCount(l.getPayment_idx()));
		}
		
		request.setAttribute("countList", countList);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		RequestDispatcher rd = request.getRequestDispatcher("/ticketlink/Mypage/Ticket_check.jsp");
		rd.forward(request, response);
		for (Ticket_checkDto l : list) {
			System.out.println(l);
		}
	}
}
