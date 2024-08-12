package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;


public class AgreeToTermsAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/Tcp2/ticketlink/Login/Join_content.jsp");
		
		
    //아이디 찾기 페이지
	case "Find_id" : action = new Find_idAction(); break;
	//아이디 찾기 결과 페이지
	case "Find_idResult" : action = new Find_idResultAction(); break;
	//비밀번호 찾기 전 아이디 체크 페이지
	case "Find_pw_idcheck" : action = new Find_pw_idcheckAction(); break;
	//비밀번호 찾기 페이지
	case "Find_pw" : action = new Find_pwAction(); break;
	//비밀번호 찾기 결과 페이지
	case "Find_pwResult" : action = new Find_pwResultAction(); break;
	}

}


