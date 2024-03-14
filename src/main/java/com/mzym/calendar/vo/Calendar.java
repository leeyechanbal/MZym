package com.mzym.calendar.vo;

import java.sql.Date;

public class Calendar {
	
	private int calNo;
	private int calUserNo;
	private String calTR;
	private String startDate;
	private String endDate;
	private String calTitle;
	private String calContent;
	private String calColor;
	private Date registDate;
	private Date modifyDate;
	private String status;
	
	public Calendar() {}

	public Calendar(int calNo, int calUserNo, String calTR, String startDate, String endDate, String calTitle,
			String calContent, String calColor, Date registDate, Date modifyDate, String status) {
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

	public String getCalTR() {
		return calTR;
	}

	public void setCalTR(String calTR) {
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

	@Override
	public String toString() {
		return "Calendar [calNo=" + calNo + ", calUserNo=" + calUserNo + ", calTR=" + calTR + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", calTitle=" + calTitle + ", calContent=" + calContent + ", calColor="
				+ calColor + ", registDate=" + registDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	

}
