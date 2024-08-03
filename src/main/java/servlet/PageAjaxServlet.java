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

import dao.ScriptwriteDAO;
import dto.ScriptwriteDTO;


@WebServlet("/PageAjaxServlet")
public class PageAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("요청 들어옴 PageAjaxServlet.");
		int pageNum = Integer.parseInt(request.getParameter("page_num"));
		int play_idx = Integer.parseInt(request.getParameter("play_idx"));
		System.out.println(play_idx);
		ScriptwriteDAO swd = new ScriptwriteDAO();
		ArrayList<ScriptwriteDTO> list = null;
		try {
			list = swd.getscriptwriteByPageNum(pageNum, play_idx);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		JSONArray array = new JSONArray();
		for (ScriptwriteDTO dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("email", dto.getEmail());
			obj.put("content", dto.getContent());
			obj.put("starRating", dto.getStarRating());
			obj.put("title", dto.getTitle());
			obj.put("del_ok", dto.getDelOk());
			obj.put("regdate", dto.getRegDate());
			obj.put("script_idx", dto.getScript_idx());
			array.add(obj);
		}
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(array);
		
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//	}

}
