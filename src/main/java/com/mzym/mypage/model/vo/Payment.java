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

	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", productName=" + productName + ", paymentUser=" + paymentUser
				+ ", paymentPrice=" + paymentPrice + ", paymentDate=" + paymentDate + ", status=" + status + "]";
	}


	

	
	

	

	
	
	
	
	
}

	

	
	