package damoim.dao;

import java.sql.SQLException;
import java.util.List;

import damoim.dto.PostDTO;
import damoim.dto.ClientDTO;

public interface HostDAO {

	/**
	 * Host가 모임을 생성하는 기능
	 * @param postDTO
	 * @return 1이면 모임생성성공, 0이면 모임생성 실패
	 */
	int hostCreateMoim(PostDTO postDTO) throws SQLException;
	
	/**
	 * Host가 모임의 정보를 수정하는 기능
	 * @param postDTO
	 * @return 1이면 모임수정성공, 0이면 모임수정 실패
	 */
	int hostUpdateMoim(PostDTO postDTO) throws SQLException;
	
	/**
	 * Host가 모임을 삭제하는 기능
	 * 날짜를 기준으로 마감일 일주일 이내의 게시글은 삭제 불가능하다.
	 * @param boardNum
	 * @return
	 */
	int hostDeleteMoim(int boardNum) throws SQLException;

	/**
	 * 모임에 참여한 회원정보 조회
	 * id, 이름, 연락처, 메일정보를 host에게 제공한다.	
	 * @param boardNum
	 * @return 
	 */
	List<ClientDTO> hostSelectClientByMoim(int boardNum) throws SQLException;
	
	/**
	 * 답변달기 + 댓글 삭제 : (hostController에서 ClientService호출을 통해 기존 댓글작성 메소드 사용)
	 */
	
	
}
