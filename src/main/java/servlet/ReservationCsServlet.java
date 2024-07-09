package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Ticket_checkDao;


@WebServlet("/ReservationCsServlet")
public class ReservationCsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession hs = request.getSession();
		 int userIdx = (int)(hs.getAttribute("userIdx"));
		
		 
		
		 request.setAttribute("count", count);
		 RequestDispatcher rd = request.getRequestDispatcher("/ticketlink/Mypage/Ticket_check.jsp");
		 rd.forward(request, response);
	}
}
