package damoim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import damoim.service.ClientService;

/**
 * Servlet implementation class deleteQnAServlet
 */
@WebServlet("/deleteqna")
public class deleteQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String questionNo = request.getParameter("question_no");
		
		int result = 0;
		
		try {
			result = ClientService.clientDeleteReply(Integer.parseInt(questionNo));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (result > 0) {
			out.print(0);
		} else
			out.print(1);
		}

}
