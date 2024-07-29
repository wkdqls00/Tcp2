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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.CreateMeetDAO;

@WebServlet("/CreateNewBandServlet")
public class CreateNewBandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
										100*1024*1024,
										"UTF-8",
										new DefaultFileRenamePolicy()
										);
		
		Enumeration<?> files = multi.getFileNames();
		String fileObject = (String)files.nextElement();
		
		CreateMeetDAO cmDao = new CreateMeetDAO();
		RequestDispatcher rd = request.getRequestDispatcher("/band/CreateNewBand.jsp");
		rd.forward(request, response);
	}

}
