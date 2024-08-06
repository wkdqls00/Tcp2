package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.TicketCountDao;
import dao.Ticket_checkDao;
import dto.Ticket_checkDto;

/**
 * Servlet implementation class Ticket_checkServlet
 */
@WebServlet("/TicketAjaxServlet")
public class TicketAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		Integer userIdx = (Integer)request.getSession().getAttribute("userIdx");

		int currP = 1;
		String currP_ = request.getParameter("currP");
		if (currP_ != null && !currP_.equals("")) {
			currP = Integer.parseInt(currP_);
		}
		System.out.println(currP);
		int max = currP * 10;
		int min = 1 + (currP - 1)*10;
		
		Ticket_checkDao tcDao = new Ticket_checkDao();
		ArrayList<Ticket_checkDto> list = tcDao.checkReservationY(userIdx, max, min);
		int count = tcDao.check_countY(userIdx);
		
		TicketCountDao tCountDao = new TicketCountDao();
		
		JSONArray jArray = new JSONArray();
		for(Ticket_checkDto dto : list) {
			//countList.add(tCountDao.ticketCount(dto.getPayment_idx()));
			JSONObject obj = new JSONObject();
		    int payment_idx = dto.getPayment_idx();
		    String name = dto.getName();
		    String start_date = dto.getStart_date().toString();
		    String status = dto.getStatus();
		    String start_time = dto.getStart_time();
		    String pay_date = dto.getPay_date();
		    int play_idx = dto.getPlay_idx();
		    int tCount = tCountDao.ticketCount(dto.getPayment_idx());
		    obj.put("payment_idx", payment_idx);
		    obj.put("name", name);
		    obj.put("start_date", start_date);
		    obj.put("status", status);
		    obj.put("start_time", start_time);
		    obj.put("pay_date", pay_date);
		    obj.put("play_idx", play_idx);
		    obj.put("tCount", tCount);
		    
		    jArray.add(obj);
		}
		out.print(jArray);

//		}
	}
}
