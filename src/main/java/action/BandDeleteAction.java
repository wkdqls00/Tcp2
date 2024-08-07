package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BandDeleteDAO;

public class BandDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		int member_idx = Integer.parseInt(request.getParameter("member_idx"));
		
		BandDeleteDAO bdDAO = new BandDeleteDAO();
		bdDAO.bandDelete(meet_idx);
		request.getRequestDispatcher("band/myband_setting_leader.jsp").forward(request, response);
	}

}
