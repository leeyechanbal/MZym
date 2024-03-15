package com.mzym.mypage.vo;

import java.sql.Date;

public class Inbody {
	
	private int userNo;
	private int bodyHeight;
	private int bodyWeight;
	private int badyMetabolism;
	private int body_fat;
	private Date registDate;
	
	public Inbody() {}

	public Inbody(int userNo, int bodyHeight, int bodyWeight, int badyMetabolism, int body_fat, Date registDate) {
		super();
		this.userNo = userNo;
		this.bodyHeight = bodyHeight;
		this.bodyWeight = bodyWeight;
		this.badyMetabolism = badyMetabolism;
		this.body_fat = body_fat;
		this.registDate = registDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBodyHeight() {
		return bodyHeight;
	}

	public void setBodyHeight(int bodyHeight) {
		this.bodyHeight = bodyHeight;
	}

	public int getBodyWeight() {
		return bodyWeight;
	}

	public void setBodyWeight(int bodyWeight) {
		this.bodyWeight = bodyWeight;
	}

	public int getBadyMetabolism() {
		return badyMetabolism;
	}

	public void setBadyMetabolism(int badyMetabolism) {
		this.badyMetabolism = badyMetabolism;
	}

	public int getBody_fat() {
		return body_fat;
	}

	public void setBody_fat(int body_fat) {
		this.body_fat = body_fat;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	@Override
	public String toString() {
		return "Inbody [userNo=" + userNo + ", bodyHeight=" + bodyHeight + ", bodyWeight=" + bodyWeight
				+ ", badyMetabolism=" + badyMetabolism + ", body_fat=" + body_fat + ", registDate=" + registDate + "]";
	}
	
	
	
	

}
