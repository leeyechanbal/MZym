package com.mzym.member.model.vo;

public class ReprePayment {
	private int paymentNo;
	private String userName;
	private String productName;
	private int price;
	private String paymentDate;
	

	public ReprePayment() {
	}
	public ReprePayment(int paymentNo, String userName, String productName, int price, String paymentDate,
			String totalPrice) {
		super();
		this.paymentNo = paymentNo;
		this.userName = userName;
		this.productName = productName;
		this.price = price;
		this.paymentDate = paymentDate;
	}

	public ReprePayment(int paymentNo, String userName, String productName, int price, String paymentDate) {
		super();
		this.paymentNo = paymentNo;
		this.userName = userName;
		this.productName = productName;
		this.price = price;
		this.paymentDate = paymentDate;
	}
	
	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	@Override
	public String toString() {
		return "ReprePayment [paymentNo=" + paymentNo + ", userName=" + userName + ", productName=" + productName
				+ ", price=" + price + ", paymentDate=" + paymentDate + "]";
	}

	
	
}
