package com.mzym.mypage.model.vo;

import java.sql.Date;

public class Food {
	/**
	 * @author 손수현
	 */
	
	private int foodNo;
	private int foodUser;
	private String foodDate;
	private String foodCategory;
	private String foodName;
	private int foodCal;
	private Date registDate;
	private String status; 

	public Food(int foodNo, int foodUser, String foodDate, String foodCategory, String foodName, int foodCal,
			Date registDate, String status) {
		super();
		this.foodNo = foodNo;
		this.foodUser = foodUser;
		this.foodDate = foodDate;
		this.foodCategory = foodCategory;
		this.foodName = foodName;
		this.foodCal = foodCal;
		this.registDate = registDate;
		this.status = status;
	}

	public Food(int foodNo, int foodUser) {
		super();
		this.foodNo = foodNo;
		this.foodUser = foodUser;
	}

	public Food(int foodNo, int foodUser, String foodDate, String foodCategory, String foodName, int foodCal,
			Date registDate) {
		super();
		this.foodNo = foodNo;
		this.foodUser = foodUser;
		this.foodDate = foodDate;
		this.foodCategory = foodCategory;
		this.foodName = foodName;
		this.foodCal = foodCal;
		this.registDate = registDate;
	}

	public int getFoodNo() {
		return foodNo;
	}

	public void setFoodNo(int foodNo) {
		this.foodNo = foodNo;
	}

	public int getFoodUser() {
		return foodUser;
	}

	public void setFoodUser(int foodUser) {
		this.foodUser = foodUser;
	}

	public String getFoodDate() {
		return foodDate;
	}

	public void setFoodDate(String foodDate) {
		this.foodDate = foodDate;
	}

	public String getFoodCategory() {
		return foodCategory;
	}

	public void setFoodCategory(String foodCategory) {
		this.foodCategory = foodCategory;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getFoodCal() {
		return foodCal;
	}

	public void setFoodCal(int foodCal) {
		this.foodCal = foodCal;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Food [foodNo=" + foodNo + ", foodUser=" + foodUser + ", foodDate=" + foodDate + ", foodCategory="
				+ foodCategory + ", foodName=" + foodName + ", foodCal=" + foodCal + ", registDate=" + registDate
				+ ", status=" + status + "]";
	}
	
	
	
	
	
	
	

}
