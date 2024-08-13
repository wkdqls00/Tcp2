package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.ScriptManagementDao;
import dto.ScriptManagementDto;


public class ScriptManagementCAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int cp = 1;
		String cp_ = request.getParameter("cp");
		if (cp_ != null && !cp_.equals("")) 
			cp = Integer.parseInt(cp_);
		int min = 1 + (cp-1) * 5;
		int max = cp * 5;
		int userIdx = (int) hs.getAttribute("userIdx");
		
		ScriptManagementDao smdao = new ScriptManagementDao();
		ArrayList<ScriptManagementDto> list = smdao.selectScriptManagementC(userIdx, max, min);
		int count = smdao.scriptCountC(userIdx);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		RequestDispatcher rd = request.getRequestDispatcher("/ticketlink/Mypage/review_concert.jsp");
		rd.forward(request, response);
//		for (ScriptManagementDto l : list) {
//			System.out.println(l);
//		}
	}

}
