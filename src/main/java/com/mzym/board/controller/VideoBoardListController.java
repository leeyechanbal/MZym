package com.mzym.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Video;
import com.mzym.common.paging.PageInfo;

/**
 * Servlet implementation class VideoBoardSelectController
 */
@WebServlet("/video.bo")
public class VideoBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoBoardListController() {
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
		
		listCount = new BoardService().selectVideoListCount();
		try {
	          currentPage = Integer.parseInt(request.getParameter("page"));
	      } catch (NumberFormatException e) {
	          currentPage = 1;
	      }
		pagingLimit = 5;
		boardLimit = 6;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage-1) / pagingLimit * pagingLimit + 1;
		endPage = startPage + pagingLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pagingLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Video> listBegin = new BoardService(). selectBeginnerVideoList();
		List<Video> list = new BoardService(). selectVideoList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("listBegin", listBegin);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/board/videoboard/videoBoardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
