package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.GetDateDAO;
import dto.GetDateDTO;


@WebServlet("/GetDateServlet")
public class GetDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String selectedDate = request.getParameter("selectedDate");
		int playIdx = Integer.parseInt(request.getParameter("play_idx"));
		int year = Integer.parseInt(selectedDate.substring(0,4));
		int month = Integer.parseInt(selectedDate.substring(4,6));
		int date = Integer.parseInt(selectedDate.substring(6));
		
		GetDateDAO gdDao = new GetDateDAO();
		ArrayList<GetDateDTO> listDate = gdDao.getPlayinfo(year + "년 " + month + "월 " + date + "일", playIdx);
		
		// JSON ---> ...DTO    .put()
		// JSON-ARRAY ---> ArrayList<...DTO>      .add()
		
		// AJAX응답
		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		JSONArray array1 = new JSONArray();
		for(GetDateDTO dto : listDate) {
			int playinfoIdx = dto.getPlayinfo_idx();
			String startTime = dto.getStart_time();
			JSONObject obj = new JSONObject();
			obj.put("playinfo_idx", playinfoIdx);
			obj.put("start_time", startTime);
			array1.add(obj);
		}
		writer.print(array1);
	}
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
