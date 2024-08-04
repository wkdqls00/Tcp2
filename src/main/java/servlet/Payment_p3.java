package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PayDao;

/**
 * Servlet implementation class Payment_p3
 */
@WebServlet("/Payment_p3")
public class Payment_p3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		PayDao dao = new PayDao();
		int payment_idx = Integer.parseInt(request.getParameter("pm"));
		dao.updatePayment2(payment_idx);
		request.getRequestDispatcher("/ticketlink/Pay/paymentcomplete.jsp").forward(request, response);
		
		
		
		
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
