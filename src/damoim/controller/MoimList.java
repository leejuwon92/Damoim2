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
import net.sf.json.JSONObject;

@WebServlet("/moimList")
public class MoimList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		int categoryNum = Integer.parseInt(request.getParameter("category_no"));
		int locationCode = Integer.parseInt(request.getParameter("location_no"));
		int date = Integer.parseInt(request.getParameter("date"));
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		List<PostDTO> postList = null;
		JSONArray json = new JSONArray();
	 	try { 
	 		postList = UserService.userSelectBoardList(categoryNum, locationCode, date); 
			int totalPage = postList.size()/pageSize;
			if(postList.size() / pageSize > 0 || totalPage == 0) { 
				totalPage++; // 
			}
			int fromIndex = (page - 1) * pageSize;//pageSize;
			List<PostDTO> partedPostList = postList.subList(fromIndex, Math.min(fromIndex+pageSize, postList.size()));
			json.add(totalPage);
			json.add(partedPostList);
	 	} catch (SQLException e) { 
	 		e.printStackTrace(); 
	 	}
	 	for(PostDTO post:postList) {
			System.out.println(post.getPostDescr());
		}
		response.setContentType("text/html;charset=UTF-8"); 
	 	response.getWriter().print(json);
	}

}
