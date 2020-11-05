package damoim.controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 사용자 요청을 중앙 집중적으로 관리해줄 FrontController
 *  : 사용자 요청을 받아서 그에 해당하는 Controller를 찾아서 호출하고 그 결과를 받아서 해당하는 뷰 페이지로 이동
 */
@WebServlet(urlPatterns = "/front" , loadOnStartup = 1)
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Controller> map;
	private Map<String, Class<?>> clzMap;
	
	@Override
	public void init() throws ServletException {
		System.out.println("init called");
		map = (Map<String, Controller>)super.getServletContext().getAttribute("map");
		clzMap = (Map<String, Class<?>>)getServletContext().getAttribute("clzMap");
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getParameter("key");
		String mn = request.getParameter("mn");
		Controller con = map.get(key);
		Class<?> cls = clzMap.get(key);
		try {
			Method method = cls.getDeclaredMethod(mn, HttpServletRequest.class, 
					HttpServletResponse.class);
			ModelAndView mv = (ModelAndView)method.invoke(con, request, response);
			
			if(mv.isRedirect()) {
				response.sendRedirect(mv.getViewName());
			} else {
				request.getRequestDispatcher(mv.getViewName()).forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
