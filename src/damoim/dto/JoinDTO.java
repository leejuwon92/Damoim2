package damoim.dto;

public class JoinDTO {
	private int joinNo;
	private int postNo;
	private int userNo;
	private int categoryNo;

	public JoinDTO(int joinNo, int postNo, int userNo, int categoryNo) {
		this.joinNo = joinNo;
		this.postNo = postNo;
		this.userNo = userNo;
		this.categoryNo = categoryNo;
	}
	public int getJoinNo() {
		return joinNo;
	}
	public void setJoinNo(int joinNo) {
		this.joinNo = joinNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	
	
}
