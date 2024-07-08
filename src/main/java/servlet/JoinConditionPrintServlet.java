package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JoinConditionPrintDAO;

@WebServlet("/JoinConditionPrintServlet")
public class JoinConditionPrintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JoinConditionPrintDAO jcpDAO = new JoinConditionPrintDAO();
		RequestDispatcher rd = request.getRequestDispatcher("band/band_joining_condition.jsp");
		rd.forward(request, response);
	}
}
