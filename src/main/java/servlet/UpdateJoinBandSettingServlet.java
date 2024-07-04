package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpdateJoinBandSettingDAO;

@WebServlet("/UpdateJoinBandSettingServlet")
public class UpdateJoinBandSettingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UpdateJoinBandSettingDAO ujbsDAO = new UpdateJoinBandSettingDAO();
		
		RequestDispatcher rd = request.getRequestDispatcher("ticket_project/band/band_joining_condition.jsp");
		rd.forward(request, response);
	}
}
