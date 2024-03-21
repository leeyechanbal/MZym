package com.mzym.member.model.vo;

public class RepreDate {
	private String selectDate;
	private String sqlDate;
	
	public RepreDate() {
	}

	public RepreDate(String selectDate, String sqlDate) {
		super();
		this.selectDate = selectDate;
		this.sqlDate = sqlDate;
	}

	public String getSelectDate() {
		return selectDate;
	}

	public void setSelectDate(String selectDate) {
		this.selectDate = selectDate;
	}

	public String getSqlDate() {
		return sqlDate;
	}

	public void setSqlDate(String sqlDate) {
		this.sqlDate = sqlDate;
	}

	@Override
	public String toString() {
		return "Repre [selectDate=" + selectDate + ", sqlDate=" + sqlDate + "]";
	}
	
	
}
