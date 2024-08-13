package action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
import dto.*;
public class BandJoinRequestAction implements Action {

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
		//멤버 목록
		MeetMemberListPrintDAO mmlpDAO = new MeetMemberListPrintDAO();
		ArrayList<MeetMemberListPrintDTO> mmlpDTO = new ArrayList<>();
		try {
			mmlpDTO = mmlpDAO.selectMeetMemberListPrintDTO(meet_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 가입 신청자 출력
		MeetMemberListPrintDAO joinWaitDAO = new MeetMemberListPrintDAO();
		ArrayList<MeetMemberListPrintDTO> jwListDto = new ArrayList<>();	
		try {
			jwListDto = joinWaitDAO.selectJoinWaitMemberList(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 밴드 왼쪽 소개
		MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
		MeetIntroduceWriteDTO miDto = null;
		try {
			miDto = miDao.selectMeetIntroduceWriteDTO(meet_idx);
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
		
		MeetJoinQnAPrintDAO mjqpDAO = new MeetJoinQnAPrintDAO();
		MeetJoinQnAPrintDTO mjqpDTO  = null;
		try {
			mjqpDTO = mjqpDAO.selectMeetJoinQnAPrintDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		MeetJoinQuestionWriteDAO mjqwDAO = new MeetJoinQuestionWriteDAO();
		MeetJoinQuestionWriteDTO mjqwDTO = null;
		try {
			mjqwDTO = mjqwDAO.SelectMeetMemberWaitCount(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("member_idx", member_idx);
		request.setAttribute("meet_idx", meet_idx);
		request.setAttribute("mmlpDTO", mmlpDTO);
		request.setAttribute("jwListDto", jwListDto);
		request.setAttribute("miDto", miDto);
		request.setAttribute("mMemberProfilePrintDTO", mMemberProfilePrintDTO);
		request.setAttribute("bOkDTO", bOkDTO);
		request.setAttribute("mjqpDTO", mjqpDTO);
		request.setAttribute("chatListDto", chatListDto);
		request.setAttribute("mjqwDTO", mjqwDTO);
		request.getRequestDispatcher("band/join_request.jsp").forward(request, response);
	
	}

}
