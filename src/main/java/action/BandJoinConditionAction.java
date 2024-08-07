package action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BandPublicOkDAO;
import dao.ChatListDAO;
import dao.JoinConditionPrintDAO;
import dao.MeetIntroduceWriteDAO;
import dao.MeetMemberProfilePrintDAO;
import dto.BandPublicOkDTO;
import dto.ChatListDTO;
import dto.JoinConditionPrintDTO;
import dto.MeetIntroduceWriteDTO;
import dto.MeetMemberProfilePrintDTO;

public class BandJoinConditionAction implements Action {

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
		
		JoinConditionPrintDAO jcpDAO = new JoinConditionPrintDAO();
		JoinConditionPrintDTO jcpListDAO = null;
		try {
			jcpListDAO = jcpDAO.selectJoinConditionPrintDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//내 프로필 출력
		MeetMemberProfilePrintDAO mMemberProfilePrintDAO = new MeetMemberProfilePrintDAO();
		MeetMemberProfilePrintDTO mMemberProfilePrintDTO = null;
		try {
			mMemberProfilePrintDTO = mMemberProfilePrintDAO.selectMeetMemberProfilePrintDTO(meet_idx, member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		//밴드 왼쪽 소개
		MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
		MeetIntroduceWriteDTO miDto = null;
		try {
			miDto = miDao.selectMeetIntroduceWriteDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 채팅 목록 출력
		ChatListDAO cDao = new ChatListDAO();
		ArrayList<ChatListDTO> chatListDto = new ArrayList<>();
		
		try {
			chatListDto = cDao.selectChatListDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 밴드 공개 여부
		BandPublicOkDAO bDao = new BandPublicOkDAO();
		BandPublicOkDTO bOkDTO = null;
		try {
			bOkDTO = bDao.selectBandPublicOkDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("bOkDTO", bOkDTO);
		request.setAttribute("jcpListDAO", jcpListDAO);
		request.setAttribute("mMemberProfilePrintDTO", mMemberProfilePrintDTO);
		request.setAttribute("miDto", miDto);
		request.setAttribute("chatListDto", chatListDto);
		request.getRequestDispatcher("band/band_joining_condition.jsp").forward(request, response);
	}

}
