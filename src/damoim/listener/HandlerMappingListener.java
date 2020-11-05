package damoim.listener;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import damoim.controller.Controller;


@WebListener
public class HandlerMappingListener implements ServletContextListener {
    public void contextDestroyed(ServletContextEvent sce)  { 
    	
    }

	/**
	 * 미리 생성할 객체를 생성해서 Map에 저장하고 생성된 Map을 application영역에 저장한다.(사전초기화)
	 */
	public void contextInitialized(ServletContextEvent e) {
		// context_param정보 가져오기
		ServletContext application = e.getServletContext();
		String fileName = application.getInitParameter("fileName");

		Map<String, Controller> map = new HashMap<String, Controller>();
		Map<String, Class<?>> clzMap = new HashMap<String, Class<?>>();  //Class<?> : 어떤타입이든 들어올수 있다 .
		// 미리 생성해야하는 객체에 대한 정보를 가지고 있는 actionMapping.properties파일을 로딩하기
		// ResourceBundle.getBundle(baseName)을 이용해서 properties파일 읽기
		// baseName의 확장자는 생략한다.
		ResourceBundle rb = ResourceBundle.getBundle(fileName);
		for (String key : rb.keySet()) {
			String value = rb.getString(key);
			System.out.println(key + " = " + value);

			// String 형태인 value를 객체로 만든다.
			try {
				Class<?> cls =  Class.forName(value);
				Controller controller = (Controller)cls.newInstance();
				
				map.put(key, controller);
				clzMap.put(key, cls);
				
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		
		application.setAttribute("map", map);
		application.setAttribute("clzMap", clzMap);
		
	}//메소드 끝

}
	
