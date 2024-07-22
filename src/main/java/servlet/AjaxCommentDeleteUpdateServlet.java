package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MeetCommentDeleteUpdateDAO;

@WebServlet("/AjaxCommentDeleteUpdateServlet")
public class AjaxCommentDeleteUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("요청 들어옴.");
		// (JSON으로 받기).
		int comment_idx = Integer.parseInt(request.getParameter("comment_idx"));

		System.out.println(comment_idx);
		
		// Dao 호출
		MeetCommentDeleteUpdateDAO cmdDao = new MeetCommentDeleteUpdateDAO();
		cmdDao.meetCommentDeleteUpdate(comment_idx);
		
		// JSON으로 보내기.
		String returnStr = "SUCCESS!";
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", returnStr);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(jsonObj);
		
	}

}
