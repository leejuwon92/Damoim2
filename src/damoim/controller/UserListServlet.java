package damoim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import damoim.dto.ClientDTO;
import damoim.service.HostService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class UserListServlet
 */
@WebServlet("/userList")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
System.out.println("HostController list called");
		
		int boardNum = Integer.parseInt(request.getParameter("post_no"));
		List<ClientDTO> list = new ArrayList<ClientDTO>();
		try {
		list = HostService.list(boardNum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(list!=null) {
			JSONObject obj = new JSONObject();
			JSONArray arr = JSONArray.fromObject(list);
			PrintWriter out = response.getWriter();
			out.println(arr);
			System.out.println(boardNum);
		}
		
		
	}

}
