package damoim.dao;

import java.sql.SQLException;
import java.util.List;

import damoim.dto.PostDTO;
import damoim.dto.ReplyDTO;
import damoim.dto.ClientDTO;

public interface UserDAO {
	/**
	 * 로그인 시 사용하는 메소드
	 * (리턴후 Controller에서 clientNo와 clientId를 sessionScope에 저장)
	 * @param id, pwd
	 * @return ClientDTO로 리턴
	 */
	ClientDTO userLogin(String id, String pwd) throws SQLException;
	
	/**
	 * 회원가입 시 사용하는 메소드
	 * @param clientDTO
	 * @return 1이면 회원가입 성공, 0이면 회원가입 실패
	 */
	int userRegister(ClientDTO clientDTO) throws SQLException;
	
	/**
	 * 아이디를 찾을때 사용하는 메소드
	 * @param clientDTO 
	 * @return 아이디를 리턴
	 */
	String userSelectId(ClientDTO clientDTO) throws SQLException;
	
	/**
	 * 패스워드를 찾을때 사용하는 메소드
	 * @param clientDTO
	 * @return 비밀번호를 리턴
	 */
	String userSelectPwd(ClientDTO clientDTO) throws SQLException;

	/**
	 * 모임 출력하는 메소드
	 * 인수에 따라서 if문으로 sql문 추가 선택
	 * @param 카테고리, 지역, 날짜
	 * @return 전체 모임 정보 리턴
	 */
	List<PostDTO> userSelectBoardList(int categoryNum, int locationCode, int date) throws SQLException;
	
	/**
	 * 모임 상세보기 기능 
	 * @param boardNum
	 * @return 모임 상세 정보 리턴
	 */
	PostDTO userSelectBoard(int postNo) throws SQLException;
	
	/**
	 * 아이디 중복 체크
	 * @param id
	 * @return true면 아이디 존재함(아이디 사용불가) false면 존재하지 않음(아이디 사용가능)
	 */
	boolean userIdCheck(String id) throws SQLException;
	
	/**
	 * 이메일 중복 체크
	 * @param email
	 * @return true면 이메일 존재함(이메일 사용불가), false면 존재하지 않음(이메일 사용가능)
	 */
	boolean userEmailCheck(String email) throws SQLException;

	/**
	 * userNo를 이용해서 client의 모든 정보를 불러오는 기능
	 * @param userNo
	 */
	ClientDTO userSelectClient(int userNo) throws SQLException;
	
	/**
	 * postNo를 이용해서 QNA Table의 모든 정보를 불러오는 기능
	 * @param userNo
	 */
	List<ReplyDTO> userSelectReplyList(int postNo) throws SQLException ;
	
	/**
	 * Index의 배너들을 불러오는 기능
	 * index Code가 1이면 배너
	 * index Code가 2이면 BestMoim목록
	 * index Code가 3이면 Today'sMoim 목록
	 * @param indexCode
	 */
	List<PostDTO> indexBoardList(int indexCode) throws SQLException;
}
