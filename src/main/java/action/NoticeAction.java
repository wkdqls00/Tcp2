package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Customer_ServiceDAO;
import dto.Customer_ServiceDTO;

public class NoticeAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Customer_ServiceDTO> csd = new Customer_ServiceDAO().customerserviceDto();
		request.setAttribute("csd", csd);
		request.getRequestDispatcher("/ticketlink/Customer_Service_Center/Cs_notice.jsp").forward(request, response);
	}


}
