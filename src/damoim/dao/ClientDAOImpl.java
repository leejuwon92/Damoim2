package damoim.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import damoim.dto.ClientDTO;
import damoim.dto.JoinDTO;
import damoim.dto.PostDTO;
import damoim.dto.ReplyDTO;
import damoim.util.DbUtil;

public class ClientDAOImpl implements ClientDAO {

	@Override
	public int clientJoinMoim(JoinDTO joinDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = null;
		
		int result = 0;
		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			if(joinDTO.getPostNo() != 0) {
				sql = "insert into join_table(join_no,post_no,user_no,category_no) values (join_no.nextval,?,?,?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, joinDTO.getPostNo());
				ps.setInt(2, joinDTO.getUserNo());
				ps.setInt(3, joinDTO.getCategoryNo());
			} else {
				sql = "insert into join_table values(join_no.nextval, "
						+ "(select post_no from (select post_no from post "
						+ "where user_no = ? order by post_no desc) where ROWNUM=1 ), ?, ?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, joinDTO.getUserNo());
				ps.setInt(2, joinDTO.getUserNo());
				ps.setInt(3, joinDTO.getCategoryNo());
			}
			
			result = ps.executeUpdate();
			int result1 = plusPostCurrentPeople(con, joinDTO.getPostNo());
			if (result1 == 0) {
				con.rollback();
			}
		} finally {
			con.commit();
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int plusPostCurrentPeople(Connection con, int postNo) throws SQLException {
		PreparedStatement ps = null;
		String sql = "update post set current_people=current_people+1 where post_no=?";
		int result = 0;
		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);
			ps.setInt(1, postNo);
			result = ps.executeUpdate();
		} finally {
			con.commit();
			DbUtil.dbClose(ps, null);
		}
		
	
		return result;
	}

	@Override
	public int clientInsertReply(ReplyDTO replyDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "";
		int result = 0;
		try {
			con = DbUtil.getConnection();
			if(replyDTO.getAnswerNo()==0) {
				sql = "insert into QnA (question_no,post_no,reply_content,answer_no,user_no,regdate) values(reply_no.nextval,?,?,null,?,sysdate)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, replyDTO.getPostNo());
				ps.setString(2, replyDTO.getReplyContent());
				ps.setInt(3, replyDTO.getUserNo());
			}else {
				sql = "insert into QnA (question_no,post_no,reply_content,answer_no,user_no,regdate) values(reply_no.nextval,?,?,?,?,sysdate)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, replyDTO.getPostNo());
				ps.setString(2, replyDTO.getReplyContent());
				ps.setInt(3, replyDTO.getAnswerNo());
				ps.setInt(4, replyDTO.getUserNo());
			}
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int clientDeleteReply(int questionNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "delete from QnA where question_no = ?";
		int result = 0;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, questionNo);
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int[] clientSelectChart(int clientNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "select category_no from join_table jo join post po on jo.post_no"
				+ "= po.post_no where jo.user_no!=po.user_no and jo.user_no = ?";
		ResultSet rs = null;
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		int count4 = 0;
		int count5 = 0;
		int count6 = 0;
		int count7 = 0;
		int count8 = 0;
		int count9 = 0;
		int count10 = 0;
		int count11 = 0;
		int[] result = { count1, count2, count3, count4, count5, count6, count7, count8, count9, count10, count11 };
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, clientNo);
			rs = ps.executeQuery();
			while (rs.next()) {
				int cateCount = rs.getInt(1);
				switch (cateCount) {
				case 1:
					count1++;
				case 2:
					count2++;
				case 3:
					count3++;
				case 4:
					count4++;
				case 5:
					count5++;
				case 6:
					count6++;
				case 7:
					count7++;
				case 8:
					count8++;
				case 9:
					count9++;
				case 10:
					count10++;
				case 11:
					count11++;
				}
				result[0] = count1;
				result[1] = count2;
				result[2] = count3;
				result[3] = count4;
				result[4] = count5;
				result[5] = count6;
				result[6] = count7;
				result[7] = count8;
				result[8] = count9;
				result[9] = count10;
				result[10] = count11;
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return result;
	}
	
	
	@Override
	public int[] hostSelectChart(int clientNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "select category_no from post where user_no=?";
		ResultSet rs = null;
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		int count4 = 0;
		int count5 = 0;
		int count6 = 0;
		int count7 = 0;
		int count8 = 0;
		int count9 = 0;
		int count10 = 0;
		int count11 = 0;
		int[] result = { count1, count2, count3, count4, count5, count6, count7, count8, count9, count10, count11 };
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, clientNo);
			rs = ps.executeQuery();
			while (rs.next()) {
				int cateCount = rs.getInt(1);
				switch (cateCount) {
				case 1:
					count1++;
				case 2:
					count2++;
				case 3:
					count3++;
				case 4:
					count4++;
				case 5:
					count5++;
				case 6:
					count6++;
				case 7:
					count7++;
				case 8:
					count8++;
				case 9:
					count9++;
				case 10:
					count10++;
				case 11:
					count11++;
				}
				result[0] = count1;
				result[1] = count2;
				result[2] = count3;
				result[3] = count4;
				result[4] = count5;
				result[5] = count6;
				result[6] = count7;
				result[7] = count8;
				result[8] = count9;
				result[9] = count10;
				result[10] = count11;
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return result;
	}
	

	@Override
	public List<PostDTO> hostSelectMoimByMe(int userNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from post where user_no = ?";
		      List<PostDTO> list = new ArrayList<PostDTO>();
		      try {
		         con = DbUtil.getConnection();
		         ps = con.prepareStatement(sql);
		         ps.setInt(1, userNo);
		         rs = ps.executeQuery();
		         while (rs.next()) {
		            int postNo = rs.getInt(1);
		            int dbuserNo = rs.getInt(2);
		            String postTitle = rs.getString(3);
		            String postDescr = rs.getString(4);
		            String postContent = rs.getString(5);
		            int categoryCode = rs.getInt(6);
		            int locationCode = rs.getInt(7);
		            String locationDetail = rs.getString(8);
		            String deadline = rs.getString(9);
		            String meetingDate = rs.getString(10);
		            int totalPeople = rs.getInt(12);
		            int currentPeople = rs.getInt(13);
		            String thumbnailFile = rs.getString(14);
		            String bannerFile = rs.getString(15);
		            list.add(new PostDTO(postNo, dbuserNo, postTitle, postDescr, postContent, categoryCode, locationCode,
		            		locationDetail, null, deadline, meetingDate, totalPeople, currentPeople, thumbnailFile, bannerFile));
		         }
		      } finally {
		         DbUtil.dbClose(rs, ps, con);
		      }
		      return list;
		   }


	@Override
	public List<PostDTO> clientSelectMoimByMe(int userNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select po.post_no, po.user_no, post_title, post_descr, post_content, " + 
				"po.category_no, po.location_no, po.location_detail, regdate, deadline, meeting_date, " + 
				"total_people, current_people, thumbnailfile, bannerfile " + 
				"from join_table jo " + 
				"join post po " + 
				"on jo.post_no = po.post_no " + 
				"where jo.user_no = ? and not po.user_no= ?";
		List<PostDTO> list = new ArrayList<PostDTO>();
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, userNo);			
			ps.setInt(2, userNo);

			rs = ps.executeQuery();
			while (rs.next()) {
				int postNo = rs.getInt(1);
				int dbuserNo = rs.getInt(2);
				String postTitle = rs.getString(3);
				String postDescr = rs.getString(4);
				String postContent = rs.getString(5);
				int categoryCode = rs.getInt(6);
				int locationCode = rs.getInt(7);
				String locationDetail = rs.getString(8);
				String deadline = rs.getString(9);
				String meetingDate = rs.getString(10);
				int totalPeople = rs.getInt(12);
				int currentPeople = rs.getInt(13);
				String thumbnailFile = rs.getString(14);
				String bannerFile = rs.getString(15);
				list.add(new PostDTO(postNo, dbuserNo, postTitle, postDescr, postContent, categoryCode, locationCode,
						locationDetail, null, deadline, meetingDate, totalPeople, currentPeople, thumbnailFile, bannerFile));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	@Override
	public int clientCancleMoim(int postNo, int userNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "delete from join_table where post_no=? and user_no=?";
		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);
			ps.setInt(1, postNo);
			ps.setInt(2, userNo);
			result = ps.executeUpdate();
			int result1 = minusPostCurrentPeople(con, postNo);
			if (result1 == 0) {
				con.rollback();
			}
		} finally {
			con.commit();
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int minusPostCurrentPeople(Connection con, int postNo) throws SQLException {
		PreparedStatement ps = null;
		String sql = "update post set current_people=current_people-1 where post_no=?";
		int result = 0;
		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);
			ps.setInt(1, postNo);
			result = ps.executeUpdate();
		} finally {
			con.commit();
			DbUtil.dbClose(ps, null);
		}
		return result;
	}

	@Override
	public int clientUpdateClientInform(ClientDTO clientDTO) throws SQLException {
		PreparedStatement ps = null;
		Connection con = null;
		int result = 0;
		String sql = "update user_table set user_pwd=?,user_name=?,user_email=?, user_phone=? where user_no=?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, clientDTO.getUserPwd());
			ps.setString(2, clientDTO.getUserName());
			ps.setString(3, clientDTO.getUserEmail());
			ps.setString(4, clientDTO.getPhoneNo());
			ps.setInt(5, clientDTO.getUserNo());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public boolean clientJoinCheck(int userNo, int postNo) throws SQLException {
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String sql = "select user_no from join_table where user_no=? and post_no=?";
		boolean result = false;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, userNo);
			ps.setInt(2, postNo);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return result;
	}

	

}
