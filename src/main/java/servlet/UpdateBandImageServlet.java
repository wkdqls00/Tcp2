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

@WebServlet("/UpdateBandImageServlet")
public class UpdateBandImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession hs = request.getSession();
//		int member_idx = (int)hs.getAttribute("userIdx");
		
		ServletContext application = getServletContext();
		String path = application.getRealPath("/upload");
		System.out.println(path);
		
		File filePath = new File(path);
		if(!filePath.exists()) {
			filePath.mkdirs();
		}
		
		
		MultipartRequest multi = new MultipartRequest(request, path, 1000*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		int meet_idx = Integer.parseInt(multi.getParameter("meet_idx"));
		System.out.println("meet_idx : " + meet_idx);
		Enumeration<?> files = multi.getFileNames();
		String fileObject = (String)files.nextElement();
		
		
		String url = multi.getFilesystemName(fileObject);
		
		String name = multi.getParameter("name");
		
		UpdateBandDAO uDao = new UpdateBandDAO();
		uDao.updateBandImage(url, meet_idx);
		uDao.updateBandName(name, meet_idx);
		
		request.setAttribute("meet_idx", meet_idx);
		RequestDispatcher rd = request.getRequestDispatcher("band/locationBandSetting.jsp");
		rd.forward(request, response);
	
	}

}
