package com.mzym.board.vo;

public class Report {
	
	private int reportNo;
	private int boardNo;
	private int commentNo;
	private int categoryNo;
	private int reportUser;
	private String reportDate;
	private String status;
	
	public Report() {}

	public Report(int reportNo, int boardNo, int commentNo, int categoryNo, int reportUser, String reportDate,
			String status) {
		super();
		this.reportNo = reportNo;
		this.boardNo = boardNo;
		this.commentNo = commentNo;
		this.categoryNo = categoryNo;
		this.reportUser = reportUser;
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


