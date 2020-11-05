package damoim.service;

import java.sql.SQLException;

import damoim.dao.UserDAO;
import damoim.dao.UserDAOImpl;
import damoim.dto.ClientDTO;

public class UserService {

	private static UserDAO userDAO = new UserDAOImpl();

	/**
	 * ȸ������ �� ����ϴ� �޼ҵ�
	 * @param clientDTO
	 * @return 1�̸� ȸ������ ����, 0�̸� ȸ������ ����
	 */
	public static int userRegister(ClientDTO clientDTO) throws SQLException {
		
		int result = userDAO.userRegister(clientDTO);
		return result;
	} 

	
	
	
	
	
	
	
	
	/**
	 * ���̵� �ߺ� üũ
	 * @param id
	 * @return true�� ���̵� ������(���̵� ���Ұ�) false�� �������� ����(���̵� ��밡��)
	 */
	public static boolean userIdCheck(String userId) throws SQLException{
		
		boolean result = userDAO.userIdCheck(userId);
		return result;
	}

	/**
	 * �̸��� �ߺ� üũ
	 * @param email
	 * @return true�� �̸��� ������(�̸��� ���Ұ�), false�� �������� ����(�̸��� ��밡��)
	 */
	public static boolean userEmailCheck(String userEmail) throws SQLException {
		
		boolean result = userDAO.userEmailCheck(userEmail);
		return result;
	}

	public static ClientDTO userLogin(String userId, String userPwd) throws SQLException {
		
		ClientDTO clientDTO = userDAO.userLogin(userId, userPwd);
		return clientDTO;
	}


	public static String userSelectId(ClientDTO clientDTO) throws SQLException{
		
		String userId = userDAO.userSelectId(clientDTO); 
		return userId;
	}









	public static String userSelectPwd(ClientDTO clientDTO) throws SQLException{
		
		String userPwd = userDAO.userSelectPwd(clientDTO);
		return userPwd;
	}
	
}
