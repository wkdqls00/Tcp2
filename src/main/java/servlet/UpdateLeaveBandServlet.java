package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpdateLeaveBandDAO;

@WebServlet("/UpdateLeaveBandServlet")
public class UpdateLeaveBandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UpdateLeaveBandDAO ulbDAO = new UpdateLeaveBandDAO();
		RequestDispatcher rd = request.getRequestDispatcher("ticket_project/band/updateLeaveBandPopup.jsp");
		rd.forward(request, response);
	}
}
