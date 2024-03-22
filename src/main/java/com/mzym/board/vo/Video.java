package com.mzym.board.vo;

public class Video {
	
	private int videoNo;
	private String videoTitle;
	private String link;
	private String staus;
	private int videoLevel;
			
			
	public Video(int videoNo, String videoTitle, String link, String staus, int videoLevel) {
		super();
		this.videoNo = videoNo;
		this.videoTitle = videoTitle;
		this.link = link;
		this.staus = staus;
		this.videoLevel = videoLevel;
	}

	public Video(int videoNo, String videoTitle, String link, int videoLevel) {
		super();
		this.videoNo = videoNo;
		this.videoTitle = videoTitle;
		this.link = link;
		this.videoLevel = videoLevel;
	}

	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}

	public String getVideoTitle() {
		return videoTitle;
	}

	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getStaus() {
		return staus;
	}

	public void setStaus(String staus) {
		this.staus = staus;
	}

	public int getVideoLevel() {
		return videoLevel;
	}

	public void setVideoLevel(int videoLevel) {
		this.videoLevel = videoLevel;
	}

	@Override
	public String toString() {
		return "Video [videoNo=" + videoNo + ", videoTitle=" + videoTitle + ", link=" + link + ", staus=" + staus
				+ ", videoLevel=" + videoLevel + "]";
	}
	
	
	

	
	
	
	
	
	

}
