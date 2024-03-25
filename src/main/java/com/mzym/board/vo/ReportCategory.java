package com.mzym.board.vo;

/**
 * @author 이예찬
 */
public class ReportCategory {
	private int categoryNo;
	private String categoryName;
	
	public ReportCategory() {
		super();
	}

	public ReportCategory(int categoryNo, String categoryName) {
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
		return "ReportCategory [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}
	
	
}
