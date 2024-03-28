package com.mzym.payment.model.vo;

public class Payment {
	private int paymentNo; 
	private int productNo; 
	private int paymentUser; 
	private int paymentPrice;
	private String paymentDate; 
	private String status; 
	private String paymentName; 
	
	public Payment() {
		
	}

	public Payment(int paymentNo, int productNo, int paymentUser, int paymentPrice, String paymentDate, String status,
			String paymentName) {
		super();
		this.paymentNo = paymentNo;
		this.productNo = productNo;
		this.paymentUser = paymentUser;
		this.paymentPrice = paymentPrice;
		this.paymentDate = paymentDate;
		this.status = status;
		this.paymentName = paymentName;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getPaymentUser() {
		return paymentUser;
	}

	public void setPaymentUser(int paymentUser) {
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

	public String getPaymentName() {
		return paymentName;
	}

	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}

	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", productNo=" + productNo + ", paymentUser=" + paymentUser
				+ ", paymentPrice=" + paymentPrice + ", paymentDate=" + paymentDate + ", status=" + status
				+ ", paymentName=" + paymentName + "]";
	}
	
	
}
