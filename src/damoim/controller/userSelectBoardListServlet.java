package damoim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import damoim.dto.PostDTO;
import damoim.service.UserService;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class userSelectBoardListServlet
 */
@WebServlet("/boardListServlet")
public class userSelectBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		int category = Integer.parseInt(request.getParameter("category"));
		int location = Integer.parseInt(request.getParameter("location"));
		int date = Integer.parseInt(request.getParameter("date"));
		List<PostDTO> list = null;
		try {
			list = UserService.userSelectBoardList(category, location, date);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		JSONArray arr = JSONArray.fromObject(list);
		out.println(arr);
	}
}
