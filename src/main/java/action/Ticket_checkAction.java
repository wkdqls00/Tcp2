package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TicketCountDao;
import dao.Ticket_checkDao;
import dto.Ticket_checkDto;


public class Ticket_checkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		Integer userIdx = (Integer)request.getSession().getAttribute("userIdx");

		if(userIdx == null) {
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
		int currP = 1;
		String currP_ = request.getParameter("currP");
		if (currP_ != null && !currP_.equals("")) {
			currP = Integer.parseInt(currP_);
		}
		
		int max = currP * 10;
		int min = 1 + (currP - 1)*10;
		
		Ticket_checkDao tcDao = new Ticket_checkDao();
		ArrayList<Ticket_checkDto> list = tcDao.checkReservationY(userIdx, max, min);
		int count = tcDao.check_countY(userIdx);
		
		TicketCountDao tCountDao = new TicketCountDao();
		ArrayList<Integer> countList = new ArrayList<>();
		for(Ticket_checkDto l : list) {
			countList.add(tCountDao.ticketCount(l.getPayment_idx()));
		}
		
		request.setAttribute("countList", countList);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		RequestDispatcher rd = request.getRequestDispatcher("/ticketlink/Mypage/Ticket_check.jsp");
		rd.forward(request, response);
//		for (Ticket_checkDto l : list) {
//			System.out.println(l);
	}
}
