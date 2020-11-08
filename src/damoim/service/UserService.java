package damoim.service;

import java.sql.SQLException;
import java.util.List;

import damoim.dao.UserDAO;
import damoim.dao.UserDAOImpl;
import damoim.dto.ClientDTO;
import damoim.dto.PostDTO;
import damoim.dto.ReplyDTO;

public class UserService {

	private static UserDAO userDAO = new UserDAOImpl();

	/**
	 * 회원가입 시 사용하는 메소드
	 * @param clientDTO
	 * @return 1이면 회원가입 성공, 0이면 회원가입 실패
	 */
	public static int userRegister(ClientDTO clientDTO) throws SQLException {
		
		int result = userDAO.userRegister(clientDTO);
		return result;
	} 

	/**
	 * 아이디 중복 체크
	 * @param id
	 * @return true면 아이디 존재함(아이디 사용불가) false면 존재하지 않음(아이디 사용가능)
	 */
	public static boolean userIdCheck(String userId) throws SQLException{
		
		boolean result = userDAO.userIdCheck(userId);
		return result;
	}

	/**
	 * 이메일 중복 체크
	 * @param email
	 * @return true면 이메일 존재함(이메일 사용불가), false면 존재하지 않음(이메일 사용가능)
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

	public static List<PostDTO> userSelectBoardList(int categoryNum, int locationCode, int date) throws SQLException {
		List<PostDTO> list = userDAO.userSelectBoardList(categoryNum, locationCode, date);
		return list;
	}

	public static PostDTO userSelectBoard(int postNo) throws SQLException {
			PostDTO postDTO = userDAO.userSelectBoard(postNo);
			
			return postDTO;
	}

	public static ClientDTO userSelectClient(int userNo) throws SQLException {
		
		ClientDTO clientDTO = userDAO.userSelectClient(userNo);
		
		return clientDTO;
	}

	public static List<ReplyDTO> userSelectReplyList(int postNo) throws SQLException{
		
		List<ReplyDTO> list = userDAO.userSelectReplyList(postNo);
		return list;
	}

	public static List<PostDTO> indexBoardList(int indexCode) throws SQLException{
		
		List<PostDTO> list = userDAO.indexBoardList(indexCode);
		
		return list;
	}







}
