package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TicketCountDao;
import dao.Ticket_checkDao;
import dao.Ticket_checkPeriodDao;
import dto.Ticket_checkDto;


public class Ticket_checkPeriodRAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int userIdx = (int)hs.getAttribute("userIdx");
		int day = Integer.parseInt(request.getParameter("day"));
		System.out.println(day);
		int page = 1;
		String page_ = request.getParameter("currP");
		if (page_ != null && !page_.equals("")) {
			page = Integer.parseInt(page_);
		}
		
		int max = page * 10;
		int min = 1 + (page-1) * 10;
		Ticket_checkPeriodDao tcpdao = new Ticket_checkPeriodDao();
		ArrayList<Ticket_checkDto> list = tcpdao.checkDayR(userIdx, max, min, day);
		int count = tcpdao.checkDayR_count(userIdx, day);
		
		TicketCountDao tCountDao = new TicketCountDao();
		ArrayList<Integer> countList = new ArrayList<>();
		for(Ticket_checkDto l : list) {
			countList.add(tCountDao.ticketCount(l.getPayment_idx()));
		}
		
		request.setAttribute("countList", countList);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		if(day == 15)
			request.getRequestDispatcher("/ticketlink/Mypage/Ticket_cancle15.jsp").forward(request, response);
		else if(day == 30)                                           
			request.getRequestDispatcher("/ticketlink/Mypage/Ticket_cancle30.jsp").forward(request, response);
		else if(day == 60)                                        
			request.getRequestDispatcher("/ticketlink/Mypage/Ticket_cancle60.jsp").forward(request, response);
		else if(day == 90)                                          
			request.getRequestDispatcher("/ticketlink/Mypage/Ticket_cancle90.jsp").forward(request, response);
	}
}
