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

import dao.Genre_RankDAO;
import dto.Genre_RankDTO;
import project.DatabaseUtil;


@WebServlet("/AjaxRankingServlet")
public class AjaxRankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		int genre_idx = Integer.parseInt(request.getParameter("genre_idx"));
        String date = request.getParameter("date");
		PrintWriter writer = response.getWriter();

        System.out.println(date);
        System.out.println(genre_idx);
        ArrayList<Genre_RankDTO> list = new ArrayList<>();
        try {
            DatabaseUtil d = new DatabaseUtil();
            list = new Genre_RankDAO().selectGenre_RankDTO(genre_idx);// 장르에 따른 랭킹 데이터 조회
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("genre_idx", genre_idx);
        request.setAttribute("list", list);
		JSONArray array1 = new JSONArray();
		for(Genre_RankDTO dto : list) {
			 String regDate = dto.getRegDate();
			 String playName = dto.getPlayName();
			 String playStartDate = dto.getPlayStartDate();
			 String playEndDate = dto.getPlayEndDate();
			 double playBookRate = dto.getPlayBookRate();
			 String poster_URL = dto.getPoster_URL();
			 String playHallName = dto.getPlayHallName();
			 int play_idx = dto.getPlay_idx();
			 JSONObject obj = new JSONObject();
			 obj.put("regDate", regDate);
			 obj.put("playName", playName );
			 obj.put("playStartDate", playStartDate);
			 obj.put("playEndDate", playEndDate);
			 obj.put("playBookRate", playBookRate);
			 obj.put("poster_URL", poster_URL);
			 obj.put("playHallName", playHallName);
			 obj.put("play_idx", play_idx);
			array1.add(obj);
		}
			 writer.print(array1);
			 System.out.println("ajax요청완료됨");
    }
//	
//		JSONObject obj = new JSONObject();
//		obj.put("playinfo_idx", playinfoIdx);
//		obj.put("start_time", startTime);
//		array1.add(obj);
//	}
//	writer.print(array1);



	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
