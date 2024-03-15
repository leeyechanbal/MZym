package com.mzym.board.vo;

import java.sql.Date;

/**
 * @author 이예찬
 *	게시글 정보관리 클래스
 */
public class Board {
	private int baordNo; // 글번호
	private int baordWriter; // 작성자 = 회원 맴버번호
	private int baordType; // 게시글 카테고리
	private String baordTiltle; // 글 제목
	private String baordcontent; // 글 내용
	private Date registDate; // 등록일
	private Date modify_date; // 수정일
	private String status; 
	private int reviewRate; // null 0 
	private int count;  // 기본값 0
	
	public Board() {
		super();
	}

	public Board(int baordNo, int baordWriter, int baordType, String baordTiltle, String baordcontent, Date registDate,
			Date modify_date, String status, int reviewRate, int count) {
		super();
		this.baordNo = baordNo;
		this.baordWriter = baordWriter;
		this.baordType = baordType;
		this.baordTiltle = baordTiltle;
		this.baordcontent = baordcontent;
		this.registDate = registDate;
		this.modify_date = modify_date;
		this.status = status;
		this.reviewRate = reviewRate;
		this.count = count;
	}

	public int getBaordNo() {
		return baordNo;
	}

	public void setBaordNo(int baordNo) {
		this.baordNo = baordNo;
	}

	public int getBaordWriter() {
		return baordWriter;
	}

	public void setBaordWriter(int baordWriter) {
		this.baordWriter = baordWriter;
	}

	public int getBaordType() {
		return baordType;
	}

	public void setBaordType(int baordType) {
		this.baordType = baordType;
	}

	public String getBaordTiltle() {
		return baordTiltle;
	}

	public void setBaordTiltle(String baordTiltle) {
		this.baordTiltle = baordTiltle;
	}

	public String getBaordcontent() {
		return baordcontent;
	}

	public void setBaordcontent(String baordcontent) {
		this.baordcontent = baordcontent;
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

	@Override
	public String toString() {
		return "Baord [baordNo=" + baordNo + ", baordWriter=" + baordWriter + ", baordType=" + baordType
				+ ", baordTiltle=" + baordTiltle + ", baordcontent=" + baordcontent + ", registDate=" + registDate
				+ ", modify_date=" + modify_date + ", status=" + status + ", reviewRate=" + reviewRate + ", count="
				+ count + "]";
	}
	
	
	
	
	
	
}
