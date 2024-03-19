package com.mzym.board.vo;


/**
 * @author 이예찬
 * 공지사항에 대한 데이터를 관리하는 객체
 */
public class Notice {
	private int noticeNo;
	private int writer; // 참조 => member 회원번호
	private String writerName; // 위 회원번호에 해당하는 유저 아이디
	private String title;
	private String content;
	private String registDate; // 등록일
	private String modifyDate; // 수정일
	private String startDate; // 작성일 == 등록일
	private String status;
	
	private Attachment att; // 쿼리에서 게시글의 정보을 담아올 객체
	// hase관계, is관계
	
	public Notice() {
		super();
	}
	
	
	public Notice(int noticeNo, int writer, String writerName, String title, String content, String registDate,
			String modifyDate, String startDate, String status, Attachment att) {
		super();
		this.noticeNo = noticeNo;
		this.writer = writer;
		this.writerName = writerName;
		this.title = title;
		this.content = content;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.startDate = startDate;
		this.status = status;
		this.att = att;
	}

	/**
	 * @author 이예찬
	 * @param noticeNo 공지사항 번호
	 * @param writerName 작성자 아이디
	 * @param title 
	 * @param content
	 * @param registDate
	 * @param att 공지사항에 대한 첨부 파일
	 * 트레이너 페이지의 공지사항의을 페이징 처리시에 공지사항의 조회됭 데이터를 당기 위한 생성자
	 */
	public Notice(int noticeNo, String writerName, String title, String content, String registDate, Attachment att) {
		super();
		this.noticeNo = noticeNo;
		this.writerName = writerName;
		this.title = title;
		this.content = content;
		this.registDate = registDate;
		this.att = att;
	}
	

	/**
	 * @author 이예찬
	 * @param writer
	 * @param title
	 * @param content
	 * 공지사항 등록시 필요한 데이터를 담아 쿼리에 전달 하기 위한 생성자
	 */
	public Notice(int writer, String title, String content) {
		super();
		this.writer = writer;
		this.title = title;
		this.content = content;
	}

	/**
	 * @author 이예찬
	 * @param writer
	 * @param title
	 * @param content
	 * @param att
	 * 공지사항 수정시 사용되는 생성자
	 */
	public Notice(int noticeNo, int writer, String title, String content,  Attachment att) {
		super();
		this.noticeNo = noticeNo;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.att = att;
	}


	/**
	 * @author 이예찬
	 * @param writer
	 * @param title
	 * @param content
	 * @param att
	 * 공지사항을 추가할떄 
	 */
	public Notice(int writer, String title, String content, Attachment att) {
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.att = att;
	}


	public Attachment getAtt() {
		return att;
	}

	public void setAtt(Attachment att) {
		this.att = att;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", registDate=" + registDate + ", modifyDate=" + modifyDate + ", startDate=" + startDate + ", status="
				+ status + "]";
	} 
}
