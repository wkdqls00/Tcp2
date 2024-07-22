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
import dao.Ticket_checkPeriodDao;
import dto.Ticket_checkDto;

/**
 * Servlet implementation class Ticket_checkPeriodServlet
 */
@WebServlet("/Ticket_checkMonthRServlet")
public class Ticket_checkMonthRServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int userIdx = (int)hs.getAttribute("userIdx");
		int year = Integer.parseInt(request.getParameter("year"));
		String viOrRe_ = request.getParameter("viOrRe");
		String viOrRe = null;
		String month = (request.getParameter("month"));
		int page = 1;
		String page_ = request.getParameter("currP");
		
		if (page_ != null && !page_.equals("")) {
			page = Integer.parseInt(page_);
		}
		
		if (viOrRe_.equals("예매일")) {
			viOrRe = "pay.pay_date";
		} else if(viOrRe_.equals("관람일")) {
			viOrRe = "p.start_date";
		}
		
		int max = page * 10;
		int min = 1 + (page-1) * 10;
		Ticket_checkPeriodDao tcpdao = new Ticket_checkPeriodDao();
		ArrayList<Ticket_checkDto> list = tcpdao.checkMonthR(userIdx, max, min, year, month, viOrRe);
		int count = tcpdao.checkMonthR_count(userIdx, year, month, viOrRe);
		
		TicketCountDao tCountDao = new TicketCountDao();
		ArrayList<Integer> countList = new ArrayList<>();
		for(Ticket_checkDto l : list) {
			countList.add(tCountDao.ticketCount(l.getPayment_idx()));
		}
		
		request.setAttribute("countList", countList);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		request.getRequestDispatcher("/ticketlink/Mypage/Ticket_checkMonthR.jsp").forward(request, response);
		
	}
}
