package com.mzym.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.service.BoardService;
import com.mzym.common.paging.PageInfo;
import com.mzym.serviceBoard.service.ServiceBoardService;

/**
 * Servlet implementation class ProductBoardController
 */
@WebServlet("/Product.list")
public class ProductBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//------------------------- 페이징 처리 -------------------------------
				int listCount; 	
				int currentPage; 
				int pagingLimit; 
				int boardLimit; 
				int maxPage; 
				int startPage;
				int endPage; 

				
				listCount = new ServiceBoardService().selectListCount();
				
				
				try {
				    currentPage = Integer.parseInt(request.getParameter("page"));
				} catch (NumberFormatException e) {
				    
				    currentPage = 1;
				}
				
				pagingLimit = 5;
				
				boardLimit = 10;
				
				maxPage = (int)Math.ceil((double)listCount/ boardLimit);
				
				startPage = (currentPage-1) / pagingLimit * pagingLimit +1 ;
				
				
				endPage = startPage + pagingLimit -1;
				if(endPage>maxPage) {
					endPage = maxPage;
				}
				
				
				
				PageInfo pi =  new PageInfo(listCount,currentPage,pagingLimit,boardLimit,maxPage,startPage,endPage);
				
				List<BoardService> list = new BoardService().selectList(pi);
				
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				
				
				request.getRequestDispatcher("/views/board/controller/productBoardList.jsp").forward(request, response);
			
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
