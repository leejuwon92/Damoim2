package damoim.dao;

import java.util.List;

import damoim.dto.PostDTO;
import damoim.dto.ClientDTO;
import damoim.dto.JoinDTO;
import damoim.dto.ReplyDTO;

public interface ClientDAO {

	/**
	 * 모임참가하는 기능
	 * 
	 * @param joinDTO
	 * @return 1이면 모임가입 성공, 0이면 모임가입 실패
	 */
	int clientJoinMoim(JoinDTO joinDTO);

	/**
	 * 회원이 post에 댓글형식으로 질문하는 기능
	 * 
	 * @param replyDTO
	 * @return 1이면 댓글기입 성공, 0이면 댓글기입 실패
	 */
	int clientInsertReply(ReplyDTO replyDTO);

	/**
	 * 댓글삭제하는 기능 cascade기능을 통해 답변까지 함께 삭제됨	
	 * 
	 * @param replyNum
	 * @return 1이상이면 댓글삭제 성공, 0이면 댓글삭제 실패
	 */
	int clientDeleteReply(int replyNum);

	/**
	 * joinTable에서 clientNo에 해당하는 categoryNo의 갯수를 조회한후 배열에 저장 변수로 category수만큼 count를
	 * 정의하고 switch로 그 정의된 count에 숫자를 증가시키고 while이 다 돌면 배열로 count들을 저장한다.
	 * 
	 * @param clientNo
	 * @return
	 */
	int[] clientSelectChart(int clientNo);

	/**
	 * 마이페이지에서 내가 참여한 모임정보 조회
	 * 
	 * @param id
	 * @return
	 */
	List<PostDTO> clientSelectMoimByMe(String id);

	/**
	 * 참가한 모임에 대하여 모임신청 취소
	 * 
	 * @param boardNum
	 * @return 1이상이면 모임신청 취소 성공, 0이면 모임신청 취소 실패
	 */
	int clientCancleMoim(int boardNum);

	/**
	 * 마이페이지에서 개인정보 업데이트 비밀번호/이메일/전화번호/이름 수정가능 단, 이메일변경시 이메일 중복체크 필요
	 * 
	 * @param clientDTO
	 * @return
	 */
	int clientUpdateClientInform(ClientDTO clientDTO);

	/**
	 * 모임 참가여부 확인
	 * 
	 * @param id
	 * @param boardNum
	 * @return : ture면 참가상태(모임에 이미 참가된상태이므로 참가 불가)
	 * @return : flase면 참가가능
	 */
	boolean clientJoinCheck(String id, int boardNum);

}
