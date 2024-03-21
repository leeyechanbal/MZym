package com.mzym.board.vo;

public class Comment {
	
	private int commentNo;
	private int boardNo;
	private String commentWriter;
	private String userName;
	private String commentDate;
	private String commentContent;
	private String status;
	
	private Board board; // 신고글 조회시 필요한 객체
	
	public Comment() {}

	public Comment(int commentNo, int boardNo, String commentWriter, String userName, String commentDate,
			String commentContent, String status) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.commentWriter = commentWriter;
		this.userName = userName;
		this.commentDate = commentDate;
		this.commentContent = commentContent;
		this.status = status;
	}

	
	
	public Comment(int commentNo, String commentWriter, String commentContent, String commentDate) {
		super();
		this.commentNo = commentNo;
		this.commentWriter = commentWriter;
		this.commentDate = commentDate;
		this.commentContent = commentContent;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
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
	
	/**
	 * 신고 댓글 정보을 받아오는 생성자
	 * @author 이예찬
	 * @param commentNo 댓글 번호
	 * @param commentContent 댓글 내용
	 * @param commentWriter 댓글 작성자
	 * 
	 */
	public Comment(int commentNo, String commentContent, String commentWriter) {
		super();
		this.commentNo = commentNo;
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
	}

	
	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", boardNo=" + boardNo + ", commentWriter=" + commentWriter
				+ ", userName=" + userName + ", commentDate=" + commentDate + ", commentContent=" + commentContent
				+ ", status=" + status + "]";
	}
	
	
}
