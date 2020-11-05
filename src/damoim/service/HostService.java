package damoim.service;

import java.sql.SQLException;
import java.util.List;

import damoim.dao.HostDAO;
import damoim.dao.HostDAOImpl;
import damoim.dto.ClientDTO;
import damoim.dto.PostDTO;


public class HostService {
	private static HostDAO dao = new HostDAOImpl();

	public static int insert(PostDTO post) throws SQLException{
		int result = dao.hostCreateMoim(post);
		return result;
	}
	
	public static int update(PostDTO post) throws SQLException{
		int result = dao.hostUpdateMoim(post);
		return result;
	}
	
	public static int delete(int postNum) throws SQLException{
		int result = dao.hostDeleteMoim(postNum);
		return result;
	}
	
	public static List<ClientDTO> list(int boardNum) throws SQLException{
		List<ClientDTO> list = dao.hostSelectClientByMoim(boardNum);
		return list;
	}
}
