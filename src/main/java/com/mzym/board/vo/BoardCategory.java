package com.mzym.board.vo;

/**
 * @author 황수림
 *	게시판 카테고리 클래스
 */

public class BoardCategory {
	
	private int categoryNo; // 게시판 카테고리 번호
	private String categoryName; // 게시판 카테고리명
	
	public BoardCategory() {}

	public BoardCategory(int categoryNo, String categoryName) {
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
		return "BoardCategory [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}
	
	

}
