package com.mzym.serviceBoard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.common.paging.PageInfo;
import com.mzym.serviceBoard.service.ServiceBoardService;
import com.mzym.serviceBoard.vo.ServiceBoard;

/**
 * Servlet implementation class TrainerServiceBoardListController
 */
@WebServlet("/serviceBoardList.trainer")
public class TrainerServiceBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerServiceBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int listCount;    // 게시글 총 갯수
		int currentPage; // 현재 페이지
		int pageLimit;   // 페이징바의 최대 갯수 (단위)
		int boardLimit;  // 페이지에 보여질 갯수
		
		int maxPage;     // 마지막페이지
		int startPage;   // 시작수
		int endPage;     // 끝수
		
		listCount = new ServiceBoardService().selectListCount();
		
		try {
		    currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
		    
		    currentPage = 1;
		}
		pageLimit = 5;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		List<ServiceBoard> list = new ServiceBoardService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/trainer/minjung/serviceBoardTR.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
