package damoim.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import damoim.dto.PostDTO;
import damoim.service.UserService;

/**
 * Servlet implementation class MakeIndexServlet
 */
@WebServlet("/makeIndex")
public class MakeIndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		try {
			List<PostDTO> bannerList = UserService.indexBoardList(1);
			request.setAttribute("bannerList",bannerList.subList(0, 4));
			
			List<PostDTO> bestList = UserService.indexBoardList(2);
			
			request.setAttribute("bestList",bestList.subList(0, 4));
			
			List<PostDTO> todayList = UserService.indexBoardList(3);
			request.setAttribute("todayList",todayList.subList(0, 4));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String url = "/index.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}
}
