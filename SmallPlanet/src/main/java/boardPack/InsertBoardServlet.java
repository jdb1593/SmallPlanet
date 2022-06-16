package boardPack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/insertBoard")
public class InsertBoardServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
//		private final String  FOLDER = "C:/Users/admin/Desktop/SmallPlanet/SmallPlanet/fileUpload";
//		private final String TYPE = "utf-8";
//		private final int SIZE = 5*1024*1024;
		request.setCharacterEncoding("utf-8");
		BoardDAO bDAO = new BoardDAO();
//		MultipartRequest multi = new MultipartRequest(request, "",0,"utf-8",
//				new DefaultFileRenamePolicy());
//		String boardName = request.getParameter("board");
		bDAO.insertBoard(request,response);
//		response.sendRedirect(boardName+".jsp");
	}

}
