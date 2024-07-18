package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PaymentDAO;

@WebServlet("/payment_p1")
public class Payment_p1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int member_idx = 2;
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String selectedSeats = request.getParameter("selectedSeats");
		int playinfo_idx = Integer.parseInt(request.getParameter("idx"));

		out.println("<html>");
		out.println("<head>");
		out.println("<title>Alert Example</title>");
		out.println("</head>");
		out.println("<body>");

		if (selectedSeats == null || selectedSeats.isEmpty()) {
			out.println("<script type='text/javascript'>");
			out.println("alert('좌석이 선택되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			String[] seatIds = selectedSeats.split(",");
			int payment_idx = new PaymentDAO().insertPayment(member_idx, playinfo_idx, seatIds);
			response.sendRedirect("../../Tcp2/ticketlink/Pay/payment_p2.jsp?pi=" + playinfo_idx + "&pm=" + payment_idx + "&selectedSeats=" + selectedSeats);
				
		}
		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
