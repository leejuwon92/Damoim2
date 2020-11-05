package damoim.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * user, client, host Controller�� �ۼ��ϰ� Controller�� ��� �� 
 * insert, select, update, delete ���� �޼ҵ带 �ۼ��Ͻø� �˴ϴ�
 * ��, �޼ҵ尡 Controller�� ������ �ϽŴٰ� ���ø� �˴ϴ�.
 * View -> DispatcherServelt�� key�� Ȯ�� �� -> �� Controller ����ü -> service -> DAOImpl ���� ��
 */
public interface Controller {
	ModelAndView execute(HttpServletRequest request, HttpServletResponse response);
}
