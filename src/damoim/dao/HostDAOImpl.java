package damoim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import damoim.dto.ClientDTO;
import damoim.dto.PostDTO;
import damoim.util.DbUtil;

public class HostDAOImpl implements HostDAO {

	@Override
	public int hostCreateMoim(PostDTO postDTO) throws SQLException{
		String sql = "insert into post values("
				+ "post_no.nextval, ?, ?, ?, ?, ?, ?, ?, "
				+ "sysdate, ?, ?, ?, 1, ?, ?)";
		Connection con = DbUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, postDTO.getUserNo());
		ps.setString(2, postDTO.getPostTitle());
		ps.setString(3, postDTO.getPostDescr());
		ps.setString(4, postDTO.getPostContent());
		ps.setInt(5, postDTO.getCategoryCode());
		ps.setInt(6, postDTO.getLocationCode());
		ps.setString(7, postDTO.getLocationDetail());
		ps.setString(8, postDTO.getDeadline());
		ps.setString(9, postDTO.getMeetingDate());
		ps.setInt(10, postDTO.getTotalPeople());
		ps.setString(11, postDTO.getThumbnailFile());
		ps.setString(12, postDTO.getBannerFile());
		
		int result = ps.executeUpdate();
		DbUtil.dbClose(ps, con);
		return result;
	}

	@Override
	public int hostUpdateMoim(PostDTO postDTO) throws SQLException{
		String sql = "update post set post_descr = ?, post_content = ?, location_detail = ?, "
				+ "deadline = ?, meeting_date = ?, total_people = ? where post_no = ?";
		Connection con = DbUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, postDTO.getPostDescr());
		ps.setString(2, postDTO.getPostContent());
		ps.setString(3, postDTO.getLocationDetail());
		ps.setString(4, postDTO.getDeadline());
		ps.setString(5, postDTO.getMeetingDate());
		ps.setInt(6, postDTO.getTotalPeople());
		ps.setInt(7, postDTO.getPostNo());
		int result = ps.executeUpdate();
		DbUtil.dbClose(ps, con);
		return result;
	}

	@Override
	public int hostDeleteMoim(int postNum) throws SQLException{
		String sql = "delete from post where post_no = ?";
		Connection con = DbUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, postNum);
		int result = ps.executeUpdate();
		DbUtil.dbClose(ps, con);
		return result;
	}

	@Override
	public List<ClientDTO> hostSelectClientByMoim(int boardNum) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ClientDTO> list = new ArrayList<ClientDTO>();
		String sql = "select * from user_table where user_no in (select user_no from join_table where post_no = ?)";
		con = DbUtil.getConnection();
		ps = con.prepareStatement(sql);
		ps.setInt(1, boardNum);
		rs = ps.executeQuery();
		while(rs.next()) {
			int userNo = rs.getInt(1);
			String userId = rs.getString(2);
			String userPwd = rs.getString(3);
			String userName = rs.getString(4);
			String userEmail = rs.getString(5);
			String phoneNo = rs.getString(6);
			
			ClientDTO client = new ClientDTO(userNo, userId, userPwd, userName, userEmail, phoneNo);
			list.add(client);
		}
		
		DbUtil.dbClose(rs, ps, con);;

		return list;
	}

}
