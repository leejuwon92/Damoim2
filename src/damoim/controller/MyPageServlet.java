package damoim.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import damoim.dto.PostDTO;
import damoim.service.ClientService;

@WebServlet("/myPage")
public class MyPageServlet extends HttpServlet {
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = (int)request.getSession().getAttribute("session_userNo");
		List<PostDTO> hostList = new ArrayList<PostDTO>();
		List<PostDTO> postList = new ArrayList<PostDTO>();
		try {
			hostList = ClientService.hostSelectMoimByMe(userNo);
			postList = ClientService.clientSelectMoimByMe(userNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("hostList", hostList);
		request.setAttribute("postList", postList);
		String url = "/client/MyPage_main.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
