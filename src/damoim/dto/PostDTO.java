package damoim.dto;

public class PostDTO {
	private int postNo;
	private int userNo;
	private String postTitle;
	private String postDescr;
	private String postContent;
	private int categoryCode;
	private int locationCode;
	private String locationDetail;
	private String regDate;
	private String deadline;
	private String meetingDate;
	private int totalPeople;
	private int currentPeople;
	private String thumbnailFile;
	private String bannerFile;

	public PostDTO() {}

	public PostDTO(int postNo, int userNo, String postTitle, String postDescr, String postContent, int categoryCode,
			int locationCode, String locationDetail, String regDate, String deadline, String meetingDate,
			int totalPeople, int currentPeople, String thumbnailFile, String bannerFile) {
		this.postNo = postNo;
		this.userNo = userNo;
		this.postTitle = postTitle;
		this.postDescr = postDescr;
		this.postContent = postContent;
		this.categoryCode = categoryCode;
		this.locationCode = locationCode;
		this.locationDetail = locationDetail;
		this.regDate = regDate;
		this.deadline = deadline;
		this.meetingDate = meetingDate;
		this.totalPeople = totalPeople;
		this.currentPeople = currentPeople;
		this.thumbnailFile = thumbnailFile;
		this.bannerFile = bannerFile;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
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

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostDescr() {
		return postDescr;
	}

	public void setPostDescr(String postDescr) {
		this.postDescr = postDescr;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public int getLocationCode() {
		return locationCode;
	}

	public void setLocationCode(int locationCode) {
		this.locationCode = locationCode;
	}

	public String getLocationDetail() {
		return locationDetail;
	}

	public void setLocationDetail(String locationDetail) {
		this.locationDetail = locationDetail;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getMeetingDate() {
		return meetingDate;
	}

	public void setMeetingDate(String meetingDate) {
		this.meetingDate = meetingDate;
	}

	public int getTotalPeople() {
		return totalPeople;
	}

	public void setTotalPeople(int totalPeople) {
		this.totalPeople = totalPeople;
	}

	public int getCurrentPeople() {
		return currentPeople;
	}

	public void setCurrentPeople(int currentPeople) {
		this.currentPeople = currentPeople;
	}

	public String getThumbnailFile() {
		return thumbnailFile;
	}

	public void setThumbnailFile(String thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}

	public String getBannerFile() {
		return bannerFile;
	}

	public void setBannerFile(String bannerFile) {
		this.bannerFile = bannerFile;
	}
	
	public String categoryNoTocategoryName(int categoryCode) {
		String categoryName = null;
		switch (categoryCode) {
		case 1:
			categoryName = "댄스";
			break;
		case 2:
			categoryName = "스포츠";
			break;
		case 3:
			categoryName = "독서";
			break;
		case 4:
			categoryName = "음악";
			break;
		case 5:
			categoryName = "외국어";
			break;
		case 6:
			categoryName = "공예";
			break;
		case 7:
			categoryName = "봉사활동";
			break;
		case 8:
			categoryName = "여행";
			break;
		case 9:
			categoryName = "사진";
			break;
		case 10:
			categoryName = "요리";
			break;
		case 11:
			categoryName = "반려동물";
			break;
		}
		
		return categoryName;
	}

	public String locationNoTolocationName(int locationCode) {
		String locationName = null;
		switch (locationCode) {
		case 1:
			locationName = "서울특별시";
			break;
		case 2:
			locationName = "경기도";
			break;
		case 3:
			locationName = "인천광역시";
			break;
		case 4:
			locationName = "충청도";
			break;
		case 5:
			locationName = "강원도";
			break;
		case 6:
			locationName = "전라도";
			break;
		case 7:
			locationName = "경상도";
			break;
		case 8:
			locationName = "제주도";
			break;
		}

		return locationName;

	}
}
