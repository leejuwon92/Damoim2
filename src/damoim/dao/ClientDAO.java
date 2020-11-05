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
	 * ���������ϴ� ���
	 * 
	 * @param joinDTO
	 * @return 1�̸� ���Ӱ��� ����, 0�̸� ���Ӱ��� ����
	 */
	int clientJoinMoim(JoinDTO joinDTO) throws SQLException;

	/**
	 * ȸ���� ������ �������� ��
	 * post ���̺��� ���� �����ο��� 1�� �����ؾ���
	 * @param postNo
	 * @return 1�̸� ����, 0 �̸� ����
	 * */
	int plusPostCurrentPeople(Connection con ,int postNo) throws SQLException;
	
	/**
	 * ȸ���� post�� ����������� �����ϴ� ���
	 * 
	 * @param replyDTO
	 * @return 1�̸� ��۱��� ����, 0�̸� ��۱��� ����
	 */
	int clientInsertReply(ReplyDTO replyDTO) throws SQLException;

	/**
	 * ��ۻ����ϴ� ��� cascade����� ���� �亯���� �Բ� ������	
	 * 
	 * @param replyNum
	 * @return 1�̻��̸� ��ۻ��� ����, 0�̸� ��ۻ��� ����
	 */
	int clientDeleteReply(int questionNo) throws SQLException;

	/**
	 * joinTable���� clientNo�� �ش��ϴ� categoryNo�� ������ ��ȸ���� �迭�� ���� ������ category����ŭ count��
	 * �����ϰ� switch�� �� ���ǵ� count�� ���ڸ� ������Ű�� while�� �� ���� �迭�� count���� �����Ѵ�.
	 * 
	 * @param clientNo
	 * @return
	 */
	int[] clientSelectChart(int clientNo) throws SQLException;

	/**
	 * ������ ���ӿ� ���� ��Ʈ �Ѹ���
	 * @param userNo
	 * @return ...
	 * */
	int[] hostSelectChart(int clientNo) throws SQLException;
	
	/**
	 * �������������� ���� ������ �������� ��ȸ
	 * 
	 * @param id
	 * @return list
	 * */
	List<PostDTO> hostSelectMoimByMe(int userNo) throws SQLException;
	
	/**
	 * �������������� ���� ������ �������� ��ȸ
	 * 
	 * @param id
	 * @return
	 */
	List<PostDTO> clientSelectMoimByMe(int userNo) throws SQLException;

	/**
	 * ������ ���ӿ� ���Ͽ� ���ӽ�û ���
	 * 
	 * @param boardNum
	 * @return 1�̻��̸� ���ӽ�û ��� ����, 0�̸� ���ӽ�û ��� ����
	 */
	int clientCancleMoim(int postNo,int userNo) throws SQLException;

	/**
	 * ȸ���� ������ ������� ��
	 * post ���̺��� ���� �����ο��� 1�� �����ؾ���
	 * @param postNo
	 * @return 1�̸� ����, 0 �̸� ����
	 * */
	int minusPostCurrentPeople(Connection con ,int postNo) throws SQLException;
	
	
	/**
	 * �������������� �������� ������Ʈ ��й�ȣ/�̸���/��ȭ��ȣ/�̸� �������� ��, �̸��Ϻ���� �̸��� �ߺ�üũ �ʿ�
	 * 
	 * @param clientDTO
	 * @return
	 */
	int clientUpdateClientInform(ClientDTO clientDTO) throws SQLException;

	/**
	 * ���� �������� Ȯ��
	 * 
	 * @param id
	 * @param boardNum
	 * @return : ture�� ��������(���ӿ� �̹� �����Ȼ����̹Ƿ� ���� �Ұ�)
	 * @return : flase�� ��������
	 */
	boolean clientJoinCheck(int userNo, int postNo) throws SQLException;

}
