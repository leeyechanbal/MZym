package com.mzym.serviceBoard.vo;



public class ServiceBoard {
	private int serviceNo;
	private String serviceUser;
	private String categoryNo;
	private String serviceTitle;
	private String serviceContent;
	private String registDate;
	private String editDate;
	private String serviceTr; // 답변 트레이너 이름
	private String serviceRepeat; // 답변 내용
	private String repeatDate;
	private String status;
	private String upfileUrl; // 파일 
	private String keyward;
	private int fileNo;
	
	
	public ServiceBoard() {
		
	}


	public ServiceBoard(int serviceNo, String serviceUser, String categoryNo, String serviceTitle,
			String serviceContent, String registDate, String editDate, String serviceTr, String serviceRepeat,
			String repeatDate, String status, String upfileUrl, String keyward, int fileNo) {
		super();
		this.serviceNo = serviceNo;
		this.serviceUser = serviceUser;
		this.categoryNo = categoryNo;
		this.serviceTitle = serviceTitle;
		this.serviceContent = serviceContent;
		this.registDate = registDate;
		this.editDate = editDate;
		this.serviceTr = serviceTr;
		this.serviceRepeat = serviceRepeat;
		this.repeatDate = repeatDate;
		this.status = status;
		this.upfileUrl = upfileUrl;
		this.keyward = keyward;
		this.fileNo = fileNo;
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public String getKeyward() {
		return keyward;
	}


	public void setKeyward(String keyward) {
		this.keyward = keyward;
	}


	public int getServiceNo() {
		return serviceNo;
	}


	public void setServiceNo(int serviceNo) {
		this.serviceNo = serviceNo;
	}


	public String getServiceUser() {
		return serviceUser;
	}


	public void setServiceUser(String serviceUser) {
		this.serviceUser = serviceUser;
	}


	public String getCategoryNo() {
		return categoryNo;
	}


	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}


	public String getServiceTitle() {
		return serviceTitle;
	}


	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}


	public String getServiceContent() {
		return serviceContent;
	}


	public void setServiceContent(String serviceContent) {
		this.serviceContent = serviceContent;
	}


	public String getRegistDate() {
		return registDate;
	}


	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}


	public String getEditDate() {
		return editDate;
	}


	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}


	public String getServiceTr() {
		return serviceTr;
	}


	public void setServiceTr(String serviceTr) {
		this.serviceTr = serviceTr;
	}


	public String getServiceRepeat() {
		return serviceRepeat;
	}


	public void setServiceRepeat(String serviceRepeat) {
		this.serviceRepeat = serviceRepeat;
	}


	public String getRepeatDate() {
		return repeatDate;
	}


	public void setRepeatDate(String repeatDate) {
		this.repeatDate = repeatDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getUpfileUrl() {
		return upfileUrl;
	}


	public void setUpfileUrl(String upfileUrl) {
		this.upfileUrl = upfileUrl;
	}


	@Override
	public String toString() {
		return "ServiceBoard [serviceNo=" + serviceNo + ", serviceUser=" + serviceUser + ", categoryNo=" + categoryNo
				+ ", serviceTitle=" + serviceTitle + ", serviceContent=" + serviceContent + ", registDate=" + registDate
				+ ", editDate=" + editDate + ", serviceTr=" + serviceTr + ", serviceRepeat=" + serviceRepeat
				+ ", repeatDate=" + repeatDate + ", status=" + status + ", upfileUrl=" + upfileUrl + "]";
	}


	public ServiceBoard(int serviceNo, String serviceUser, String categoryNo, String serviceTitle,
			String serviceContent, String registDate, String serviceTr, String serviceRepeat, String upfileUrl, int fileNo) {
		super();
		this.serviceNo = serviceNo;
		this.categoryNo = categoryNo;
		this.serviceTitle = serviceTitle;
		this.serviceContent = serviceContent;
		this.serviceUser = serviceUser;
		this.registDate = registDate;
		this.serviceTr = serviceTr;
		this.serviceRepeat = serviceRepeat;
		this.upfileUrl = upfileUrl;
		this.fileNo = fileNo;
	}
	
	
	
	

	

	
	
}
