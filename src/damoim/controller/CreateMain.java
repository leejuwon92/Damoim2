package damoim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import damoim.dto.PostDTO;
import damoim.service.ClientService;
import net.sf.json.JSON;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class MyPageMain
 */
@WebServlet("/createMain")
public class CreateMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		int userNo = (int)session.getAttribute("session_userNo");
		List<PostDTO>createMoim = null;
		try {
		createMoim = ClientService.hostSelectMoimByMe(userNo);
		}catch(Exception e ) {
			e.printStackTrace();
		}
		if(createMoim!=null) {
			JSONArray arr = JSONArray.fromObject(createMoim);
			PrintWriter out = response.getWriter();
			out.println(arr);
		}
		
	}

}
