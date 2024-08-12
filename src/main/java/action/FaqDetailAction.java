package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Customer_ServiceDAO;
import dto.FaqSelectDTO;

public class FaqDetailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int faq_idx = Integer.parseInt(request.getParameter("fi"));
		ArrayList<FaqSelectDTO> list = new Customer_ServiceDAO().faqSelectdto(faq_idx);
		request.setAttribute("list", list);
		request.getRequestDispatcher("ticketlink/Customer_Service_Center/Cs_FaqContent.jsp").forward(request, response);
		
	}

}
