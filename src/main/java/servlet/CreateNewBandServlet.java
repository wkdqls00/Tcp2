package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.CreateMeetDAO;

@WebServlet("/CreateNewBandServlet")
public class CreateNewBandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int member_idx = (int)hs.getAttribute("userIdx");
		
		
		
		ServletContext application = getServletContext();
		String path = application.getRealPath("/upload");
		System.out.println("real path : " + path);
		
		File filePath = new File(path);
		if(!filePath.exists()) {
			filePath.mkdirs();
		}
		
		MultipartRequest multi = new MultipartRequest(
										request,
										path,
										1000*1024*1024,
										"UTF-8",
										new DefaultFileRenamePolicy()
										);
		
		Enumeration<?> files = multi.getFileNames();
		String fileObject = (String)files.nextElement();
		
		
		
		String name = multi.getParameter("name");
		String url = multi.getFilesystemName(fileObject);
		String sub_q = multi.getParameter("sub_q");
		String nickname = multi.getParameter("nickname");
		String imageSrc = multi.getParameter("imageSrc");
		System.out.println(name+" " + url + " " + sub_q + " " + nickname + " " + imageSrc);
		
		if(url == null) {
			CreateMeetDAO cmDao = new CreateMeetDAO();
			cmDao.createMeet(name, imageSrc, member_idx, sub_q, nickname);
		} else {
			CreateMeetDAO cmDao = new CreateMeetDAO();
			cmDao.createMeet(name, url, member_idx, sub_q, nickname);
		}
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=band_main");
		rd.forward(request, response);
	}

}
