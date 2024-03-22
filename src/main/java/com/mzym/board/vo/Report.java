package com.mzym.board.vo;


/**
 * 신고에 대한 데이터를 담는 클래스
 * @author 이예찬
 */
public class Report {
	private int reportNo;
	private int boardNo;
	private int commentNo;
	private int categoryNo;
	private String categoryName; // 신고 카테고리이름을 담는 객체
	private int reportUser; // 신고한 회원 번호
	private String reportDate; // 신고한 날짜
	private String status;
	
	private Board board; // 게시글 정보를 담은 객체
	private Comment comment; // 댓글 정보를 담을 객체
	private String UserID; // 조회된 유저 아이디를 담을 변수
	private String type; // 댓글인지 게시판인지 판단하는 변수 
	
	public Report() {}

	public Report(int reportNo, int boardNO, int commentNo, int categoryNO, int repoertUser, String reportDate,
			String status) {
		super();
		this.reportNo = reportNo;
		this.boardNo = boardNO;
		this.commentNo = commentNo;
		this.categoryNo = categoryNO;
		this.reportUser = repoertUser;
		this.reportDate = reportDate;
		this.status = status;
	}


	public Report(int reportNo, int boardNo, int categoryNo, int reportUser) {
		super();
		this.reportNo = reportNo;
		this.boardNo = boardNo;
		this.categoryNo = categoryNo;
		this.reportUser = reportUser;
	}
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getReportUser() {
		return reportUser;
	}

	public void setReportUser(int reportUser) {
		this.reportUser = reportUser;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public String getUserID() {
		return UserID;
	}

	public void setUserID(String userID) {
		UserID = userID;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", boardNo=" + boardNo + ", commentNo=" + commentNo + ", categoryNo="
				+ categoryNo + ", reportUser=" + reportUser + ", reportDate=" + reportDate + ", status=" + status + "]";
	}
	
	

}


