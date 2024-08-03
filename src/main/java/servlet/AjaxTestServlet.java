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

@WebServlet("/AjaxTestServlet")
public class AjaxTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("요청 들어옴.");
		System.out.println("my_name_test : " + request.getParameter("my_name_test"));

		// (JSON으로 받기). (post_idx)
		int postIdx = Integer.parseInt(request.getParameter("post_idx"));
		HttpSession session = request.getSession();
		int userIdx = (Integer)session.getAttribute("userIdx");
		System.out.println("userIdx : " + userIdx);
		
		// Dao 호출
		InsertPostGoodDAO goodDao = new InsertPostGoodDAO();
		try {
			goodDao.insertPostGood(postIdx, userIdx);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
