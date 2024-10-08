package action;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Customer_ServiceDAO;
import dao.Genre_RankDAO;
import dto.Customer_ServiceCDTO;
import dto.Genre_RankDTO;
import dto.RecentNoticeDTO;
import dto.Week_RDTO;
import dto.Week_RankDTO;


public class CsCenterAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<RecentNoticeDTO> list = new Customer_ServiceDAO().getRecentNotice();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/ticketlink/Customer_Service_Center/Cs_Center_main.jsp").forward(request, response);
	}

}
