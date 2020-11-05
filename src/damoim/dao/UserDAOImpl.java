package damoim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import damoim.dto.ClientDTO;
import damoim.dto.PostDTO;
import damoim.util.DbUtil;

public class UserDAOImpl implements UserDAO {
	
	/**
	 * �α��� �� ����ϴ� �޼ҵ�
	 * (������ Controller���� clientNo�� clientId�� sessionScope�� ����)
	 * @param id, pwd
	 * @return ClientDTO�� ����
	 */
	@Override
	public ClientDTO userLogin(String id, String pwd) throws SQLException{
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ClientDTO clientDTO = null;
		
		String sql = "SELECT * FROM user_table where user_id = ? and user_pwd = ?";

		try {// �ε� ���� ����
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			if (rs.next()) {// Ŀ���� �Ʒ��� �̵��ϸ鼭 �����͸� ��ȸ
				
				int userNo = rs.getInt(1);
				String userId = rs.getString(2);
				String userPwd = rs.getString(3);
				String userName = rs.getString(4);
				String userEmail = rs.getString(5);
				String phoneNo = rs.getString(6);
				
				clientDTO = new ClientDTO(userNo, userId, userPwd, userName, userEmail, phoneNo);
				
			} //if
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return clientDTO;
		
	}
	
	/**
	 * ȸ������ �� ����ϴ� �޼ҵ�
	 * @param clientDTO
	 * @return 1�̸� ȸ������ ����, 0�̸� ȸ������ ����
	 */
	@Override
	public int userRegister(ClientDTO clientDTO) throws SQLException {
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "insert into user_table values(user_no.nextval, ?, ?, ?, ?, ?)"; 

		try {// �ε� ���� ����
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, clientDTO.getUserId());
			ps.setString(2, clientDTO.getUserPwd());
			ps.setString(3, clientDTO.getUserName());
			ps.setString(4, clientDTO.getUserEmail());
			ps.setString(5, clientDTO.getPhoneNo());
			result = ps.executeUpdate();
				
		} finally { // �ݱ�
			DbUtil.dbClose(ps, con);
		} // catch
		return result;
	}

	@Override
	public String userSelectId(ClientDTO clientDTO) throws SQLException{
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String userId = null;
		String sql = "SELECT * FROM user_table where user_name = ? and user_email = ? and user_phone = ?";

		try {// �ε� ���� ����
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, clientDTO.getUserName());
			ps.setString(2, clientDTO.getUserEmail());
			ps.setString(3, clientDTO.getPhoneNo());
			rs = ps.executeQuery();
			if (rs.next()) {// Ŀ���� �Ʒ��� �̵��ϸ鼭 �����͸� ��ȸ
				
				userId = rs.getString(2);
			} //if
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return userId;
	}

	@Override
	public String userSelectPwd(ClientDTO clientDTO) throws SQLException {
	
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String userPwd = null;
		String sql = "SELECT * FROM user_table where user_name = ? and user_email = ? and user_phone = ? and user_id = ?";

		try {// �ε� ���� ����
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, clientDTO.getUserName());
			ps.setString(2, clientDTO.getUserEmail());
			ps.setString(3, clientDTO.getPhoneNo());
			ps.setString(4, clientDTO.getUserId());
			rs = ps.executeQuery();
			if (rs.next()) {// Ŀ���� �Ʒ��� �̵��ϸ鼭 �����͸� ��ȸ
				
				userPwd = rs.getString(3);
			} //if
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return userPwd;
	}

	@Override
	public List<PostDTO> userSelectBoardList(int categoryNum, int locationCode, String date) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PostDTO userSelectBoard(int boardNum) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * ���̵� �ߺ� üũ
	 * @param id
	 * @return true�� ���̵� ������(���̵� ���Ұ�) false�� �������� ����(���̵� ��밡��)
	 */
	@Override
	public boolean userIdCheck(String id) throws SQLException{
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		
		String sql = "SELECT * FROM user_table where upper(user_id) = upper(?)";

		try {// �ε� ���� ����
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {// Ŀ���� �Ʒ��� �̵��ϸ鼭 �����͸� ��ȸ
				result = true;
			} //if
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return result;
	}
	
	/**
	 * �̸��� �ߺ� üũ
	 * @param email
	 * @return true�� �̸��� ������(�̸��� ���Ұ�), false�� �������� ����(�̸��� ��밡��)
	 */
	@Override
	public boolean userEmailCheck(String email) throws SQLException {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		
		String sql = "SELECT * FROM user_table where user_email = ?";

		try {// �ε� ���� ����
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();

			if (rs.next()) {// Ŀ���� �Ʒ��� �̵��ϸ鼭 �����͸� ��ȸ
				result = true;
			} //if
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return result;
	}

}
