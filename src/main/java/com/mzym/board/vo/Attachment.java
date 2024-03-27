package com.mzym.board.vo;

import java.sql.Date;

/**
 * @author 이예찬
 * 첨부파일 관련된 정보를 관리하는 클래스 입니다.
 *
 */
public class Attachment {
	private int fileNO;
	private int attNo; // 참조 글번호
	private String attCategory; // 게시글 유형 (N,B,P)
	private String originName; 
	private String changeName;
	private String filePath;
	private Date uploadeDate; //sysdate
	private int fileLevel; // 1 : 대표  나머지
	private String status; 
	private boolean checkedFile;
	
	public Attachment() {
		super();
	}

	public Attachment(int fileNO, int attNo, String attCategory, String originName, String changeName, String filePath,
			Date uploadeDate, int fileLevel, String status) {
		super();
		this.fileNO = fileNO;
		this.attNo = attNo;
		this.attCategory = attCategory;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadeDate = uploadeDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}

	/**
	 * @author 이예찬
	 * @param originName
	 * @param changeName
	 * @param filePath
	 * 공지사항에 첨부파일이 존재 할 경우 담아올 객체
	 */
	public Attachment(String originName, String changeName, String filePath) {
		super();
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
	}

	
	/**
	 * @author 이예찬
	 * @param originName
	 * @param changeName
	 * @param filePath
	 * @param checkedFile
	 * 공지사항 업데이트 시 첨부파일이 존재하는지를 확인하는 생성자
	 */
	public Attachment(String originName, String changeName, String filePath, boolean checkedFile) {
		super();
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.checkedFile = checkedFile;
	}
	
	

	/**
	 * 게시물 or 후기 게시물을 받아오는 생성자
	 * @author 이예찬
	 * @param originName
	 * @param changeName
	 * @param filePath
	 * @param fileLevel
	 */
	public Attachment(String originName, String changeName, String filePath, int fileLevel) {
		super();
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
	}

	public boolean isCheckedFile() {
		return checkedFile;
	}

	public void setCheckedFile(boolean checkedFile) {
		this.checkedFile = checkedFile;
	}

	public int getFileNO() {
		return fileNO;
	}

	public void setFileNO(int fileNO) {
		this.fileNO = fileNO;
	}

	public int getAttNo() {
		return attNo;
	}

	public void setAttNo(int attNo) {
		this.attNo = attNo;
	}

	public String getAttCategory() {
		return attCategory;
	}

	public void setAttCategory(String attCategory) {
		this.attCategory = attCategory;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadeDate() {
		return uploadeDate;
	}

	public void setUploadeDate(Date uploadeDate) {
		this.uploadeDate = uploadeDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath + "]\n";
	}



	
}
