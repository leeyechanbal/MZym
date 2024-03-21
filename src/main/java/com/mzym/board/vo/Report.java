package com.mzym.board.vo;


/**
 * 신고에 대한 데이터를 담는 클래스
 * @author 이예찬
 */
public class Report {
	private int reportNo;
	private int boardNO;
	private int commentNo;
	private int categoryNO;
	private int repoertUser; // 신고한 회원 번호
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
		this.boardNO = boardNO;
		this.commentNo = commentNo;
		this.categoryNO = categoryNO;
		this.repoertUser = repoertUser;
		this.reportDate = reportDate;
		this.status = status;
		this.at = at;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getBoardNO() {
		return boardNO;
	}

	public void setBoardNO(int boardNO) {
		this.boardNO = boardNO;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getCategoryNO() {
		return categoryNO;
	}

	public void setCategoryNO(int categoryNO) {
		this.categoryNO = categoryNO;
	}

	public int getRepoertUser() {
		return repoertUser;
	}

	public void setRepoertUser(int repoertUser) {
		this.repoertUser = repoertUser;
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

	public Attachment getAt() {
		return at;
	}

	public void setAt(Attachment at) {
		this.at = at;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", boardNO=" + boardNO + ", commentNo=" + commentNo + ", categoryNO="
				+ categoryNO + ", repoertUser=" + repoertUser + ", reportDate=" + reportDate + ", status=" + status
				+ ", at=" + at + "]";
	}

	
}
