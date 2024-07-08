package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ScriptManagementDao;
import dto.ScriptManagementDto;
@WebServlet("/ScriptManagementServletE")
public class ScriptManagementServletE extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int userIdx = (int) hs.getAttribute("userIdx");
		ScriptManagementDao smdao = new ScriptManagementDao();
		ArrayList<ScriptManagementDto> list = smdao.selectScriptManagementE(userIdx);
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/ticketlink/Mypage/review_exhibition.jsp");
		rd.forward(request, response);
		for (ScriptManagementDto l : list) {
			System.out.println(l);
		}
	}

}
