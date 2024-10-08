package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dao.InsertPostGoodDAO;

@WebServlet("/AjaxPostGoodServlet")
public class AjaxPostGoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("요청 들어옴.");
		// (JSON으로 받기). (post_idx)
		int post_idx = Integer.parseInt(request.getParameter("post_idx"));
		int meet_member_idx = Integer.parseInt(request.getParameter("meet_member_idx"));
		//HttpSession session = request.getSession();
		//int userIdx = (Integer)session.getAttribute("userIdx");
		System.out.println(post_idx +", " + meet_member_idx);
		
		// Dao 호출
		InsertPostGoodDAO goodDao = new InsertPostGoodDAO();
		try {
			goodDao.insertPostGood(post_idx, meet_member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// JSON으로 보내기.
		String returnStr = "SUCCESS!";
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", returnStr);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(jsonObj);
	}
}
