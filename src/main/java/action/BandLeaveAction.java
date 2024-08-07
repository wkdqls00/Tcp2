package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpdateLeaveBandDAO;

public class BandLeaveAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		int member_idx = Integer.parseInt(request.getParameter("member_idx"));
		
		UpdateLeaveBandDAO ulbDao = new UpdateLeaveBandDAO();
		ulbDao.updateLeaveBand(meet_idx, member_idx);
		request.setAttribute("meet_idx", meet_idx);
		request.setAttribute("member_idx", member_idx);
		request.getRequestDispatcher("band/band_setting.jsp").forward(request, response);
	}

}
