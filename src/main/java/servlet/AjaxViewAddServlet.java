package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dao.InsertPostGoodDAO;
import dao.MeetPostListPrintDAO;

@WebServlet("/AjaxViewAddServlet")
public class AjaxViewAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("요청 들어옴.");

		// (JSON으로 받기). (post_idx)
		int postIdx = Integer.parseInt(request.getParameter("post_idx"));
		HttpSession session = request.getSession();
		
		// Dao 호출
		MeetPostListPrintDAO viewDao = new MeetPostListPrintDAO();
		viewDao.postViewAdd(postIdx);
		
		// JSON으로 보내기.
		String returnStr = "SUCCESS!";
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", returnStr);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(jsonObj);
	}
}
