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

import dao.PayDao;
import dto.GetDateDTO;
import dto.GetPlayIdxDTO;
import dto.LeftSeatDTO;
import dto.SeatPriceDTO;
import dto.SeatStatusDTO;

@WebServlet("/EpTransferServlet")
public class EpTransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println(request.getParameter("playinfo_idx"));

		int playinfo_idx = Integer.parseInt(request.getParameter("playinfo_idx"));

		PayDao dao = new PayDao();
		ArrayList<GetPlayIdxDTO> idxlist = dao.getidxlist(playinfo_idx);
		int play_idx = idxlist.get(0).getPlay_idx();
		int playhall_idx = idxlist.get(0).getPlayhall_idx();

		ArrayList<SeatStatusDTO> list = dao.getSeatStatus(playhall_idx, playinfo_idx);
		ArrayList<SeatPriceDTO> pricelist = dao.selectSeatPrice(play_idx);

		ArrayList<LeftSeatDTO> seatst = new ArrayList<LeftSeatDTO>();

		for (int i = 0; i < pricelist.size(); i++) {
			int leftseat[] = new int[4];
			if (pricelist.size() == 1) {
			}

			// leftseat 배열에 값 할당
			for (int j = 0; j < list.size(); j++) {
				if (j < pricelist.size() - 1) {
					leftseat[j] = list.get(j).getCount();
				} else {
					leftseat[pricelist.size() - 1] += list.get(j).getCount();
				}
			}
			seatst.add(new LeftSeatDTO(pricelist.get(i).getRank(), leftseat[i] == 0 ? "매진" : leftseat[i] + "석"));
		}

		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();

		JSONArray array1 = new JSONArray();
		for (LeftSeatDTO ls : seatst) {
			System.out.println(ls);
			JSONObject obj = new JSONObject();
			obj.put("rank", ls.getRank());
			obj.put("leftseat", ls.getLeftseat());
			array1.add(obj);
		}
		writer.print(array1);
	}
}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}
