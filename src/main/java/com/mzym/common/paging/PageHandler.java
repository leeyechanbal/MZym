package com.mzym.common.paging;

/**
 * @author 이예찬
 *	페이징 처리를 하기 위한 모듈
 *	게시글의 중복되는 페이징 처리를 위해서 제작
 */
public class PageHandler {
	
	/**
	 * @author 이예찬
	 * @param listCount		(총 게시물의 수) => 각 게시물의 총 수를 쿼리문으로 받아 올것
	 * @param currentPage	(현재 사용자가 요청한 페이지 수)
	 * @param pagingLimit	(페이징바의 최대 수)
	 * @param boardLimit 	(사용자에게 보여줄 게시글 수)
	 * @return JSP에서 사용될 pageInfo 객체 반환
	 */
	public static PageInfo getPaging(int listCount, int currentPage, int pagingLimit, int boardLimit) {
			
		PageInfo info = null;
		
		if(boardLimit != 0 && pagingLimit != 0) {
			
			// syso는 원하는데로 페이징 처리가 되었는 확인 하라고 넣어놨어요
			
			System.out.println("listCount = " + listCount);
			System.out.println("currentPage = " + currentPage);
			System.out.println("pagingLimit = " + pagingLimit);
			System.out.println("boardLimit = " + boardLimit);
			
			
			// 총 페이징바 수
			int maxPage = (int)Math.ceil((double)listCount / boardLimit);
			System.out.println("maxPage = "+maxPage);
			// 사용자에게 보여줄 페이징바 시작 수
			int startPage = (currentPage - 1) / pagingLimit * pagingLimit + 1;
			System.out.println("startPage = "+startPage);
			// 사용자에게 보여줄 페이징바 끝수
			int endPage = startPage + pagingLimit - 1;
			System.out.println("endPage = " +endPage);
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			// 가져올 게시물의 시작 값
			int startBoard = (currentPage-1) * boardLimit + 1;
			System.out.println("startBoard = " + startBoard);
			// 가져올 개사물의 끝 값
			int endBoard = startBoard + boardLimit - 1 ;
			System.out.println("endBoard = "+ endBoard);
			info = new PageInfo(listCount, currentPage, pagingLimit, boardLimit, maxPage, startPage, endPage, startBoard, endBoard);
		}

		return info;
		}
}
