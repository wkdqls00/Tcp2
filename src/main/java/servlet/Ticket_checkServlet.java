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
@WebServlet("/Ticket_checkServlet")
public class Ticket_checkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int userIdx =(int)hs.getAttribute("userIdx");
		Ticket_checkDao tcDao = new Ticket_checkDao();
		ArrayList<Ticket_checkDto> list = tcDao.checkReservationY(userIdx);
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/Ticket_check.jsp");
		rd.forward(request, response);
		for (Ticket_checkDto l : list) {
			System.out.println(l);
		}
	}
}
