package com.mzym.board.vo;

import java.sql.Date;

/**
 * @author 이예찬
 *	상담문의 관련 데이터 관리 클래스
 *	Y는 상담완료  보고서가 존재
 *	N은 상담 대기 보고서가 null
 */
public class Advice {
	private int adviceNo;
	private int categoryNo;
	private int adviceTR; // 트레이너 회원번호
	private String adviceName; // 상담자 이름
	private String phone; // 핸드폰 번호
	private String adviceDate; // 상담 신청 날짜
	private String adviceContent; // 상담 내용
	private String regist; // 등록일
	private String repeat; // 보고서
	private String status; // Y가 완료 된것 N이 완료가 안된 것
	private String modifyDate; // 데이터 수정일
	
	// 조회에서 필요한 데이터들
	private String trainerId; // 트레이너 아이디
	private String categoryName;
	
	// 수정한 날짜가 없음
	
	
	public Advice() {
		super();
	}

	public Advice(int adviceNo, int categoryNo, int adviceTR, String adviceName, String phone, String adviceDate,
			String adviceContent, String regist, String repeat, String status) {
		super();
		this.adviceNo = adviceNo;
		this.categoryNo = categoryNo;
		this.adviceTR = adviceTR;
		this.adviceName = adviceName;
		this.phone = phone;
		this.adviceDate = adviceDate;
		this.adviceContent = adviceContent;
		this.regist = regist;
		this.repeat = repeat;
		this.status = status;
	}

	/**
	 * @author 이예찬
	 * @param adviceNo
	 * @param adviceName
	 * @param phone
	 * @param categoryName
	 * @param adviceDate
	 * @param trainerId
	 * @param adviceContent
	 * @param repeat
	 * @param regist
	 * @param status
	 * 페이징 처리된 상담글의 페이지의 데이터를 담기 위한 생성자
	 */
	public Advice(int adviceNo, String adviceName, String phone,String categoryName, 
					String adviceDate, String trainerId, String adviceContent,
					String repeat, String regist, String modifyDate ,String status) {
		super();
		this.adviceNo = adviceNo;
		this.adviceName = adviceName;
		this.phone = phone;
		this.adviceDate = adviceDate;
		this.adviceContent = adviceContent;
		this.regist = regist;
		this.modifyDate = modifyDate;
		this.repeat = repeat;
		this.status = status;
		this.trainerId = trainerId;
		this.categoryName = categoryName;
	}
	

	/**
	 * @author 이예찬
	 * @param adviceNo
	 * @param repeat
	 * @param status
	 * 상담에 대한 보고서를 작성하거나 수정 할때 사용되는 매서드
	 */
	public Advice(int adviceNo,String trainerId, String repeat, String status) {
		super();
		this.adviceNo = adviceNo;
		this.trainerId = trainerId;
		this.repeat = repeat;
		this.status = status;
	}
	
	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	
	/**
	 * @author 구성모
	 * @param categoryNo
	 * @param adviceName
	 * @param phone
	 * @param adviceDate
	 * @param adviceContent
	 */
	public Advice(int categoryNo, String adviceName, String phone, String adviceDate, String adviceContent) {
		super();
		this.categoryNo = categoryNo;
		this.adviceName = adviceName;
		this.phone = phone;
		this.adviceDate = adviceDate;
		this.adviceContent = adviceContent;
	}

	public String getTrainerId() {
		return trainerId;
	}

	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getAdviceNo() {
		return adviceNo;
	}

	public void setAdviceNo(int adviceNo) {
		this.adviceNo = adviceNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getAdviceTR() {
		return adviceTR;
	}

	public void setAdviceTR(int adviceTR) {
		this.adviceTR = adviceTR;
	}

	public String getAdviceName() {
		return adviceName;
	}

	public void setAdviceName(String adviceName) {
		this.adviceName = adviceName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdviceDate() {
		return adviceDate;
	}

	public void setAdviceDate(String adviceDate) {
		this.adviceDate = adviceDate;
	}

	public String getAdviceContent() {
		return adviceContent;
	}

	public void setAdviceContent(String adviceContent) {
		this.adviceContent = adviceContent;
	}

	public String getRegist() {
		return regist;
	}

	public void setRegist(String regist) {
		this.regist = regist;
	}

	public String getRepeat() {
		return repeat;
	}

	public void setRepeat(String repeat) {
		this.repeat = repeat;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Advice [adviceNo=" + adviceNo + ", categoryNo=" + categoryNo + ", adviceTR=" + adviceTR
				+ ", adviceName=" + adviceName + ", phone=" + phone + ", adviceDate=" + adviceDate + ", adviceContent="
				+ adviceContent + ", regist=" + regist + ", repeat=" + repeat + ", status=" + status + ", modifyDate="
				+ modifyDate + ", trainerId=" + trainerId + ", categoryName=" + categoryName + "]";
	}
	
}
