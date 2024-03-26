package com.mzym.board.vo;

import java.sql.Date;
import java.util.List;

public class Board {
	private int boardNo; // 글번호 
	private int boardWriter; // 작성자 = 회원 맴버번호
	private String boardMember; // 조인한 작성자 = 이름
	private int boardType; // 게시글 숫자로 받는 카테고리
	private String boardTitle; // 글 제목
	private String boardContent; // 글 내용
	private Date regist_Date; // 등록일
	private Date modify_date; // 수정일
	private String status; 
	private int reviewRate; // null 0 
	private int count;  // 기본값 0
	private String category; // 게시판 카테고리명을 담기 위한 변수
	
	private Attachment att; // 게시글의 첨부파일을 담기 위한 객체
	private List<Attachment> atList;
	
	private String titleImgURL; // 대표이미지 경로 (후기게시판 목록페이지조회)
	
	public Board() {
		super();
	}
	
	public Board(int boardType) {
		super();
		this.boardType = boardType;
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
	
	public String getBoardMember() {
		return boardMember;
	}

	public void setBoardMember(String boardmember) {
		this.boardMember = boardmember;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getRegist_Date() {
		return regist_Date;
	}

	public void setRegist_Date(Date regist_Date) {
		this.regist_Date = regist_Date;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Attachment getAtt() {
		return att;
	}

	public void setAtt(Attachment att) {
		this.att = att;
	}

	public String getTitleImgURL() {
		return titleImgURL;
	}

	public void setTitleImgURL(String titleImgURL) {
		this.titleImgURL = titleImgURL;
	}

	public List<Attachment> getAtList() {
		return atList;
	}

	public void setAtList(List<Attachment> atList) {
		this.atList = atList;
	}

	public Board(int boardNo, int boardWriter, int boardType, String boardTitle, String boardContent, Date regist_Date,
			Date modify_date, String status, int reviewRate, int count) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.regist_Date = regist_Date;
		this.modify_date = modify_date;
		this.status = status;
		this.reviewRate = reviewRate;
		this.count = count;
	}

	public Board(int boardNo, String boardTitle, String boardMember, int count, Date regist_Date) {
		super();
		this.boardNo = boardNo;
		this.boardMember = boardMember;
		this.boardTitle = boardTitle;
		this.regist_Date = regist_Date;
		this.count = count;
	}

	public Board(int boardNo, String boardTitle, String boardContent, String boardMember) {
		super();
		this.boardNo = boardNo;
		this.boardMember = boardMember;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
	}
	

	public Board(int boardNo, String boardMember, int boardType, String boardTitle, String boardContent) {
		super();
		this.boardNo = boardNo;
		this.boardMember = boardMember;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
	}

	/**
	 * db의 신고 테이블에서 게시판 과 첨부파일을 받아오는 생성자
	 * @author 이예찬
	 * @param boardNo 글번호
	 * @param boardMember 글쓴이
	 * @param boardTitle 글 제목
	 * @param boardContent 글 내용
	 * @param att 각 글에 맞는 첨부파일
	 */
	public Board(int boardNo, int boardType , String boardMember, String boardTitle, String boardContent, Attachment att) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardMember = boardMember;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.att = att;
	}
	
	/**
	 * 게시물 pt 후기일 경우 첨부파일을 받아오기 위한 생성자
	 * @author 이예찬
	 * @param boardNo 글번호
	 * @param boardType 글의 종류
	 * @param boardMember 글쓴이
	 * @param boardTitle 글 제목
	 * @param boardContent 글 내용
	 * @param atList 첨부파일 여러개의 사진 게시판을 받아오기 위한 리스트
	 */
	public Board(int boardNo, int boardType , String boardMember, String boardTitle, String boardContent, List<Attachment> atList) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardMember = boardMember;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.atList = atList;
	}

	/**
	 * 댓글 테이블에 필요한 데이터를 db에서 조회해서 담은 생성자 
	 * @author 이예찬
	 * @param boardNo 글번호
	 * @param boardType 게시글의 카테고리 번호
	 */
	public Board(int boardNo,String boardTitle, int boardType) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardType = boardType;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardMember=" + boardMember
				+ ", boardType=" + boardType + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", regist_Date=" + regist_Date + ", modify_date=" + modify_date + ", status=" + status
				+ ", reviewRate=" + reviewRate + ", count=" + count + ", category=" + category + ", atList=" + atList
				+ "]";
	}
	
	
	
}
