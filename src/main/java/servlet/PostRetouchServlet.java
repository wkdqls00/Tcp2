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

import dao.UpdateBandDAO;

@WebServlet("/PostRetouchServlet")
public class PostRetouchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int member_idx = (int)hs.getAttribute("userIdx");
		
		ServletContext application = getServletContext();
		String path = application.getRealPath("/upload");
		System.out.println("real path : " + path);
		File filePath = new File(path);
		if(!filePath.exists()) {
			filePath.mkdir();
		}
		
		
		MultipartRequest multi = new MultipartRequest(request, path, 100*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		int meetIdx = Integer.parseInt(multi.getParameter("meet_idx"));
		System.out.println("meet_idx : " + meetIdx);
		
		Enumeration<?> files = multi.getFileNames();
		String fileObject = (String)files.nextElement();
	
		String file_url = multi.getFilesystemName(fileObject);
		int post_idx = Integer.parseInt(multi.getParameter("post_idx"));
		String content = multi.getParameter("content");
		
		
		System.out.println("file_url : " + file_url + ", post_idx : " + post_idx + ", content : " + content);
		UpdateBandDAO updateDao = new UpdateBandDAO();
		
		if(file_url != null) {
			updateDao.updatePostContent(content, post_idx);
			updateDao.updatePostImg(file_url, post_idx);
		} else {
			updateDao.updatePostContent(content, post_idx);
		}
		
		request.setAttribute("meet_idx", meetIdx);
		RequestDispatcher rd = request.getRequestDispatcher("band/locationBandHome.jsp");
		rd.forward(request, response);
	}
}
