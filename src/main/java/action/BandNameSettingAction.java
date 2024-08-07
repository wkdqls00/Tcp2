package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MeetMemberProfilePrintDAO;
import dao.MeetSettingPrintDAO;
import dto.MeetMemberProfilePrintDTO;
import dto.MeetSettingPrintDTO;

public class BandNameSettingAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int member_idx = (int)hs.getAttribute("userIdx");
		
		int meet_idx = 0;
		if(request.getParameter("meet_idx")==null) {
			meet_idx = (Integer)request.getAttribute("meet_idx");
		} else {
			meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		}
		
		MeetSettingPrintDAO mspDAO = new MeetSettingPrintDAO();
		MeetSettingPrintDTO mspDTO = null;
		try {
			mspDTO = mspDAO.selectMeetSettingPrintDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 내 프로필 출력
		MeetMemberProfilePrintDAO mMemberProfilePrintDAO = new MeetMemberProfilePrintDAO();
		MeetMemberProfilePrintDTO mMemberProfilePrintDTO = null;
		try {
			mMemberProfilePrintDTO = mMemberProfilePrintDAO.selectMeetMemberProfilePrintDTO(meet_idx, member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("mspDTO", mspDTO);
		request.setAttribute("mMemberProfilePrintDTO", mMemberProfilePrintDTO);
		request.setAttribute("meet_idx", meet_idx);
		request.setAttribute("member_idx", member_idx);
		
		request.getRequestDispatcher("band/setting_leader_band_name.jsp").forward(request, response);
		
	}

}
