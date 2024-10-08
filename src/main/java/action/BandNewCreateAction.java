package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BandNewCreateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession hs = request.getSession();
		Integer member_idx = (Integer)request.getSession().getAttribute("userIdx");
		
		request.setAttribute("member_idx", member_idx);
		RequestDispatcher rd = request.getRequestDispatcher("band/band_new_create.jsp");
		rd.forward(request, response);
		
	}

}
