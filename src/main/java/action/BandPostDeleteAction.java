package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpdateDelOkDAO;

public class BandPostDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		int post_idx = Integer.parseInt(request.getParameter("post_idx"));
		
		UpdateDelOkDAO udoDAO = new UpdateDelOkDAO();
		udoDAO.updateDelOk(post_idx);
		
		response.sendRedirect("Controller?command=band_home&meet_idx=" + meet_idx);

	}

}
