package com.mzym.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mzym.common.paging.PageInfo;
import com.mzym.member.model.vo.Member;
import com.mzym.mypage.model.service.MyPageService;
import com.mzym.mypage.model.vo.Payment;

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
	      try {
	          currentPage = Integer.parseInt(request.getParameter("page"));
	      } catch (NumberFormatException e) {
	          
	          currentPage = 1;
	      }
		pagingLimit = 5;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage-1) / pagingLimit * pagingLimit + 1;
		
		endPage = startPage + pagingLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pagingLimit, boardLimit, maxPage, startPage, endPage);
	    
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int paymentUser = loginUser.getUserNo();
		
		List<Payment>list = new MyPageService().selectList(pi, paymentUser);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/mypage/purchaseHistory.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
