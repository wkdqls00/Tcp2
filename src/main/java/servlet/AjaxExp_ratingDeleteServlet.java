package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import dao.Exp_ratingDeleteDAO;


@WebServlet("/AjaxExp_ratingDeleteServlet")
public class AjaxExp_ratingDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("요청 들어옴.");
	
		 // (JSON으로 받기). (post_idx)
		int Exp_rating_idx = Integer.parseInt(request.getParameter("Exp_rating_idx"));
		System.out.println(Exp_rating_idx);
	
		 // Dao 호출
		Exp_ratingDeleteDAO erdd = new Exp_ratingDeleteDAO();
		
		try {
			erdd.updateExp_ratingDelete(Exp_rating_idx);
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
