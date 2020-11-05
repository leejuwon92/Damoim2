package damoim.controller;

/**
 * ������ Controller ����ü�� ����� �Ŀ� �̵��ؾ��� ���� ������ �̵� ����� �������� ��ü
 */
public class ModelAndView {
	private String viewName;
	
	/**
	 * false �̸� forward ���, true�̸� redirect
	 */
	private boolean isRedirect;
	
	public ModelAndView() {}
	public ModelAndView(String viewName, boolean isRedirect) {
		this.viewName = viewName;
		this.isRedirect = isRedirect;
	}

	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
