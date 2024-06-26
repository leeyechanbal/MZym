package com.mzym.mypage.model.vo;

public class Payment {
	
	/**
	 * @author 손수현
	 */
	
	private int paymentNo;
	private String productName; //조회시 상품명 작성시 번호
	private String paymentUser;  
	private int paymentPrice;
	private String paymentDate;
	private String status;
	private int productNo;
	private String paymentName;

	public Payment(int paymentNo, String productName, String paymentUser, int paymentPrice, String paymentDate,
			String status, int productNo, String paymentName) {
		super();
		this.paymentNo = paymentNo;
		this.productName = productName;
		this.paymentUser = paymentUser;
		this.paymentPrice = paymentPrice;
		this.paymentDate = paymentDate;
		this.status = status;
		this.productNo = productNo;
		this.paymentName = paymentName;
	}

	public Payment(int paymentNo, String productName, String paymentUser, int paymentPrice, String paymentDate,
			String status, int productNo) {
		super();
		this.paymentNo = paymentNo;
		this.productName = productName;
		this.paymentUser = paymentUser;
		this.paymentPrice = paymentPrice;
		this.paymentDate = paymentDate;
		this.status = status;
		this.productNo = productNo;
	}

	public Payment () {}

	public Payment(int paymentNo, String productName, String paymentUser, int paymentPrice, String paymentDate,
			String status) {
		super();
		this.paymentNo = paymentNo;
		this.productName = productName;
		this.paymentUser = paymentUser;
		this.paymentPrice = paymentPrice;
		this.paymentDate = paymentDate;
		this.status = status;
	}

	public Payment(String paymentDate, String productName, int paymentPrice) {
		super();
		this.paymentDate = paymentDate;
		this.productName = productName;
		this.paymentPrice = paymentPrice;
		
	}

	public Payment(int paymentNo, String productName, int paymentPrice, String paymentDate) {
		super();
		this.paymentNo = paymentNo;
		this.productName = productName;
		this.paymentPrice = paymentPrice;
		this.paymentDate = paymentDate;
	}
	
	
	public String getPaymentName() {
		return paymentName;
	}

	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPaymentUser() {
		return paymentUser;
	}

	public void setPaymentUser(String paymentUser) {
		this.paymentUser = paymentUser;
	}

	public int getPaymentPrice() {
		return paymentPrice;
	}

	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", productName=" + productName + ", paymentUser=" + paymentUser
				+ ", paymentPrice=" + paymentPrice + ", paymentDate=" + paymentDate + ", status=" + status + "]";
	}


	

	
	

	

	
	
	
	
	
}

	

	
	