package com.mzym.board.vo;


/**
 * @author 이예찬
 *
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
	
	public Notice() {
		super();
	}

	public Notice(int noticeNo, int writer, String title, String content, String registDate, String modifyDate,
			String startDate, String status) {
		super();
		this.noticeNo = noticeNo;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.startDate = startDate;
		this.status = status;
	}

	/**
	 * @author 이예찬
	 * @param noticeNo
	 * @param writer
	 * @param title
	 * @param content
	 * 트레이너 페이지에서 공지사항 조회시 필요한 데이터 그릇
	 */
	public Notice(int noticeNo, String writerName, String title, String content, String registDate) {
		super();
		this.noticeNo = noticeNo;
		this.writerName = writerName;
		this.title = title;
		this.content = content;
		this.registDate = registDate;
	}

	/**
	 * @author 이예찬
	 * @param writer
	 * @param title
	 * @param content
	 * 공지사항 등록시 필요한 데이터를 담기 위한 생성자
	 */
	public Notice(int writer, String title, String content) {
		super();
		this.writer = writer;
		this.title = title;
		this.content = content;
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
