package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PayDao;
import dto.GetPlayIdxDTO;
import dto.SeatDTO;
import dto.SeatPriceDTO;
import dto.SeatStatusDTO;
import dto.Selectpayment_p1DTO;

public class Payment0Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("pay0실행중");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		Integer userIdx = (Integer) request.getSession().getAttribute("userIdx");

		System.out.println("user : " + userIdx);
		if (userIdx == null) {
			out.println("<html>");
			out.println("<head>");
			out.println("<title></title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='/Tcp2/ticketlink/Login/Login.jsp'");
			out.println("</script>");
			out.println("</body>");
			out.println("</html>");
			return;
		}
		int playinfo_idx = Integer.parseInt(request.getParameter("pi"));
		PayDao dao = new PayDao();
		dao.deleteUnpaidRecords();
		ArrayList<GetPlayIdxDTO> idxlist = dao.getidxlist(playinfo_idx);
		int play_idx = idxlist.get(0).getPlay_idx();
		int playhall_idx = idxlist.get(0).getPlayhall_idx();
		ArrayList<SeatStatusDTO> list = dao.getSeatStatus(playhall_idx, playinfo_idx);
		ArrayList<String> slist = dao.selectSeatChart(playinfo_idx);
		ArrayList<SeatPriceDTO> pricelist = dao.selectSeatPrice(play_idx);
		System.out.println(pricelist.get(0));
		ArrayList<Selectpayment_p1DTO> playinfo = dao.Selectpayment_p1(playinfo_idx);
		String[] color = { "#ED1C24", "#3F48CC", "#FFF200", "#22B14C" };
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

}
