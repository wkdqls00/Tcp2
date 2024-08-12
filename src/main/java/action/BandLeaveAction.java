package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UpdateLeaveBandDAO;

public class BandLeaveAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession hs = request.getSession();
		Integer member_idx = (Integer)request.getSession().getAttribute("userIdx");
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		
		UpdateLeaveBandDAO ulbDao = new UpdateLeaveBandDAO();
		ulbDao.updateLeaveBand(meet_idx, member_idx);
		request.setAttribute("meet_idx", meet_idx);
		request.setAttribute("member_idx", member_idx);
		request.getRequestDispatcher("/Controller?command=band_main").forward(request, response);
	}

}
