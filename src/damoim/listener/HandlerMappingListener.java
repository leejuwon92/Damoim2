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
	 * �̸� ������ ��ü�� �����ؼ� Map�� �����ϰ� ������ Map�� application������ �����Ѵ�.(�����ʱ�ȭ)
	 */
	public void contextInitialized(ServletContextEvent e) {
		// context_param���� ��������
		ServletContext application = e.getServletContext();
		String fileName = application.getInitParameter("fileName");

		Map<String, Controller> map = new HashMap<String, Controller>();
		Map<String, Class<?>> clzMap = new HashMap<String, Class<?>>();  //Class<?> : �Ÿ���̵� ���ü� �ִ� .
		// �̸� �����ؾ��ϴ� ��ü�� ���� ������ ������ �ִ� actionMapping.properties������ �ε��ϱ�
		// ResourceBundle.getBundle(baseName)�� �̿��ؼ� properties���� �б�
		// baseName�� Ȯ���ڴ� �����Ѵ�.
		ResourceBundle rb = ResourceBundle.getBundle(fileName);
		for (String key : rb.keySet()) {
			String value = rb.getString(key);
			System.out.println(key + " = " + value);

			// String ������ value�� ��ü�� �����.
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
		
	}//�޼ҵ� ��

}
	
