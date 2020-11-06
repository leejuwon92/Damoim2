package damoim.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import damoim.dto.ClientDTO;
import damoim.dto.JoinDTO;
import damoim.dto.PostDTO;
import damoim.dto.ReplyDTO;

public interface ClientDAO {

	/**
	 * 모임참가하는 기능
	 * 
	 * @param joinDTO
	 * @return 1이면 모임가입 성공, 0이면 모임가입 실패
	 */
	int clientJoinMoim(JoinDTO joinDTO) throws SQLException;

	/**
	 * 회원이 모임을 참가했을 때
	 * post 테이블의 현재 참여인원이 1명 증가해야함
	 * @param postNo
	 * @return 1이면 성공, 0 이면 실패
	 * */
	int plusPostCurrentPeople(Connection con ,int postNo) throws SQLException;
	
	/**
	 * 회원이 post에 댓글형식으로 질문하는 기능
	 * 
	 * @param replyDTO
	 * @return 1이면 댓글기입 성공, 0이면 댓글기입 실패
	 */
	int clientInsertReply(ReplyDTO replyDTO) throws SQLException;

	/**
	 * 댓글삭제하는 기능 cascade기능을 통해 답변까지 함께 삭제됨	
	 * 
	 * @param replyNum
	 * @return 1이상이면 댓글삭제 성공, 0이면 댓글삭제 실패
	 */
	int clientDeleteReply(int questionNo) throws SQLException;

	/**
	 * joinTable에서 clientNo에 해당하는 categoryNo의 갯수를 조회한후 배열에 저장 변수로 category수만큼 count를
	 * 정의하고 switch로 그 정의된 count에 숫자를 증가시키고 while이 다 돌면 배열로 count들을 저장한다.
	 * 
	 * @param clientNo
	 * @return
	 */
	int[] clientSelectChart(int clientNo) throws SQLException;

	/**
	 * 개설한 모임에 대한 차트 뿌리기
	 * @param userNo
	 * @return ...
	 * */
	int[] hostSelectChart(int clientNo) throws SQLException;
	
	/**
	 * 마이페이지에서 내가 개설한 모임정보 조회
	 * 
	 * @param id
	 * @return list
	 * */
	List<PostDTO> hostSelectMoimByMe(int userNo) throws SQLException;
	
	/**
	 * 마이페이지에서 내가 참여한 모임정보 조회
	 * 
	 * @param id
	 * @return
	 */
	List<PostDTO> clientSelectMoimByMe(int userNo) throws SQLException;

	/**
	 * 참가한 모임에 대하여 모임신청 취소
	 * 
	 * @param boardNum
	 * @return 1이상이면 모임신청 취소 성공, 0이면 모임신청 취소 실패
	 */
	int clientCancleMoim(int postNo,int userNo) throws SQLException;

	/**
	 * 회원이 모임을 취소했을 때
	 * post 테이블의 현재 참여인원이 1명 감소해야함
	 * @param postNo
	 * @return 1이면 성공, 0 이면 실패
	 * */
	int minusPostCurrentPeople(Connection con ,int postNo) throws SQLException;
	
	
	/**
	 * 마이페이지에서 개인정보 업데이트 비밀번호/이메일/전화번호/이름 수정가능 단, 이메일변경시 이메일 중복체크 필요
	 * 
	 * @param clientDTO
	 * @return
	 */
	int clientUpdateClientInform(ClientDTO clientDTO) throws SQLException;

	/**
	 * 모임 참가여부 확인
	 * 
	 * @param id
	 * @param boardNum
	 * @return : ture면 참가상태(모임에 이미 참가된상태이므로 참가 불가)
	 * @return : flase면 참가가능
	 */
	boolean clientJoinCheck(int userNo, int postNo) throws SQLException;

}
