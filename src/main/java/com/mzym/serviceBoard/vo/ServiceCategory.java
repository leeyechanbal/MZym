package com.mzym.serviceBoard.vo;

public class ServiceCategory {
	private int categoryNo;
	private String categoryName;
	
	public ServiceCategory() {
		
	}
	
	public ServiceCategory(int categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "ServiceCategory [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}
	
	
	
	
}
