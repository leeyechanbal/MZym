package com.mzym.board.vo;

import java.sql.Date;

/**
 * @author 이예찬
 *	게시글 정보관리 클래스
 */
public class Board {
	private int boardNo; // 글번호 
	private int boardWriter; // 작성자 = 회원 맴버번호
	private int boardType; // 게시글 카테고리
	private String boardTiltle; // 글 제목
	private String boardcontent; // 글 내용
	private Date registDate; // 등록일
	private Date modify_date; // 수정일
	private String status; 
	private int reviewRate; // null 0 
	private int count;  // 기본값 0
	
	public Board() {
		super();
	}

	public Board(int boardNo, int boardWriter, String boardTiltle, Date registDate, int count) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTiltle = boardTiltle;
		this.registDate = registDate;
		this.count = count;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(int boardWriter) {
		this.boardWriter = boardWriter;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardTiltle() {
		return boardTiltle;
	}

	public void setBoardTiltle(String boardTiltle) {
		this.boardTiltle = boardTiltle;
	}

	public String getBoardcontent() {
		return boardcontent;
	}

	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getReviewRate() {
		return reviewRate;
	}

	public void setReviewRate(int reviewRate) {
		this.reviewRate = reviewRate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Board(int boardNo, int boardWriter, int boardType, String boardTiltle, String boardcontent, Date registDate,
			Date modify_date, String status, int reviewRate, int count) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.boardTiltle = boardTiltle;
		this.boardcontent = boardcontent;
		this.registDate = registDate;
		this.modify_date = modify_date;
		this.status = status;
		this.reviewRate = reviewRate;
		this.count = count;
	}

}