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
	 * 로그인 시 사용하는 메소드
	 * (리턴후 Controller에서 clientNo와 clientId를 sessionScope에 저장)
	 * @param id, pwd
	 * @return ClientDTO로 리턴
	 */
	@Override
	public ClientDTO userLogin(String id, String pwd) throws SQLException{
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ClientDTO clientDTO = null;
		
		String sql = "SELECT * FROM user_table where user_id = ? and user_pwd = ?";

		try {// 로드 연결 실행
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			if (rs.next()) {// 커서를 아래로 이동하면서 데이터를 조회
				
				int userNo = rs.getInt(1);
				String userId = rs.getString(2);
				String userPwd = rs.getString(3);
				String userName = rs.getString(4);
				String userEmail = rs.getString(5);
				String phoneNo = rs.getString(6);
				
				clientDTO = new ClientDTO(userNo, userId, userPwd, userName, userEmail, phoneNo);
				
			} //if
		} finally { // 닫기
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return clientDTO;
		
	}
	
	/**
	 * 회원가입 시 사용하는 메소드
	 * @param clientDTO
	 * @return 1이면 회원가입 성공, 0이면 회원가입 실패
	 */
	@Override
	public int userRegister(ClientDTO clientDTO) throws SQLException {
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "insert into user_table values(user_no.nextval, ?, ?, ?, ?, ?)"; 

		try {// 로드 연결 실행
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, clientDTO.getUserId());
			ps.setString(2, clientDTO.getUserPwd());
			ps.setString(3, clientDTO.getUserName());
			ps.setString(4, clientDTO.getUserEmail());
			ps.setString(5, clientDTO.getPhoneNo());
			result = ps.executeUpdate();
				
		} finally { // 닫기
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

		try {// 로드 연결 실행
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, clientDTO.getUserName());
			ps.setString(2, clientDTO.getUserEmail());
			ps.setString(3, clientDTO.getPhoneNo());
			rs = ps.executeQuery();
			if (rs.next()) {// 커서를 아래로 이동하면서 데이터를 조회
				
				userId = rs.getString(2);
			} //if
		} finally { // 닫기
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

		try {// 로드 연결 실행
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, clientDTO.getUserName());
			ps.setString(2, clientDTO.getUserEmail());
			ps.setString(3, clientDTO.getPhoneNo());
			ps.setString(4, clientDTO.getUserId());
			rs = ps.executeQuery();
			if (rs.next()) {// 커서를 아래로 이동하면서 데이터를 조회
				
				userPwd = rs.getString(3);
			} //if
		} finally { // 닫기
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
	 * 아이디 중복 체크
	 * @param id
	 * @return true면 아이디 존재함(아이디 사용불가) false면 존재하지 않음(아이디 사용가능)
	 */
	@Override
	public boolean userIdCheck(String id) throws SQLException{
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		
		String sql = "SELECT * FROM user_table where upper(user_id) = upper(?)";

		try {// 로드 연결 실행
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {// 커서를 아래로 이동하면서 데이터를 조회
				result = true;
			} //if
		} finally { // 닫기
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return result;
	}
	
	/**
	 * 이메일 중복 체크
	 * @param email
	 * @return true면 이메일 존재함(이메일 사용불가), false면 존재하지 않음(이메일 사용가능)
	 */
	@Override
	public boolean userEmailCheck(String email) throws SQLException {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		
		String sql = "SELECT * FROM user_table where user_email = ?";

		try {// 로드 연결 실행
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();

			if (rs.next()) {// 커서를 아래로 이동하면서 데이터를 조회
				result = true;
			} //if
		} finally { // 닫기
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return result;
	}

}
