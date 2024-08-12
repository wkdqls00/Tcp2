package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PayDao;


public class Payment3Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PayDao dao = new PayDao();
		int payment_idx = Integer.parseInt(request.getParameter("pm"));
		String type = request.getParameter("type");
		dao.updatePayment2(payment_idx, type);
		request.getRequestDispatcher("/ticketlink/Pay/paycomplete.html").forward(request, response);

				
	}

}
