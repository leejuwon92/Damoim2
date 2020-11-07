package damoim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import damoim.service.ClientService;
import net.sf.json.JSONArray;

@WebServlet("/clientChart")
public class ClientChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("clientSelectChart call..");
		HttpSession session = request.getSession();
		int userNo = (int) session.getAttribute("session_userNo");
		int[] list = null;
		try {
			list = ClientService.clientSelectChart(userNo);

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (list != null) {
			JSONArray arr = JSONArray.fromObject(list);
			PrintWriter out = response.getWriter();
			out.println(arr);

		}
	}

}
