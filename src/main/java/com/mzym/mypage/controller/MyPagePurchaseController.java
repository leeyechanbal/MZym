package com.mzym.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.common.paging.PageInfo;
import com.mzym.mypage.service.MyPageService;

/**
 * Servlet implementation class MyPagePurchaseController
 */
@WebServlet("/purchase.me")
public class MyPagePurchaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPagePurchaseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;
		int currentPage;
		int pagingLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new MyPageService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("page"));
		pagingLimit = 5;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage-1) / pagingLimit * pagingLimit + 1;
		endPage = startPage + pagingLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pagingLimit, boardLimit, maxPage, startPage, endPage);
		//List<Payment>list = new MyPageService().selectList(pi);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
