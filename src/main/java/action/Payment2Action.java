package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PayDao;
import dto.CustomerPayinfoDTO;
import dto.GetPlayIdxDTO;
import dto.ReservedSeatInfoDTO;
import dto.SeatPriceDTO;
import dto.SelectPayment_p2DTO;


public class Payment2Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		int playinfo_idx = Integer.parseInt(request.getParameter("pi"));
		int payment_idx = Integer.parseInt(request.getParameter("pm"));
		int total_amount = Integer.parseInt(request.getParameter("totalamount"));
		Integer userIdx = (Integer)request.getSession().getAttribute("userIdx");
		PayDao dao = new PayDao();
		ArrayList<GetPlayIdxDTO> idxlist = dao.getidxlist(playinfo_idx);
		int play_idx = idxlist.get(0).getPlay_idx();
    	dao.updatePayment1(payment_idx, total_amount);
		ArrayList<SelectPayment_p2DTO> p2dto = dao.Selectpayment_p2(playinfo_idx);
		ArrayList<ReservedSeatInfoDTO> rsidto = dao.selectSeat(payment_idx);//결제하려는좌석 
		ArrayList<CustomerPayinfoDTO> cpdto = dao.getCustomerPayinfo(payment_idx);
		ArrayList<SeatPriceDTO> pricelist = dao.selectSeatPrice(play_idx);
		String address = dao.getAddress(userIdx);
		String time_limit = dao.getTimeLimit(payment_idx);
		request.setAttribute("pricelist", pricelist);
		request.setAttribute("pm", payment_idx);
		request.setAttribute("p2dto", p2dto);
		request.setAttribute("rsidto", rsidto);
		request.setAttribute("time_limit", time_limit);
		request.setAttribute("total_amount", total_amount);
		request.setAttribute("cpdto", cpdto);
		request.setAttribute("address", address);
		request.getRequestDispatcher("/ticketlink/Pay/payment_p3.jsp").forward(request, response);
		
	}

}
