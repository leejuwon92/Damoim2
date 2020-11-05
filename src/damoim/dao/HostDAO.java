package damoim.dao;

import java.sql.SQLException;
import java.util.List;

import damoim.dto.PostDTO;
import damoim.dto.ClientDTO;

public interface HostDAO {

	/**
	 * Host�� ������ �����ϴ� ���
	 * @param postDTO
	 * @return 1�̸� ���ӻ�������, 0�̸� ���ӻ��� ����
	 */
	int hostCreateMoim(PostDTO postDTO) throws SQLException;
	
	/**
	 * Host�� ������ ������ �����ϴ� ���
	 * @param postDTO
	 * @return 1�̸� ���Ӽ�������, 0�̸� ���Ӽ��� ����
	 */
	int hostUpdateMoim(PostDTO postDTO) throws SQLException;
	
	/**
	 * Host�� ������ �����ϴ� ���
	 * ��¥�� �������� ������ ������ �̳��� �Խñ��� ���� �Ұ����ϴ�.
	 * @param boardNum
	 * @return
	 */
	int hostDeleteMoim(int boardNum) throws SQLException;

	/**
	 * ���ӿ� ������ ȸ������ ��ȸ
	 * id, �̸�, ����ó, ���������� host���� �����Ѵ�.	
	 * @param boardNum
	 * @return 
	 */
	List<ClientDTO> hostSelectClientByMoim(int boardNum) throws SQLException;
	
	/**
	 * �亯�ޱ� + ��� ���� : (hostController���� ClientServiceȣ���� ���� ���� ����ۼ� �޼ҵ� ���)
	 */
	
	
}
