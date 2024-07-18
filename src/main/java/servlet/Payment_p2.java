package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PaymentDAO;


@WebServlet("/payment_p2")
public class Payment_p2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		int playinfo_idx = Integer.parseInt(request.getParameter("pi"));
		int payment_idx = Integer.parseInt(request.getParameter("pm"));
		int total_amount = Integer.parseInt(request.getParameter("totalamount"));
    	new PaymentDAO().updatePayment1(payment_idx, total_amount);
		response.sendRedirect("../../Tcp2/ticketlink/Pay/payment_p3.jsp?pi=" + playinfo_idx +"&pm=" + payment_idx);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
