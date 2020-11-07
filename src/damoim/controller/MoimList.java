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
 * Servlet implementation class MoimList
 */
@WebServlet("/moimList")
public class MoimList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int categoryNum = 0;
		int locationCode = 0;
		int date = 0;
		int page = Integer.parseInt(request.getParameter("page"));
		int pageSize = 5;
		List<PostDTO> postList = null;
	 	try { 
	 		postList = UserService.userSelectBoardList(categoryNum, locationCode, date); 
			PrintWriter out = response.getWriter();
			int totalPage = postList.size()/5;
			if(postList.size() / 5 > 0) {
				totalPage++;
			}
			int fromIndex = (page - 1) * pageSize;
			List<PostDTO> partedPostList = postList.subList(fromIndex, Math.min(fromIndex+pageSize, postList.size()));
			JSONArray json = JSONArray.fromObject(totalPage);
			json.add(partedPostList);
			out.println(json);
			response.setContentType("text/html; charset=UTF-8");
	 	} catch (SQLException e) { 
	 		e.printStackTrace(); 
	 	}
		
	}

}
