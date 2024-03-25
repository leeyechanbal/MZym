package com.mzym.board.vo;


/**
 * 신고에 대한 데이터를 담는 클래스
 * @author 이예찬
 */
public class Report {
	private int reportNo; // 신고 번호
	private int boardNo; // 글번호
	private int commentNo; // 댓글 번호
	private int categoryNo; // 카테고리 번호
	private int reportUser; // 신고한 회원 번호
	private String reportDate; // 신고한 날짜
	private String status;
	
	private String userID; // 신고한 유저 아이디를 담을 변수
	
	private Board board; // 게시글 정보를 담은 객체
	private Comment comment; // 댓글 정보를 담을 객체
	
	public Report() {}

	

	public Report(int reportNo, int boardNo, int commentNo, int categoryNo, int reportUser, String reportDate,
			String status, String categoryName, String userID, Board board, Comment comment) {
		super();
		this.reportNo = reportNo;
		this.boardNo = boardNo;
		this.commentNo = commentNo;
		this.categoryNo = categoryNo;
		this.reportUser = reportUser;
		this.reportDate = reportDate;
		this.status = status;
		this.userID = userID;
		this.board = board;
		this.comment = comment;
	}
	
	
	

	/**
	 * 신고된 게시글의 정보을 받아오는 생성자
	 * @author 이예찬
	 * @param reportNo 신고 카테고리 유형 번호
	 * @param categoryNo 화면에서 비교할 카테고리 번호
	 * @param reportDate 신고된 날짜
	 * @param userID 신고자의 아이디
	 * @param board 신고 된 게시물의 정보
	 */
	public Report(int reportNo, int categoryNo, String reportDate, String userID, Board board) {
		super();
		this.reportNo = reportNo;
		this.categoryNo = categoryNo;
		this.reportDate = reportDate;
		this.userID = userID;
		this.board = board;
	}



	/**
	 * 신고된 댓글의 정보을 받아오는 생성자
	 * @author 이예찬
	 * @param reportNo 신고 번호
	 * @param categoryNo 신고 카테고리 유형 번호
	 * @param reportDate 신고일
	 * @param userID 신고자 아이디
	 * @param board 신고된 댓글의 게시글 정보
	 * @param comment 신고된 댓글의 정보
	 */
	public Report(int reportNo, int categoryNo, String reportDate, String userID, Board board, Comment comment) {
		super();
		this.reportNo = reportNo;
		this.categoryNo = categoryNo;
		this.reportDate = reportDate;
		this.userID = userID;
		this.board = board;
		this.comment = comment;
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
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}


	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", boardNo=" + boardNo + ", commentNo=" + commentNo + ", categoryNo="
				+ categoryNo + ", reportUser=" + reportUser + ", reportDate=" + reportDate + ", status=" + status
				+ ", userID=" + userID + ", board=" + board + ", comment=" + comment
				+ "]";
	}



}


