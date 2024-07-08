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

import dao.Ticket_checkDao;

/**
 * Servlet implementation class Ticket_checkServlet
 */
@WebServlet("/Ticket_checkServletR")
public class Ticket_checkServletR extends HttpServlet {
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
		ArrayList<Ticket_checkDto> list = tcDao.checkReservationR(userIdx, max, min);
		int count = tcDao.check_countR(userIdx);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		RequestDispatcher rd = request.getRequestDispatcher("/ticketlink/Mypage/Ticket_cancle.jsp");
		rd.forward(request, response);
		for (Ticket_checkDto l : list) {
			System.out.println(l);
		}
	}
}
