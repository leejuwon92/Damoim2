package damoim.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * user, client, host Controller를 작성하고 Controller를 상속 후 
 * insert, select, update, delete 등의 메소드를 작성하시면 됩니다
 * 즉, 메소드가 Controller의 역할을 하신다고 보시면 됩니다.
 * View -> DispatcherServelt이 key값 확인 후 -> 각 Controller 구현체 -> service -> DAOImpl 등의 순
 */
public interface Controller {
	ModelAndView execute(HttpServletRequest request, HttpServletResponse response);
}
