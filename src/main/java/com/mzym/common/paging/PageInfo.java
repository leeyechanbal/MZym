package com.mzym.common.paging;

/**
 * @author 이예찬	
 * 페이징 처리를 위한 정보관리 클래스
 */
public class PageInfo {
	
	private int listCount; // 총 개시물의 갯수로 게시물의 종류에 따라 바뀜
	private int currentPage; // 현재 사용자가 요청한 페이지 수
	private int pagingLimit;  // 사용자에게 보여주 페이징바의 최대 갯수
	private int boardLimit;  // 사용자에게 보여줄 게시물 수
	private int maxPage;  // 총 페이징바 수
	private int startPage; // 사용자에게 보여줄 페이징바 시작 수
	private int endPage; // 사용자에게 보여줄 페이징바 끝수
	private int startBoard; // 쿼리 조회시 필요한 시작값
	private int endBoard; // 쿼리 조회시 필요한 끝값

	public PageInfo() {
		super();
	}

	public PageInfo(int listCount, int currentPage, int pagingLimit, int boardLimit, int maxPage, int startPage,
			int endPage, int startBoard, int endBoard) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pagingLimit = pagingLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.startBoard = startBoard;
		this.endBoard = endBoard;
	}

	public PageInfo(int listCount, int currentPage, int pagingLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pagingLimit = pagingLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getStartBoard() {
		return startBoard;
	}

	public void setStartBoard(int startBoard) {
		this.startBoard = startBoard;
	}

	public int getEndBoard() {
		return endBoard;
	}

	public void setEndBoard(int endBoard) {
		this.endBoard = endBoard;
	}



	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPagingLimit() {
		return pagingLimit;
	}

	public void setPagingLimit(int pagingLimit) {
		this.pagingLimit = pagingLimit;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pagingLimit=" + pagingLimit
				+ ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	} 
	
	
}
