package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeleteBandDAO;

@WebServlet("/AjaxJoinDeleteServlet")
public class AjaxJoinDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		int member_idx = Integer.parseInt(request.getParameter("member_idx"));
		
		System.out.println(meet_idx +", "+ member_idx);
		
		DeleteBandDAO deleteDAO = new DeleteBandDAO();
		deleteDAO.joinDelete(meet_idx, member_idx);
				
				
	}
}