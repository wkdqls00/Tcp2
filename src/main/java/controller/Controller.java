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
		request.setCharacterEncoding("utf-8"); // request로 바꿈
		response.setContentType("text/html; utf-8");
		String command = request.getParameter("command");
		System.out.println("컨트롤러 command : " + command);
		
		Action action = null;

		switch(command) {
		
			//-----밴드-----
		
			// 밴드 메인 페이지
			case "band_main": action = new BandMainAction(); break;
			// 밴드 메인 - 동네 밴드
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
			//밴드 가입 대기
			case "band_join_request" : action = new BandJoinRequestAction(); break;
			//밴드 게시글 삭제
			case "band_post_delete" : action = new BandPostDeleteAction(); break;
			
			//-----티켓링크-----
			
			//티켓링크 로그인 페이지
			case "login" : action = new LoginAction(); break;
			//티켓링크 로그인 액션
			case "loginAction" : action = new LoginAction3(); break;
			//메인 페이지
			case "main" : action = new MainAction(); break;
		    //아이디 찾기 페이지
			case "find_id" : action = new Find_idAction(); break;
			//아이디 찾기 결과 페이지
			case "find_idResult" : action = new Find_idResultAction(); break;
			//비밀번호 찾기 전 아이디 체크 페이지
			case "find_pw_idcheck" : action = new Find_pw_idcheckAction(); break;
			//비밀번호 찾기 페이지
			case "find_pw" : action = new Find_pwAction(); break;
			//비밀번호 찾기 결과 페이지
			case "find_pwResult" : action = new Find_pwResultAction(); break;
			//마이 페이지
			case "mypage" : action = new MypageAction(); break;
			//티켓예매 확인 페이지
			case "ticket_check" : action = new Ticket_checkAction(); break;
			//티켓예매 확인 15, 30, 60, 90일 페이지
			case "ticket_check_period" : action = new Ticket_checkPeriodAction(); break;
			//티켓예매 확인 월별 페이지
			case "ticket_checkMonthY" : action = new Ticket_checkMonthYAction(); break;
			//티켓취소 확인 페이지
			case "ticket_cancle" : action = new Ticket_cancleAction(); break;
			//티켓취소 확인 15, 30, 60, 90일 페이지
			case "ticket_check_periodR" : action = new Ticket_checkPeriodRAction(); break;
			//티켓취소 확인 월별 페이지
			case "ticket_checkMonthR" : action = new Ticket_checkMonthRAction(); break;
			//후기관리 페이지(공연)
			case "script_concert" : action = new ScriptManagementCAction(); break;
			//후기관리 페이지(전시)
			case "script_exhibition" : action = new ScriptManagementEAction(); break;
			//로그아웃
			case "logout" : action = new LogoutAction2(); break;
			//회원가입
			case "newaccount" : action = new NewAccountAction(); break;
			//동의항목 페이지 
			case "agreeToTerms" : action = new AgreeToTermsAction(); break;
			//회원가입 정보 입력 페이지
			case "signup" : action = new SignupAction(); break;
			//회원정보 수정 메인페이지
			case "modify" : action = new Modify_mainAction(); break;
			//회원정보 수정 회원정보페이지
			case "modify_member" : action = new Modify_memberAction(); break;
			//회원 비밀번호 수정 페이지
			case "modify_password" : action = new Modify_passwordAction2(); break;
			//회원 계정연결 설정 페이지
			case "modify_memberJoin" : action = new Modify_memberJoinAction(); break;
			//회원 탈퇴 페이지
			case "modify_withdrawal" : action = new Modify_withdrawalAction2(); break;
			//랭킹 페이지
			case "ranking" : action = new RankingAction(); break;
			//공연 상세 페이지
			case "playinfo" : action = new PlayinfoAction(); break;
			//고객센터 페이지
			case "cscenter" : action = new CsCenterAction(); break;
			//예매창누를시
			case "pay0" : action = new Payment0Action(); break;
			//결제페이지1>2
			case "pay1" : action = new Payment1Action(); break;
			//결제페이지2>3
			case "pay2" : action = new Payment2Action(); break;
			//결제완료시
			case "pay3" : action = new Payment3Action(); break;
			//관람후기작성
			case "writescript" : action = new WriteScriptAction(); break;
			//기대평작성
			case "writeexp" : action = new WriteExpAction(); break;
			// 문의목록 페이지
			case "inquirelist" : action = new InquirelistAction(); break;
			// 문의 내역 글 클릭시
			case "inquiredetail" : action = new InquiredetailAction(); break;
			// 문의하기
			case "wirteinquire" : action = new WirteinquireAction(); break;
			//공지사항
			case "notice" : action = new NoticeAction(); break;
			//faq
			case "faq" : action = new FaqAction(); break;
			//예약안내페이지
			case "reserveinfo" : action = new ReserveInfoAction(); break;
			//회원정보안내멤버십
			case "membership" : action = new MembershipAction(); break;
			//수수료 안내
			case "commission" : action = new CommissionAction(); break;
			//예매취소안내
			case "cancel" : action = new CancelRefundAction(); break;
			//FAQ 내용
			case "faqdetail" : action = new FaqDetailAction(); break;
			//공지사항 내용
			case "noticedetail" : action = new NoticeDetailAction(); break;
		}
		
		action.execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}










