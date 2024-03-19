package com.mzym.board.vo;

import java.sql.Date;

/**
 * @author 이예찬
 *	상담문의 관련 데이터 관리 클래스
 */
public class Advice {
	private int adviceNo;
	private int categoryNo;
	private int adviceTR; // 트레이너 회원번호
	private String adviceName; // 상담자 이름
	private String phone; // 핸드폰 번호
	private String adviceDate; // 상담 신청 날짜
	private String adviceContent; // 상단 내용
	private Date regist; // 등록일
	private String repeat; // 보고서
	private String status;
	
	// 조회에서 필요한 데이터들
	private String trainerId; // 트레이너 아이디
	
	
	public Advice() {
		super();
	}

	public Advice(int adviceNo, int categoryNo, int adviceTR, String adviceName, String phone, String adviceDate,
			String adviceContent, Date regist, String repeat, String status) {
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

	
	
	
	
	public Advice(int int1, String string, String string2, String string3, String string4, String string5,
			String string6, String string7, String string8) {
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

	public Date getRegist() {
		return regist;
	}

	public void setRegist(Date regist) {
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
				+ adviceContent + ", regist=" + regist + ", repeat=" + repeat + ", status=" + status + "]";
	} 
	
	
}
