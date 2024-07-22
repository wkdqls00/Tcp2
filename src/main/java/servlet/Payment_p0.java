package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import dto.*;

@WebServlet("/Payment_p0")
public class Payment_p0 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int playinfo_idx = Integer.parseInt(request.getParameter("pi"));
		PayDao dao = new PayDao();

		ArrayList<GetPlayIdxDTO> idxlist = dao.getidxlist(playinfo_idx);
		int play_idx = idxlist.get(0).getPlay_idx();
		int playhall_idx = idxlist.get(0).getPlayhall_idx();
		ArrayList<SeatStatusDTO> list = dao.getSeatStatus(playhall_idx, playinfo_idx);
		ArrayList<String> slist = dao.selectSeatChart(playinfo_idx);
		ArrayList<SeatPriceDTO> pricelist = dao.selectSeatPrice(play_idx);
		System.out.println(pricelist.get(0));
		ArrayList<Selectpayment_p1DTO> playinfo = dao.Selectpayment_p1(playinfo_idx);
		String[] color = {"#ED1C24", "#3F48CC", "#FFF200", "#22B14C"};
		ArrayList<SeatDTO> seat = dao.getSeatlist(playhall_idx);
		String seatImg = dao.getSeatImg(playhall_idx);
		request.setAttribute("pi", play_idx);
		request.setAttribute("idxlist", idxlist);
		request.setAttribute("list", list);
		request.setAttribute("slist", slist);
		request.setAttribute("pricelist", pricelist);
		request.setAttribute("playinfo", playinfo);
		request.setAttribute("seat", seat);
		request.setAttribute("seatImg", seatImg);
		request.setAttribute("color", color);
		request.getRequestDispatcher("/ticketlink/Pay/payment_p1.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
