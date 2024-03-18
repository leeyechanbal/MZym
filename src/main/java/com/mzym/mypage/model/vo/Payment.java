package com.mzym.mypage.model.vo;

import java.sql.Date;

public class Payment {
	
	private int paymentNo;
	private int productNo;
	private String paymentUser;  
	private int paymentPrice;
	private Date paymentDate;
	private String status;
	
	public Payment () {}

	public Payment(int paymentNo, int productNo, String paymentUser, int paymentPrice, Date paymentDate,
			String status) {
		super();
		this.paymentNo = paymentNo;
		this.productNo = productNo;
		this.paymentUser = paymentUser;
		this.paymentPrice = paymentPrice;
		this.paymentDate = paymentDate;
		this.status = status;
	}

	public Payment(int productNo, int paymentPrice, Date paymentDate) {
		super();
		this.productNo = productNo;
		this.paymentPrice = paymentPrice;
		this.paymentDate = paymentDate;
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

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
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
		return "Payment [paymentNo=" + paymentNo + ", productNo=" + productNo + ", paymentUser=" + paymentUser
				+ ", paymentPrice=" + paymentPrice + ", paymentDate=" + paymentDate + ", status=" + status + "]";
	}

	
	
	
	
	
}

	

	
	