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
	private int reportUser; // 신고한 회원 번호
	private String reportDate; // 신고한 날짜
	private String status;
	private Attachment at; // 신고 글에 담기는 첨부파일 객체
	
	public Report() {
		super();
		
	}

	public Report(int reportNo, int boardNO, int commentNo, int categoryNO, int repoertUser, String reportDate,
			String status, Attachment at) {
		super();
		this.reportNo = reportNo;
		this.boardNo = boardNO;
		this.commentNo = commentNo;
		this.categoryNo = categoryNO;
		this.reportUser = repoertUser;
		this.reportDate = reportDate;
		this.status = status;
		this.at = at;
	}


	public Report(int reportNo, int boardNo, int categoryNo, int reportUser) {
		super();
		this.reportNo = reportNo;
		this.boardNo = boardNo;
		this.categoryNo = categoryNo;
		this.reportUser = reportUser;
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

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", boardNo=" + boardNo + ", commentNo=" + commentNo + ", categoryNo="
				+ categoryNo + ", reportUser=" + reportUser + ", reportDate=" + reportDate + ", status=" + status + "]";
	}
	
	

}


