package damoim.dao;

import java.sql.SQLException;
import java.util.List;

import damoim.dto.PostDTO;
import damoim.dto.ReplyDTO;
import damoim.dto.ClientDTO;

public interface UserDAO {
	/**
	 * �α��� �� ����ϴ� �޼ҵ�
	 * (������ Controller���� clientNo�� clientId�� sessionScope�� ����)
	 * @param id, pwd
	 * @return ClientDTO�� ����
	 */
	ClientDTO userLogin(String id, String pwd) throws SQLException;
	
	/**
	 * ȸ������ �� ����ϴ� �޼ҵ�
	 * @param clientDTO
	 * @return 1�̸� ȸ������ ����, 0�̸� ȸ������ ����
	 */
	int userRegister(ClientDTO clientDTO) throws SQLException;
	
	/**
	 * ���̵� ã���� ����ϴ� �޼ҵ�
	 * @param clientDTO 
	 * @return ���̵� ����
	 */
	String userSelectId(ClientDTO clientDTO) throws SQLException;
	
	/**
	 * �н����带 ã���� ����ϴ� �޼ҵ�
	 * @param clientDTO
	 * @return ��й�ȣ�� ����
	 */
	String userSelectPwd(ClientDTO clientDTO) throws SQLException;

	/**
	 * ���� ����ϴ� �޼ҵ�
	 * �μ��� ���� if������ sql�� �߰� ����
	 * @param ī�װ�, ����, ��¥
	 * @return ��ü ���� ���� ����
	 */
	List<PostDTO> userSelectBoardList(int categoryNum, int locationCode, int date) throws SQLException;
	
	/**
	 * ���� �󼼺��� ��� 
	 * @param boardNum
	 * @return ���� �� ���� ����
	 */
	PostDTO userSelectBoard(int postNo) throws SQLException;
	
	/**
	 * ���̵� �ߺ� üũ
	 * @param id
	 * @return true�� ���̵� ������(���̵� ���Ұ�) false�� �������� ����(���̵� ��밡��)
	 */
	boolean userIdCheck(String id) throws SQLException;
	
	/**
	 * �̸��� �ߺ� üũ
	 * @param email
	 * @return true�� �̸��� ������(�̸��� ���Ұ�), false�� �������� ����(�̸��� ��밡��)
	 */
	boolean userEmailCheck(String email) throws SQLException;

	/**
	 * userNo�� �̿��ؼ� client�� ��� ������ �ҷ����� ���
	 * @param userNo
	 */
	ClientDTO userSelectClient(int userNo) throws SQLException;
	
	/**
	 * postNo�� �̿��ؼ� QNA Table�� ��� ������ �ҷ����� ���
	 * @param userNo
	 */
	List<ReplyDTO> userSelectReplyList(int postNo) throws SQLException ;
	
	/**
	 * Index�� ��ʵ��� �ҷ����� ���
	 * index Code�� 1�̸� ���
	 * index Code�� 2�̸� BestMoim���
	 * index Code�� 3�̸� Today'sMoim ���
	 * @param indexCode
	 */
	List<PostDTO> indexBoardList(int indexCode) throws SQLException;
}
