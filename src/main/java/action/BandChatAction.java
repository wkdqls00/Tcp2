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

public class BandChatAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession hs = request.getSession();
		Integer member_idx = (Integer)request.getSession().getAttribute("userIdx");
		
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		int chat_idx = Integer.parseInt(request.getParameter("chat_idx"));
		
		// 채팅 내역 출력
		ChatHistoryDAO chDao = new ChatHistoryDAO();
		ArrayList<ChatHistoryDTO> chList = new ArrayList<>();
		
		try {
			chList = chDao.selectChatHistoryDTO(chat_idx, meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 채팅방 제목 출력
		ChatTitleDTO chTitleDto = null;
		try {
			chTitleDto = chDao.selectChatTitle(chat_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 채팅방 참여
		ChatJoinDAO cjDao = new ChatJoinDAO();
		
		// 채팅방 회원수
		ChatMemberCountDTO cmDto = null;
		try {
			cmDto = chDao.chatMemberCount(chat_idx);
		} catch (Exception e) {
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

		// 밴드 소개
		MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
		MeetIntroduceWriteDTO miDto = null;
		try {
			miDto = miDao.selectMeetIntroduceWriteDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("member_idx", member_idx);
		request.setAttribute("chat_idx", chat_idx);
		request.setAttribute("meet_idx", meet_idx);
		request.setAttribute("chList", chList);
		request.setAttribute("chTitleDto", chTitleDto);
		request.setAttribute("cmDto", cmDto);
		request.setAttribute("mMemberProfilePrintDTO", mMemberProfilePrintDTO);
		request.setAttribute("miDto", miDto);
		
		request.getRequestDispatcher("band/chat.jsp").forward(request, response);
	}

}
