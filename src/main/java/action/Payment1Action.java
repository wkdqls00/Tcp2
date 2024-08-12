package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PayDao;
import dto.GetPlayIdxDTO;
import dto.ReservedSeatInfoDTO;
import dto.SeatPriceDTO;
import dto.SelectPayment_p2DTO;


public class Payment1Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Integer member_idx = (Integer)request.getSession().getAttribute("userIdx");
		String selectedSeats = request.getParameter("selectedSeats");
		
		PayDao dao = new PayDao();
		int playinfo_idx = Integer.parseInt(request.getParameter("idx"));
		ArrayList<GetPlayIdxDTO> idxlist = dao.getidxlist(playinfo_idx);
		int play_idx = idxlist.get(0).getPlay_idx();
		ArrayList<SelectPayment_p2DTO> p2dto = dao.Selectpayment_p2(playinfo_idx);
		ArrayList<SeatPriceDTO> pricelist = dao.selectSeatPrice(play_idx);
		out.println("<html>");
		out.println("<head>");
		out.println("<title></title>");
		out.println("</head>");
		out.println("<body>");

		if (selectedSeats == null || selectedSeats.isEmpty()) {
			out.println("<script type='text/javascript'>");
			out.println("alert('좌석이 선택되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			String[] seatIds = selectedSeats.split(",");
			for(int i = 0; i < seatIds.length; i++) {
				System.out.println(dao.checkpaymentseat(Integer.parseInt(seatIds[i]), playinfo_idx));
				if(!(dao.checkpaymentseat(Integer.parseInt(seatIds[i]), playinfo_idx))) {
					System.out.println(seatIds[i] + "실행되는중");
					out.println("<script type='text/javascript'>");
					out.println("alert('이미 예약된 좌석입니다. 다시 시도해주세요.');");
					out.println("location.href='Payment_p0?pi=" + playinfo_idx + "'");
					out.println("</script>");
					return;
				}
			}
			int payment_idx = dao.insertPayment(member_idx, playinfo_idx, seatIds);//결제테이블 insert하고 리턴값으로 payment_idx 가져옴
			ArrayList<ReservedSeatInfoDTO> rsidto = dao.selectSeat(payment_idx);//결제하려는좌석 
			String time_limit = dao.getTimeLimit(payment_idx);
			request.setAttribute("pi", playinfo_idx);
			request.setAttribute("pm", payment_idx);
			request.setAttribute("p2dto", p2dto);
			request.setAttribute("pricelist", pricelist);
			request.setAttribute("rsidto", rsidto);		
			request.setAttribute("time_limit", time_limit);
			request.getRequestDispatcher("/ticketlink/Pay/payment_p2.jsp").forward(request, response);

		}
		out.println("</body>");
		out.println("</html>");
		
		
	}

}
