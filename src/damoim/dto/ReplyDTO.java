package damoim.dto;

public class ReplyDTO {
	private int questionNo;
	private int postNo;
	private String replyContent;
	private int answerNo;
	private int userNo;
	private String regdate;
	public ReplyDTO(int questionNo, int postNo, String replyContent, int answerNo, int userNo, String regdate) {
		this.questionNo = questionNo;
		this.postNo = postNo;
		this.replyContent = replyContent;
		this.answerNo = answerNo;
		this.userNo = userNo;
		this.regdate = regdate;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getAnswerNo() {
		return answerNo;
	}
	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
