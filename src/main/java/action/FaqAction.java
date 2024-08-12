package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Customer_ServiceDAO;
import dto.FaqDTO;

public class FaqAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<FaqDTO> fqd = new Customer_ServiceDAO().faqdto();
		request.setAttribute("fqd", fqd);
		request.getRequestDispatcher("/ticketlink/Customer_Service_Center/Cs_FAQ.jsp").forward(request, response);
	}

}
