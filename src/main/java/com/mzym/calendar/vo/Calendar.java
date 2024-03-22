package com.mzym.calendar.vo;

import java.sql.Date;

/**
 * @author 김민정
 */

public class Calendar {
	
	private int calNo;
	private int calUserNo;
	private int calTR;
	private String startDate;
	private String endDate;
	private String calTitle;
	private String calContent;
	private String calColor;
	private Date registDate;
	private Date modifyDate;
	private String status;
	private String field;
	
	private String calUserName;
	private String calPhone;
	private String writer;

	
	public Calendar() {}
	

	public Calendar(int calNo, String calUserName, String startDate, String endDate, String calPhone, String writer,
			String calTitle, String calContent, String calColor) {
		super();
		this.calNo = calNo;
		this.calUserName = calUserName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.calPhone = calPhone;
		this.writer = writer;
		this.calTitle = calTitle;
		this.calContent = calContent;
		this.calColor = calColor;
	}













	public Calendar(int calNo, int calUserNo, int calTR, String startDate, String endDate, String calTitle,
			String calContent, String calColor, Date registDate, Date modifyDate, String status, String field) {
		super();
		this.calNo = calNo;
		this.calUserNo = calUserNo;
		this.calTR = calTR;
		this.startDate = startDate;
		this.endDate = endDate;
		this.calTitle = calTitle;
		this.calContent = calContent;
		this.calColor = calColor;
		this.registDate = registDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.field = field;
	}


	public String getCalUserName() {
		return calUserName;
	}




	public void setCalUserName(String calUserName) {
		this.calUserName = calUserName;
	}




	public String getCalPhone() {
		return calPhone;
	}




	public void setCalPhone(String calPhone) {
		this.calPhone = calPhone;
	}




	public String getWriter() {
		return writer;
	}




	public void setWriter(String writer) {
		this.writer = writer;
	}




	public int getCalNo() {
		return calNo;
	}


	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}


	public int getCalUserNo() {
		return calUserNo;
	}


	public void setCalUserNo(int calUserNo) {
		this.calUserNo = calUserNo;
	}


	public int getCalTR() {
		return calTR;
	}


	public void setCalTR(int calTR) {
		this.calTR = calTR;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getCalTitle() {
		return calTitle;
	}


	public void setCalTitle(String calTitle) {
		this.calTitle = calTitle;
	}


	public String getCalContent() {
		return calContent;
	}


	public void setCalContent(String calContent) {
		this.calContent = calContent;
	}


	public String getCalColor() {
		return calColor;
	}


	public void setCalColor(String calColor) {
		this.calColor = calColor;
	}


	public Date getRegistDate() {
		return registDate;
	}


	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getField() {
		return field;
	}


	public void setField(String field) {
		this.field = field;
	}




	@Override
	public String toString() {
		return "Calendar [calNo=" + calNo + ", calUserNo=" + calUserNo + ", calTR=" + calTR + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", calTitle=" + calTitle + ", calContent=" + calContent + ", calColor="
				+ calColor + ", registDate=" + registDate + ", modifyDate=" + modifyDate + ", status=" + status
				+ ", field=" + field + ", calUserName=" + calUserName + ", calPhone=" + calPhone + ", writer=" + writer
				+ "]";
	}







	
	

	
}
