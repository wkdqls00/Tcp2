package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.*;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		String command = request.getParameter("command");
		System.out.println("컨트롤러 command : " + command);
		
		Action action = null;

		switch(command) {
			// 밴드 메인 페이지
			case "band_main": action = new BandMainAction(); break;
			case "band_main_hometown": action = new BandMainHometown(); break;
			
			// 새 밴드 생성
			case "band_new_create": action = new BandNewCreateAction(); break;
			// 밴드 홈페이지
			case "band_home": action = new BandHomeAction(); break;
			// 밴드 채팅
			case "band_chat": action = new BandChatAction(); break;
			// 밴드 설정
			case "band_setting" : action = new BandSettingAction(); break;
			// 프로필 설정
			case "band_profile" : action = new BandProfileAction(); break;
			// 밴드 소개
			case "band_information" : action = new BandInformationAction(); break;
			// 밴드 멤버 출력
			case "band_member_list" : action = new BandMemberListAction(); break;
			//밴드 이름 설정
			case "band_name_setting" : action = new BandNameSettingAction(); break;
			//밴드 공개 설정
			case "band_public_setting" : action = new BandPublicSettingAction(); break;
			//밴드 가입 조건 설정
			case "band_joining_condition" : action = new BandJoinConditionAction(); break;
			//밴드 삭제
			case "band_delete" : action = new BandDeleteAction(); break;
			//밴드 탈퇴
			case "band_leave" : action = new BandLeaveAction(); break;
			//티켓링크 로그인
			case "login" : action = new LoginAction(); break;
			//메인 페이지
			case "main" : action = new MainAction(); break;
			//마이 페이지
			case "mypage" : action = new MypageAction();
			//티켓예매 확인 페이지
			case "ticket_check" : action = new Ticket_checkAction(); break;
		}
		
		action.execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}










