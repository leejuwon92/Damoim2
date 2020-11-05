package damoim.dao;

import java.util.List;

import damoim.dto.PostDTO;
import damoim.dto.ClientDTO;
import damoim.dto.JoinDTO;
import damoim.dto.ReplyDTO;

public interface ClientDAO {

	/**
	 * ���������ϴ� ���
	 * 
	 * @param joinDTO
	 * @return 1�̸� ���Ӱ��� ����, 0�̸� ���Ӱ��� ����
	 */
	int clientJoinMoim(JoinDTO joinDTO);

	/**
	 * ȸ���� post�� ����������� �����ϴ� ���
	 * 
	 * @param replyDTO
	 * @return 1�̸� ��۱��� ����, 0�̸� ��۱��� ����
	 */
	int clientInsertReply(ReplyDTO replyDTO);

	/**
	 * ��ۻ����ϴ� ��� cascade����� ���� �亯���� �Բ� ������	
	 * 
	 * @param replyNum
	 * @return 1�̻��̸� ��ۻ��� ����, 0�̸� ��ۻ��� ����
	 */
	int clientDeleteReply(int replyNum);

	/**
	 * joinTable���� clientNo�� �ش��ϴ� categoryNo�� ������ ��ȸ���� �迭�� ���� ������ category����ŭ count��
	 * �����ϰ� switch�� �� ���ǵ� count�� ���ڸ� ������Ű�� while�� �� ���� �迭�� count���� �����Ѵ�.
	 * 
	 * @param clientNo
	 * @return
	 */
	int[] clientSelectChart(int clientNo);

	/**
	 * �������������� ���� ������ �������� ��ȸ
	 * 
	 * @param id
	 * @return
	 */
	List<PostDTO> clientSelectMoimByMe(String id);

	/**
	 * ������ ���ӿ� ���Ͽ� ���ӽ�û ���
	 * 
	 * @param boardNum
	 * @return 1�̻��̸� ���ӽ�û ��� ����, 0�̸� ���ӽ�û ��� ����
	 */
	int clientCancleMoim(int boardNum);

	/**
	 * �������������� �������� ������Ʈ ��й�ȣ/�̸���/��ȭ��ȣ/�̸� �������� ��, �̸��Ϻ���� �̸��� �ߺ�üũ �ʿ�
	 * 
	 * @param clientDTO
	 * @return
	 */
	int clientUpdateClientInform(ClientDTO clientDTO);

	/**
	 * ���� �������� Ȯ��
	 * 
	 * @param id
	 * @param boardNum
	 * @return : ture�� ��������(���ӿ� �̹� �����Ȼ����̹Ƿ� ���� �Ұ�)
	 * @return : flase�� ��������
	 */
	boolean clientJoinCheck(String id, int boardNum);

}
