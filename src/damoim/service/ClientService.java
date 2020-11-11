package damoim.service;

import java.sql.SQLException;
import java.util.List;

import damoim.dao.ClientDAO;
import damoim.dao.ClientDAOImpl;
import damoim.dto.ClientDTO;
import damoim.dto.JoinDTO;
import damoim.dto.PostDTO;
import damoim.dto.ReplyDTO;

public class ClientService {
	
	public static ClientDAO dao = new ClientDAOImpl(); 
	/**
	 * 모임참가하는 기능
	 * 
	 * @param joinDTO
	 * @return 1이면 모임가입 성공, 0이면 모임가입 실패
	 */
	public static int clientJoinMoim(JoinDTO joinDTO) throws SQLException{
		int result = dao.clientJoinMoim(joinDTO);
		return result;
	}
	
	public static int clientInsertReply(ReplyDTO replyDTO) throws SQLException{
		int result = dao.clientInsertReply(replyDTO);	
		return result;
	}
	
	public static int clientDeleteReply(int questionNo) throws SQLException{
		int result  = dao.clientDeleteReply(questionNo);
		return result;
	}
	
	public static int[] clientSelectChart(int clientNo) throws SQLException{
		int [] result = dao.clientSelectChart(clientNo);
		return result;
	}
	
	public static int[] hostSelectChart(int clientNo) throws SQLException{
		int [] result = dao.hostSelectChart(clientNo);
		return result;
	}
	
	
	public static List<PostDTO> clientSelectMoimByMe(int userNo)throws SQLException{
		List <PostDTO> list = dao.clientSelectMoimByMe(userNo);
		return list;
	}
	
	public static List<PostDTO> hostSelectMoimByMe(int userNo)throws SQLException{
		List <PostDTO> list = dao.hostSelectMoimByMe(userNo);
		return list;
	}
	
	public static int clientCancleMoim(int postNo,int userNo) throws SQLException{
		int result = dao.clientCancleMoim(postNo, userNo);
		return result;
	}
	
	public static int clientUpdateClientInform(ClientDTO clientDTO) throws SQLException{
		int result = dao.clientUpdateClientInform(clientDTO);
		return result;
	}
	
	public static boolean clientJoinCheck(int userNo, int postNo) throws SQLException {
		boolean result = dao.clientJoinCheck(userNo, postNo);
		return result;
	}
}
