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
	 * 로그인 시 사용하는 메소드 (리턴후 Controller에서 clientNo와 clientId를 sessionScope에 저장)
	 * 
	 * @param id, pwd
	 * @return ClientDTO로 리턴
	 */
	@Override
	public ClientDTO userLogin(String id, String pwd) throws SQLException {

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

			} // if
		} finally { // 닫기
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return clientDTO;

	}

	/**
	 * 회원가입 시 사용하는 메소드
	 * 
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
	public String userSelectId(ClientDTO clientDTO) throws SQLException {

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
			} // if
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
			} // if
		} finally { // 닫기
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
		try {// 로드 연결 실행
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
			while (rs.next()) {// 커서를 아래로 이동하면서 데이터를 조회
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
		} finally { // 닫기
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
		try {// 로드 연결 실행
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, PostNo);
			rs = ps.executeQuery();
			if (rs.next()) {// 커서를 아래로 이동하면서 데이터를 조회
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
		} finally { // 닫기
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return postDTO;
	}

	/**
	 * 아이디 중복 체크
	 * 
	 * @param id
	 * @return true면 아이디 존재함(아이디 사용불가) false면 존재하지 않음(아이디 사용가능)
	 */
	@Override
	public boolean userIdCheck(String id) throws SQLException {

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
			} // if
		} finally { // 닫기
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return result;
	}

	/**
	 * 이메일 중복 체크
	 * 
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
			} // if
		} finally { // 닫기
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return result;
	}
	
	/**
	 * userNo를 이용해서 client의 모든 정보를 불러오는 기능
	 * @param userNo
	 */
	@Override
	public ClientDTO userSelectClient(int userNo) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ClientDTO clientDTO = null;
		String sql = "select * from user_table where user_no = ?";
		
		try {// 로드 연결 실행
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, userNo);
			rs = ps.executeQuery();
			if (rs.next()) {// 커서를 아래로 이동하면서 데이터를 조회
				
				userNo = rs.getInt(1);
				String userId = rs.getString(2);
				String userPwd = rs.getString(3);
				String userName = rs.getString(4);
				String userEmail = rs.getString(5);
				String phoneNo = rs.getString(6);
				
				clientDTO = new ClientDTO(userNo, userId, userPwd, userName, userEmail, phoneNo);
			} // if
		} finally { // 닫기
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return clientDTO;
	}
	
	/**
	 * postNo를 이용해서 QNA Table의 모든 정보를 불러오는 기능
	 * @param userNo
	 */
	@Override
	public List<ReplyDTO> userSelectReplyList(int postNo) throws SQLException {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		String sql = "select * from qna where post_no = ? order by regdate";
		
		try {// 로드 연결 실행
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, postNo);
			rs = ps.executeQuery();
			while (rs.next()) {// 커서를 아래로 이동하면서 데이터를 조회
				
				int questionNo = rs.getInt(1);
				postNo = rs.getInt(2);
				String replyContent = rs.getString(3);
				int answerNo = rs.getInt(4);
				int userNo = rs.getInt(5);
				String regdate = rs.getString(6);
			
				ReplyDTO replyDTO = new ReplyDTO(questionNo, postNo, replyContent, answerNo, userNo, regdate);
				list.add(replyDTO);
			
			} //while
		} finally { // 닫기
			DbUtil.dbClose(rs, ps, con);
		} // finally

		return list;
		
	}
	

}
