package damoim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.Clinit;

import damoim.dto.ClientDTO;
import damoim.dto.PostDTO;
import damoim.dto.ReplyDTO;
import damoim.util.DbUtil;

public class UserDAOImpl implements UserDAO {

	/**
	 * �α��� �� ����ϴ� �޼ҵ� (������ Controller���� clientNo�� clientId�� sessionScope�� ����)
	 * 
	 * @param id, pwd
	 * @return ClientDTO�� ����
	 */
	@Override
	public ClientDTO userLogin(String id, String pwd) throws SQLException {

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

			} // if
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return clientDTO;

	}

	/**
	 * ȸ������ �� ����ϴ� �޼ҵ�
	 * 
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
	public String userSelectId(ClientDTO clientDTO) throws SQLException {

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
			} // if
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
			} // if
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return userPwd;
	}

	@Override
	public List<PostDTO> userSelectBoardList(int categoryNum, int locationCode, int date) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<PostDTO> list = new ArrayList<PostDTO>();
		String sql = null;
		try {// �ε� ���� ����
			con = DbUtil.getConnection();
			if (categoryNum == 0 && locationCode == 0 && date == 0) {
				sql = "select * from post";
				ps = con.prepareStatement(sql);
				// ps.setInt(1, categoryNum);
				// ps.setInt(2, locationCode);
				// ps.setInt(3, date);
			}else if(categoryNum != 0 && locationCode == 0 && date == 0) {
				sql = "select * from post where category_no = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, categoryNum);
				
			}else if(categoryNum == 0 && locationCode != 0 && date == 0) {
				sql = "select * from post where location_no = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, locationCode);
				
			}else if(categoryNum == 0 && locationCode == 0 && date != 0) {
				sql = "select * from post where deadline > (sysdate-?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, date);
				
			}else if(categoryNum != 0 && locationCode != 0 && date == 0) {
				sql = "select * from post where category_no = ? and location_no = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, categoryNum);
				ps.setInt(2, locationCode);
				
			}else if(categoryNum != 0 && locationCode == 0 && date != 0) {
				sql = "select * from post where category_no = ? and deadline > (sysdate-?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, categoryNum);
				ps.setInt(2, date);
				
			}else if(categoryNum == 0 && locationCode != 0 && date != 0) {
				sql = "select * from post where location_no = ? and deadline > (sysdate-?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, locationCode);
				ps.setInt(2, date);
				
				
			}else if(categoryNum != 0 && locationCode != 0 && date != 0) {
				sql = "select * from post where category_no = ? and location_no = ? and deadline > (sysdate-?) ";
				ps = con.prepareStatement(sql);
				ps.setInt(1, categoryNum);
				ps.setInt(2, locationCode);
				ps.setInt(3, date);
			}
			

			rs = ps.executeQuery();
			while (rs.next()) {// Ŀ���� �Ʒ��� �̵��ϸ鼭 �����͸� ��ȸ
				int postNo = rs.getInt(1);
				int userNo = rs.getInt(2);
				String postTitle = rs.getString(3);
				String postDescr = rs.getString(4);
				String postContent = rs.getString(5);
				int categoryCode = rs.getInt(6);
				locationCode = rs.getInt(7);
				String locationDetail = rs.getString(8);
				String regDate = rs.getString(9);
				String deadline = rs.getString(10);
				String meetingDate = rs.getString(11);
				int totalPeople = rs.getInt(12);
				int currentPeople = rs.getInt(13);
				String thumbnailFile = rs.getString(14);
				String bannerFile = rs.getString(15);
				PostDTO postDTO = new PostDTO(postNo, userNo, postTitle, postDescr, postContent, categoryCode,
						locationCode, locationDetail, regDate, deadline, meetingDate, totalPeople, currentPeople,
						thumbnailFile, bannerFile);
				list.add(postDTO);
			} // while
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return list;

	}

	@Override
	public PostDTO userSelectBoard(int PostNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		PostDTO postDTO = null;
		String sql = "select * from post where post_no = ?";
		try {// �ε� ���� ����
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, PostNo);
			rs = ps.executeQuery();
			if (rs.next()) {// Ŀ���� �Ʒ��� �̵��ϸ鼭 �����͸� ��ȸ
				int postNo = rs.getInt(1);
				int userNo = rs.getInt(2);
				String postTitle = rs.getString(3);
				String postDescr = rs.getString(4);
				String postContent = rs.getString(5);
				int categoryCode = rs.getInt(6);
				int locationCode = rs.getInt(7);
				String locationDetail = rs.getString(8);
				String regDate = rs.getString(9);
				String deadline = rs.getString(10);
				String meetingDate = rs.getString(11);
				int totalPeople = rs.getInt(12);
				int currentPeople = rs.getInt(13);
				String thumbnailFile = rs.getString(14);
				String bannerFile = rs.getString(15);
				postDTO = new PostDTO(postNo, userNo, postTitle, postDescr, postContent, categoryCode, locationCode,
						locationDetail, regDate, deadline, meetingDate, totalPeople, currentPeople, thumbnailFile,
						bannerFile);
			} // if
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return postDTO;
	}

	/**
	 * ���̵� �ߺ� üũ
	 * 
	 * @param id
	 * @return true�� ���̵� ������(���̵� ���Ұ�) false�� �������� ����(���̵� ��밡��)
	 */
	@Override
	public boolean userIdCheck(String id) throws SQLException {

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
			} // if
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return result;
	}

	/**
	 * �̸��� �ߺ� üũ
	 * 
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
			} // if
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return result;
	}
	
	/**
	 * userNo�� �̿��ؼ� client�� ��� ������ �ҷ����� ���
	 * @param userNo
	 */
	@Override
	public ClientDTO userSelectClient(int userNo) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ClientDTO clientDTO = null;
		String sql = "select * from user_table where user_no = ?";
		
		try {// �ε� ���� ����
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, userNo);
			rs = ps.executeQuery();
			if (rs.next()) {// Ŀ���� �Ʒ��� �̵��ϸ鼭 �����͸� ��ȸ
				
				userNo = rs.getInt(1);
				String userId = rs.getString(2);
				String userPwd = rs.getString(3);
				String userName = rs.getString(4);
				String userEmail = rs.getString(5);
				String phoneNo = rs.getString(6);
				
				clientDTO = new ClientDTO(userNo, userId, userPwd, userName, userEmail, phoneNo);
			} // if
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return clientDTO;
	}
	
	/**
	 * postNo�� �̿��ؼ� QNA Table�� ��� ������ �ҷ����� ���
	 * @param userNo
	 */
	@Override
	public List<ReplyDTO> userSelectReplyList(int postNo) throws SQLException {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		String sql = "select * from qna where post_no = ? order by regdate";
		
		try {// �ε� ���� ����
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, postNo);
			rs = ps.executeQuery();
			while (rs.next()) {// Ŀ���� �Ʒ��� �̵��ϸ鼭 �����͸� ��ȸ
				
				int questionNo = rs.getInt(1);
				postNo = rs.getInt(2);
				String replyContent = rs.getString(3);
				int answerNo = rs.getInt(4);
				int userNo = rs.getInt(5);
				String regdate = rs.getString(6);
			
				ReplyDTO replyDTO = new ReplyDTO(questionNo, postNo, replyContent, answerNo, userNo, regdate);
				list.add(replyDTO);
			
			} //while
		} finally { // �ݱ�
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return list;
		
	}
	

}
