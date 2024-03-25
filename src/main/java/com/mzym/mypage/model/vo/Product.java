package com.mzym.mypage.model.vo;

import java.sql.Date;

public class Product {
	
	/**
	 * @author 손수현
	 */
	
	private int productNo;
	private String productName; 
	private String productContent;
	private int price;
	private Date registDate;
	private int count;
	private String upfileUrl;
	
	public Product() {}

	public Product(int productNo, String productName, String productContent, int price, Date registDate,int count, String upfileUrl) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productContent = productContent;
		this.price = price;
		this.registDate = registDate;
		this.upfileUrl = upfileUrl;
		this.count =count;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getUpfileUrl() {
		return upfileUrl;
	}

	public void setUpfileUrl(String upfileUrl) {
		this.upfileUrl = upfileUrl;
	}

	public Product(String productName, String productContent, int price) {
		super();
		this.productName = productName;
		this.productContent = productContent;
		this.price = price;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productContent=" + productContent
				+ ", price=" + price + ", registDate=" + registDate + "]";
	}
	
	
}
