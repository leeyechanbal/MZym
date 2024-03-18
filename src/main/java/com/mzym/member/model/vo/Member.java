package com.mzym.member.model.vo;

import java.sql.Date;

/**
 * @author 이예찬
 *
 */
public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String phone;
	private String RRN; // 주민번호
	private String email;
	private String address;
	private Date enrollDate;
	private Date modifyDate;
	private String trCareer; // 트레이너 경력
	private String certificate; //자격증
	private String status;
	private String assignTr; // 담당 트레이너 번호
	private String imageURL;
	
	
	public Member() {
		super();
	}

	public Member(int userNo, String userId, String userPwd, String userName, String phone, String rRN, String email,
			String address, Date enrollDate, Date modifyDate, String trCareer, String certificate, String status,
			String assignTr, String imageURL) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.RRN = rRN;
		this.email = email;
		this.address = address;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.trCareer = trCareer;
		this.certificate = certificate;
		this.status = status;
		this.assignTr = assignTr;
		this.imageURL = imageURL;
	}

	public Member(int userNo, String userId, String userPwd, String userName, String phone, String rRN, String email,
			String address, Date enrollDate, Date modifyDate, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		RRN = rRN;
		this.email = email;
		this.address = address;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public Member(String userId, String phone, String email, String address) {
		super();
		this.userId = userId;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}
	
	

	public Member(int userNo, String userName, String phone) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.phone = phone;
	}

	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getRRN() {
		return RRN;
	}


	public void setRRN(String rRN) {
		RRN = rRN;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getTrCareer() {
		return trCareer;
	}


	public void setTrCareer(String trCareer) {
		this.trCareer = trCareer;
	}


	public String getCertificate() {
		return certificate;
	}


	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getAssignTr() {
		return assignTr;
	}


	public void setAssignTr(String assignTr) {
		this.assignTr = assignTr;
	}


	public String getImageURL() {
		return imageURL;
	}


	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", phone=" + phone + ", RRN=" + RRN + ", email=" + email + ", address=" + address + ", enrollDate="
				+ enrollDate + ", modifyDate=" + modifyDate + ", trCareer=" + trCareer + ", certificate=" + certificate
				+ ", status=" + status + ", assignTr=" + assignTr + ", imageURL=" + imageURL + "]";
	}

}
