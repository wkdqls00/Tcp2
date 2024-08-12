package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Customer_ServiceDAO;
import dto.Customer_ServiceCDTO;

public class NoticeDetailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int notice_idx = Integer.parseInt(request.getParameter("ni"));
		Customer_ServiceDAO dao = new Customer_ServiceDAO();
		dao.addViews(notice_idx);
		ArrayList<Customer_ServiceCDTO> list = dao.customerserviceContent(notice_idx);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/ticketlink/Customer_Service_Center/Cs_noticeContent.jsp").forward(request, response);
	}

}
