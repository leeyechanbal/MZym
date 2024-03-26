package com.mzym.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Board;
import com.mzym.board.vo.BoardCategory;
import com.mzym.common.paging.PageInfo;

/**
 * Servlet implementation class FreeBoardListController
 */
@WebServlet("/freelist.bo")
public class FreeBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;		// 게시글 총 갯수
		int currentPage;	// 현재 페이지 (사용자가 요청한 페이지)
		int pagingLimit;	// 페이징바 페이지 최대 갯수 (몇개 단위씩)
		int boardLimit;		// 한 페이지에 보여질 게시글 최대갯수 (몇개 단위씩)
		int maxPage; 		// 가장마지막페이지(총페이지수) 
		int startPage;		// 사용자가 요청한 페이지 하단에 보여질 페이징바의 시작수
		int endPage;		// 사용자가 요청한 페이지 하단에 보여질 페이징바의 수
		
		int type = Integer.parseInt(request.getParameter("type"));
		
		listCount = new BoardService().selectFreeListCount(type);
		try {
	          currentPage = Integer.parseInt(request.getParameter("page"));
	      } catch (NumberFormatException e) {
	          currentPage = 1;
	      }
		pagingLimit = 5;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage-1) / pagingLimit * pagingLimit + 1;
		endPage = startPage + pagingLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이징바 데이터 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pagingLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Board> list = new BoardService().selectFreeList(pi, type);
		BoardCategory bc = new BoardService().selectBoardName(type);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("bc", bc);
		
		request.getRequestDispatcher("/views/board/freeboard/freeBoardList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
